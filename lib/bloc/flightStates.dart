import 'package:equatable/equatable.dart';
import 'package:flight_time/model/flight.dart';

abstract class FlightState extends Equatable {
  FlightState([List props = const []]);

  List<dynamic> get props => [];
}

class InitialState extends FlightState {}

class FlightsLoading extends FlightState {
  final String city;
  FlightsLoading({required this.city});

  List<String> get props => [city];
}

class DeparturesLoaded extends FlightState {
  final List<Flight> listOfFlights;
  final String city; 
  DeparturesLoaded({required this.city, required this.listOfFlights});

  @override
  List<dynamic> get props => [city, ...listOfFlights];
}

class ArrivalsLoaded extends FlightState {
  final String city;
  final List<Flight> listOfFlights;

  ArrivalsLoaded({required this.city, required this.listOfFlights});

  @override
  List<dynamic> get props => [city, ...listOfFlights];
}

class FlightsInFailure extends FlightState {}
