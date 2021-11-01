import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/bloc/flightStates.dart';
import 'package:flight_time/bloc/flightEvents.dart';
import 'package:flight_time/widgets/flight_widget.dart';
import 'package:flight_time/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightBloc, FlightState>(
      builder: (ctx, state) {
        return Scaffold(
          appBar: AppBar(
            title: (state is DeparturesLoaded ||
                  state is ArrivalsLoaded ||
                  state is FlightsLoading)
              ? Center(child: Text(state.props.first)): const Center(child: Text('Flight Time')),
            backgroundColor: Theme.of(context).canvasColor,
            actions: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<FlightBloc>(context)
                              .add(BackToHome());
                        },
                        icon: Icon(Icons.autorenew))
                  ],
          ), 
          body: state is InitialState
              ? SearchBarWidget()
              : state is FlightsLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is DeparturesLoaded
                      ? FlightWidget(listOfFlights: state.listOfFlights)
                      : state is ArrivalsLoaded
                          ? FlightWidget(listOfFlights: state.listOfFlights)
                          : Center(
                              child: Text('Error'),
                            ),
        );
      },
    );
  }
}

