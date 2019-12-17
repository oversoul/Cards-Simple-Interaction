import 'package:cards_simple_interaction/misc/creditcard.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final CreditCard card;

  CardWidget(this.card);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: card.color,
        boxShadow: [
          BoxShadow(
            color: card.color.withOpacity(0.4),
            blurRadius: 5.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Current Ballance\n",
              style: TextStyle(fontFamily: 'CircularStd'),
              children: <TextSpan>[
                TextSpan(
                  text: '\$' + card.balance,
                  style: TextStyle(fontSize: 28),
                )
              ],
            ),
          ),
          Spacer(),
          RichText(
            text: TextSpan(
              text: card.number + '\n',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'CircularStd',
                fontWeight: FontWeight.w600,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "${card.cvv}  ${card.date}",
                  style: TextStyle(
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.normal,
                    color: Colors.black26,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
