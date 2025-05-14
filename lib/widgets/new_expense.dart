import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            maxLength: 50, 
            decoration: InputDecoration(
              label: Text("Title")
            ),
          ),
          Row(
            children: [
              const Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
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
              TextButton(onPressed: () {}, 
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