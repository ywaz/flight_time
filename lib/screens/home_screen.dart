import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flight Time')),
        backgroundColor: Theme.of(context).canvasColor,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: TextFormField(
              decoration: InputDecoration(
                  suffixIcon:
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  labelText: 'City',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          ),
        ),
        color: Theme.of(context).accentColor,
      ),
    );
  }
}
