import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class ExpensesDashboard extends StatefulWidget {
  const ExpensesDashboard({super.key});

  @override
  State<ExpensesDashboard> createState() => _ExpensesDashboardState();
}

class _ExpensesDashboardState extends State<ExpensesDashboard> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Food",
      amount: 80,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Cinema",
      amount: 20,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true, //make it full screen
      context: context, //context is available in State class
      builder:
          (ctx) => NewExpense(  //ctx is different from context
            onAddExpense: _addExpense,
          ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

    void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text('Expense deleted.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget dashBoardBody = Center(
      child: Text("No expenses found"),
    );

    if (_registeredExpenses.isNotEmpty) {
      dashBoardBody = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: dashBoardBody
          ),
        ],
      )
    );
  }
}