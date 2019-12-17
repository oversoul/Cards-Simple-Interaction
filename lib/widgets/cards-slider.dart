import 'package:cards_simple_interaction/misc/creditcard.dart';
import 'package:cards_simple_interaction/widgets/card-widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CardsSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> cardSlides = [];
    creditCards.asMap().forEach((int i, CreditCard card) {
      cardSlides.add(
        Hero(
          tag: "card-${card.id}",
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/card', arguments: {'index': i});
            },
            child: CardWidget(card),
          ),
        ),
      );
    });

    return Container(
      height: 240.0,
      width: double.infinity,
      child: CarouselSlider(
        autoPlay: false,
        viewportFraction: .87,
        items: cardSlides,
        height: 200.0,
      ),
    );
  }
}
