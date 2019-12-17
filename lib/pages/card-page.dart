import 'package:cards_simple_interaction/widgets/bottom-navigation.dart';
import 'package:flutter/material.dart';
import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:cards_simple_interaction/misc/creditcard.dart';
import 'package:cards_simple_interaction/widgets/card-widget.dart';
import 'package:cards_simple_interaction/widgets/monthtrades.dart';
import 'package:cards_simple_interaction/widgets/setting-option.dart';

class CardPage extends StatefulWidget {
  final CreditCard card;

  CardPage(this.card);

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  double _firstOptionTop = 80;
  double _secondOptionTop = 30;
  double _thirdOptionTop = 10;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 1);
    WidgetsBinding.instance.addPostFrameCallback((_) => loopOnce(context));
  }

  Future<void> loopOnce(BuildContext context) async {
    setState(() {
      _firstOptionTop = 0;
    });
    await Future.delayed(Duration(milliseconds: 50));
    setState(() {
      _secondOptionTop = 0;
    });
    await Future.delayed(Duration(milliseconds: 50));
    setState(() {
      _thirdOptionTop = 0;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Transform.translate(
          offset: Offset(0.0, -100.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Hero(
                  tag: "card-${widget.card.id}",
                  child: CardWidget(widget.card),
                ),
                SizedBox(height: 40.0),
                tabs(),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: settings(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget tabs() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
              labelColor: AppColors.darkGrayColor,
              unselectedLabelColor: AppColors.mutedGrayColor,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  width: 4.0,
                  color: widget.card.color,
                ),
                insets: EdgeInsets.symmetric(horizontal: 55.0),
              ),
              labelStyle: TextStyle(fontSize: 12),
              controller: _controller,
              tabs: [
                Tab(text: 'February'),
                Tab(text: 'March'),
                Tab(text: 'April'),
              ],
            ),
          ),
          Container(
            height: 160.0,
            padding: EdgeInsets.all(40.0),
            child: TabBarView(
              controller: _controller,
              children: <Widget>[
                MonthTrades(),
                MonthTrades(),
                MonthTrades(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> settings() {
    return [
      Text(
        "Card Settings",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.darkGrayColor,
        ),
      ),
      AnimatedContainer(
        padding: EdgeInsets.only(top: _firstOptionTop),
        duration: Duration(milliseconds: 300),
        child: SettingOption(title: "Contactless Payment", state: true),
      ),
      AnimatedContainer(
        padding: EdgeInsets.only(top: _secondOptionTop),
        duration: Duration(milliseconds: 300),
        child: SettingOption(title: "Online Payment", state: false),
      ),
      AnimatedContainer(
        padding: EdgeInsets.only(top: _thirdOptionTop),
        duration: Duration(milliseconds: 300),
        child: SettingOption(title: "ATM Withdraws", state: true),
      ),
    ];
  }
}
