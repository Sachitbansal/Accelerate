import 'package:flutter/material.dart';
import 'dart:math';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  final String date;

  const BarChart(this.expenses, this.date);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (var price in expenses) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment(-1.0, -2.0),
            end: Alignment(1.0, 2.0),
            colors: [Color(0xFFEF9A9A), Color(0xFFFCE4EC), Color(0xFFE1BEE7)]),
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFBDBDBD).withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Progress Graph',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Bar(
                  label: 'Calories',
                  amountSpent: 35 + Random().nextInt(20),
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Water',
                  amountSpent: 10 + Random().nextInt(15),
                  mostExpensive: mostExpensive,
                ),
                Bar(
                  label: 'Jump Time',
                  amountSpent: 10 + Random().nextInt(15),
                  mostExpensive: mostExpensive,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final label;
  final amountSpent;
  final mostExpensive;
  final double _maxBarHeight = 400.0;

  const Bar({this.label, this.amountSpent, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          '${amountSpent.toStringAsFixed(1)}',
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6.0),
        Container(
          height: barHeight,
          width: 18.0,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
