import 'package:cards_simple_interaction/misc/colors.dart';
import 'package:flutter/material.dart';

class SettingOption extends StatefulWidget {
  final bool state;
  final String title;

  SettingOption({this.state = false, this.title});

  @override
  _SettingOptionState createState() => _SettingOptionState();
}

class _SettingOptionState extends State<SettingOption> {
  bool _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  Color getColor() {
    return _state ? AppColors.darkGrayColor : AppColors.mutedGrayColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(color: getColor()),
          ),
          Switch(
            value: _state,
            activeColor: Colors.white,
            activeTrackColor: AppColors.blueColor,
            inactiveTrackColor: Color(0xffe5ebf2),
            inactiveThumbColor: Color(0xfffefffd),
            onChanged: (value) {
              setState(() {
                _state = value;
              });
            },
          )
        ],
      ),
    );
  }
}
