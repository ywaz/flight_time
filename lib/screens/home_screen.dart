import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/bloc/flightStates.dart';
import 'package:flight_time/bloc/flightEvents.dart';
import 'package:flight_time/widgets/flight_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBloc, FlightState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: (state is DeparturesLoaded || state is ArrivalsLoaded || state is FlightsLoading)
              ? AppBar(
                  title: Center(child: Text('Fez')),
                  backgroundColor: Theme.of(context).canvasColor,
                )
              : AppBar(
                  title: Center(child: Text('Flight Time')),
                  backgroundColor: Theme.of(context).canvasColor,
                ),
          body: state is InitialState
              ? Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  BlocProvider.of<FlightBloc>(context)
                                      .add(DeparturesRequested(depIata: 'fez'));
                                },
                                icon: Icon(Icons.search)),
                            labelText: 'City',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                )
              : state is FlightsLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is DeparturesLoaded
                      ? FlightWidget(listOfFlights: state.listOfFlights)
                      :state is ArrivalsLoaded?
                      FlightWidget(listOfFlights: state.listOfFlights)
                      : Center(
                          child: Text('Error'),
                        ),
        );
      },
    );
  }
}
