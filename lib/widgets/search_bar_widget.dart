import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/bloc/flightEvents.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: TextFormField(
            controller: _controller,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'Please provide a city';
              }
            },
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_controller.text.isNotEmpty) {
                        BlocProvider.of<FlightBloc>(context).add(
                            DeparturesRequested(depIata: _controller.text));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('A city must be provided'),
                          ),
                        );
                      }
                    },
                    icon: Icon(Icons.search)),
                labelText: 'City',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ),
      color: Theme.of(context).accentColor,
    );
  }
}
