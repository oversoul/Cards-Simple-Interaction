import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:flutter/material.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0, left: 30.0),
            child: Text(
              "Recent Transactions",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.darkGrayColor,
              ),
            ),
          ),
          Transaction(
            direction: TransactionDirection.Down,
            title: "iTunes Gift Card",
            date: "Today, 14:50",
            price: 120.35,
          ),
          Transaction(
            direction: TransactionDirection.Up,
            title: "Self Deposit Bank",
            date: "Today, 10:37",
            price: 520.23,
          ),
          Transaction(
            direction: TransactionDirection.Down,
            title: "Paypal Transfer",
            date: "Yesterday, 13:50",
            price: 100.00,
          ),
          Transaction(
            direction: TransactionDirection.Up,
            title: "Self Deposit Bank",
            date: "Yesterday, 08:24",
            price: 180.50,
          ),
        ],
      ),
    );
  }
}

enum TransactionDirection { Up, Down }

class Transaction extends StatelessWidget {
  final double price;
  final String title, date;
  final TransactionDirection direction;

  Transaction({this.direction, this.title, this.date, this.price});

  Widget icon() {
    Color color;
    IconData icon;
    if (direction == TransactionDirection.Down) {
      icon = Icons.trending_down;
      color = AppColors.redColor;
    } else {
      icon = Icons.trending_up;
      color = AppColors.greenColor;
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Icon(icon, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String sign = direction == TransactionDirection.Down ? '-' : '+';

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grayColor.withOpacity(0.3),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          icon(),
          content(),
          Text(
            "$sign \$${price.toStringAsFixed(2)}",
            style: TextStyle(color: AppColors.grayColor),
          ),
        ],
      ),
    );
  }

  Widget content() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: AppColors.grayColor, fontSize: 13.0),
          ),
          Text(
            date,
            style: TextStyle(color: AppColors.grayColor, fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
