import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 70,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Developed by Enigmart",
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Luigi Cuomo",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}