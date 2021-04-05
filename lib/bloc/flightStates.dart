

import 'package:equatable/equatable.dart';
import 'package:flight_time/model/flight.dart';

abstract class FlightState extends Equatable{

  FlightState([List props= const[]]);

  List<dynamic> get props =>[];
}

class InitialState extends FlightState{}

class FlightsLoading extends FlightState{}

class FlightsLoaded extends FlightState{

final List<Flight> listOfFlights;

FlightsLoaded({required this.listOfFlights});

@override
List<Flight> get props=>listOfFlights;
}

class FlightsInFailure extends FlightState{}