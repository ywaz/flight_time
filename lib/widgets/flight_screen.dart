import 'package:flutter/material.dart';

class FlightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Text(
            'When is my flight?',
          ),
        ),
        color: Theme.of(context).accentColor,
      
    );
  }
}