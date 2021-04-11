import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/bloc/flightStates.dart';
import 'package:flight_time/bloc/flightEvents.dart';

class FlightIcon extends StatelessWidget {
  final bool departure;
  final bool isRequested;
  const FlightIcon(
      {Key? key, required this.departure, required this.isRequested})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlightState currentState = BlocProvider.of<FlightBloc>(context).state;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        child: Card(
          elevation: this.isRequested ? 8 : 2,
          color: Theme.of(context).accentColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: IconButton(
              onPressed: () {
                if (departure && !isRequested) {
                  BlocProvider.of<FlightBloc>(context)
                      .add(DeparturesRequested(depIata: currentState.props.first));
                } else if (!departure && !isRequested) {
                  BlocProvider.of<FlightBloc>(context)
                      .add(ArrivalsRequested(arrIata: currentState.props.first));
                }
              },
              icon: Icon(departure ? Icons.flight_takeoff : Icons.flight_land)),
        ),
      ),
    );
  }
}
