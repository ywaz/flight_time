import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/bloc/flightStates.dart';
import 'package:flight_time/model/flight.dart';
import 'package:flight_time/widgets/flight_icon.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FlightWidget extends StatelessWidget {
  final List<Flight> listOfFlights;
  FlightWidget({required this.listOfFlights});
  @override
  Widget build(BuildContext context) {
    FlightState currentState = BlocProvider.of<FlightBloc>(context).state;
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlightIcon(
              departure: true,
              isRequested: currentState is DeparturesLoaded,
            ),
            FlightIcon(
              departure: false,
              isRequested: currentState is ArrivalsLoaded,
            ),
          ],
        ),
        Expanded(
          child: listOfFlights.length == 0
              ? Center(
                  child:
                      Container(child: Text('No flights found for your city!')),
                )
              : ListView.builder(
                  itemCount: listOfFlights.length,
                  itemBuilder: (ctx, element) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 2.0),
                        child: Card(
                          elevation: 5,
                          color: Theme.of(context).canvasColor,
                          child: ListTile(
                            leading: Text(currentState is DeparturesLoaded
                                ? listOfFlights[element].arrivalIata
                                : listOfFlights[element].departureIata),
                            title: Text(currentState is DeparturesLoaded
                                ? listOfFlights[element]
                                    .departureScheduled
                                    .toString()
                                : listOfFlights[element]
                                    .arrivalScheduled
                                    .toString()),
                            trailing: Text(listOfFlights[element].flightStatus),
                          ),
                        ));
                  }),
        )
      ]),
      color: Theme.of(context).accentColor,
    );
  }
}
