import 'package:demo/widgets/chart/chart.dart';
import 'package:demo/widgets/expenses_list/expenses_list.dart';
import 'package:demo/models/expense.dart';
import 'package:demo/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.2,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Burger',
      amount: 5.4,
      category: Category.food,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Cinema',
      amount: 12.4,
      category: Category.leisure,
      date: DateTime.now(),
    )
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex =_registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mwidth = MediaQuery.of(context).size.width;
    final mheight = MediaQuery.of(context).size.height;

    Widget mainContent = const Center(
      child: Text('No expense found'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemove: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: mwidth < mheight ? Column(
          children: [
            Chart(expenses: _registeredExpenses),
            Expanded(child: mainContent),
          ],
        ):
        Row(
          children: [
            Expanded(child: Chart(expenses: _registeredExpenses)),
            Expanded(child: mainContent),
          ],
        ),
      ),
    );
  }
}
