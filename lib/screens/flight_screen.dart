import 'package:flutter/material.dart';

class FlightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flight Time')),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Container(
        child: Center(
          child: Text(
            'When is my flight?',
          ),
        ),
        color: Theme.of(context).accentColor,
      ),
    );
  }
}