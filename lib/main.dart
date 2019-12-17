import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:cards_simple_interaction/misc/creditcard.dart';
import 'package:cards_simple_interaction/pages/card-page.dart';
import 'package:cards_simple_interaction/pages/home-page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.bgColor, // navigation bar color
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "CircularStd",
          scaffoldBackgroundColor: AppColors.bgColor,
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: HomePage(),
        routes: {
          '/card': (BuildContext context) {
            final Map args = ModalRoute.of(context).settings.arguments;
            return CardPage(creditCards[args['index']]);
          },
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
