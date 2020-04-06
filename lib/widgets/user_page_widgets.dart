import 'package:flutter/material.dart';

class UserButton extends StatelessWidget {
  final String name;
  final int value;

  UserButton({
    this.name,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 30),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Text(name),
          Text(
            value.toString(),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}