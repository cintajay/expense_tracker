import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleFieldController = TextEditingController();
  final _amountFieldController = TextEditingController();

  @override
  void dispose() {
    _titleFieldController.dispose();
    _amountFieldController.dispose();
    super.dispose();
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
              Text('No date selected'),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
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