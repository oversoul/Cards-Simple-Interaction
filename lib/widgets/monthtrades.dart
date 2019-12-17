import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:flutter/material.dart';

enum TradeSign {
  negative,
  stable,
  positive,
}

class MonthTrades extends StatelessWidget {
  String getTradeSignSymbol(TradeSign sign) {
    switch (sign) {
      case TradeSign.negative:
        return '- ';
        break;

      case TradeSign.positive:
        return '+ ';
        break;
      default:
        return '';
    }
  }

  Color getColor(TradeSign sign) {
    switch (sign) {
      case TradeSign.negative:
        return AppColors.redColor;
        break;

      case TradeSign.positive:
        return AppColors.greenColor;
        break;
      default:
        return AppColors.blueColor;
    }
  }

  Widget trade(TradeSign sign, int price, String title) {
    String signSymbol = getTradeSignSymbol(sign);
    Color color = getColor(sign);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$signSymbol\$$price",
            style: TextStyle(fontSize: 16, color: color),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: AppColors.grayColor),
          ),
        ],
      ),
    );
  }

  Widget negativeTrade(int price, String title) {
    return trade(TradeSign.negative, price, title);
  }

  Widget normalTrade(int price, String title) {
    return trade(TradeSign.stable, price, title);
  }

  Widget positiveTrade(int price, String title) {
    return trade(TradeSign.positive, price, title);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            negativeTrade(850, "Expanded"),
            normalTrade(550, "Balance"),
            positiveTrade(1400, "Income"),
          ],
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
