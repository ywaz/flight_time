import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/bloc/flightEvents.dart';
import 'package:flight_time/bloc/flightStates.dart';
import 'package:flutter/material.dart';
import 'package:flight_time/model/flight.dart';
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
          child: ListView.builder(
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

class FlightIcon extends StatelessWidget {
  final bool departure;
  final bool isRequested;
  const FlightIcon(
      {Key? key, required this.departure, required this.isRequested})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      .add(DeparturesRequested(depIata: 'fez'));
                } else if (!departure && !isRequested) {
                  BlocProvider.of<FlightBloc>(context)
                      .add(ArrivalsRequested(arrIata: 'fez'));
                }
              },
              icon: Icon(departure ? Icons.flight_takeoff : Icons.flight_land)),
        ),
      ),
    );
  }
}
