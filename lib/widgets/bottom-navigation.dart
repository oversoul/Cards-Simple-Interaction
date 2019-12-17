import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(Icons.home, color: AppColors.grayColor),
            Icon(Icons.person_outline, color: AppColors.grayColor),
            Icon(Icons.credit_card, color: AppColors.blueColor),
            Icon(Icons.account_balance, color: AppColors.grayColor),
            Icon(Icons.account_balance_wallet, color: AppColors.grayColor),
          ],
        ),
      ),
    );
  }
}
