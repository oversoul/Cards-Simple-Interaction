import 'package:flutter/material.dart';

class CreditCard {
  final int id;
  final Color color;
  final String cvv, date, balance, number;

  CreditCard(
      {this.id, this.balance, this.number, this.cvv, this.date, this.color});
}

final List<CreditCard> creditCards = [
  CreditCard(
    id: 1,
    balance: '4270',
    number: '4500 2105 8942 2577',
    cvv: '628',
    date: '11/2023',
    color: Color(0xff8ca3fd),
  ),
  CreditCard(
    id: 2,
    balance: '3500',
    number: '4510 1090 7904 3620',
    cvv: '870',
    date: '04/2023',
    color: Color(0xff87bffe),
  ),
  CreditCard(
    id: 3,
    balance: '323',
    number: '4815 5762 4081 0958',
    cvv: '134',
    date: '12/2020',
    color: Color(0xffffa489),
  ),
];
