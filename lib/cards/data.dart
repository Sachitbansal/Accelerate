import 'dart:math';
import 'package:flutter/material.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble() * 45,
  rand.nextDouble() * 100,
  rand.nextDouble() * 200,
  rand.nextDouble() * 100,
  rand.nextDouble() * 10,
  rand.nextDouble() * 10,
  rand.nextDouble() * 10,
];

_generateExpenses() {
  List<Expense> expenses = [
    Expense(name: 'Day 1', cost: 32),
    Expense(name: 'Day 2', cost: 50),
    Expense(name: 'Day 3', cost: 50),
    Expense(name: 'Day 4', cost: 50),
    Expense(name: 'Day 5', cost: 50),
    Expense(name: 'Day 6', cost: 50),
  ];
  return expenses;
}

List<Category> categories = [
  Category(name: 'Calories', maxAmount: 45, expenses: _generateExpenses()),
  Category(name: 'Jumps', maxAmount: 100, expenses: _generateExpenses()),
  Category(
      name: 'Duration', maxAmount: 500, expenses: _generateExpenses()),
  Category(name: 'Water', maxAmount: 100, expenses: _generateExpenses()),
];

class Category {
  final name;
  final  maxAmount;
  final  expenses;

  Category({this.name, this.maxAmount, this.expenses});
}

class Expense {
  final name;
  final cost;

  Expense({this.name, this.cost});
}

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.50) {
    return Theme.of(context).primaryColor;
  } else if (percent >= 0.25) {
    return Colors.orange;
  }
  return Colors.red;
}