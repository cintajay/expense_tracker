import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleFieldController = TextEditingController();
  final _amountFieldController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleFieldController.dispose();
    _amountFieldController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
  final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );

    setState(() {
      _selectedDate = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleFieldController,
            maxLength: 50, 
            decoration: const InputDecoration(
              label: Text("Title")
            ),
          ),
          Row(
            children: [
              //the 2 Expanded children occupy equal space
              Expanded(
                child: TextField(
                  controller: _amountFieldController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text("\$"),
                    label: Text("Amount",
                    )
                  )
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Row(
                  //without Expanded, the alignments don't work but no error otherwise
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_selectedDate == null ? 'No date selected': formatter.format(_selectedDate!)),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              TextButton(onPressed: () {
                Navigator.pop(context);
              }, 
              child: Text("Cancel")
              ),
              ElevatedButton(onPressed: () {}, 
              child: Text("Save Expense")
              )
            ],
          )
        ],
      ),
    );
  }
}