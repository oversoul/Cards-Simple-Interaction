import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:cards_simple_interaction/widgets/cards-slider.dart';
import 'package:cards_simple_interaction/widgets/transactions.dart';
import 'package:cards_simple_interaction/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: AppColors.grayColor),
        title: Text(
          "Cards",
          style: TextStyle(color: AppColors.grayColor, fontSize: 18),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            color: AppColors.grayColor,
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CardsSlider(),
            Transactions(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
