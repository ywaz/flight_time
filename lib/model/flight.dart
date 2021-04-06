
import 'package:equatable/equatable.dart';

class Flight extends Equatable {
  String flightStatus,
      departureTimezone,
      departureIata,
      flightIata,
      arrivalIata,
      arrivalTimezone;

  String? arrivalTerminal,
      departureTerminal,
      departureAirport,
      arrivalAirport,
      departureDelay,
      departureGate,
      arrivalDelay,
      arrivalGate;

  DateTime departureScheduled,
      arrivalScheduled
      ;

  DateTime? arrivalActual, departureActual, departureEstimated, arrivalEstimated;

  @override
  List<Object> get props => [
        flightStatus,
        departureTimezone,
        departureIata,
        flightIata,
        arrivalIata,
        arrivalTimezone,
        departureScheduled,
        
        arrivalScheduled,
        
      ];

  Flight({
    required this.flightStatus,
    required this.flightIata,
    required this.departureIata,
    required this.departureTimezone,
    this.departureTerminal,
    required this.departureScheduled,
    required this.departureEstimated,
    required this.arrivalEstimated,
    required this.arrivalScheduled,
    required this.arrivalIata,
    required this.arrivalTimezone,
    this.arrivalTerminal,
    this.arrivalActual,
    this.departureActual,
    this.departureAirport,
    this.arrivalAirport,
    this.departureDelay,
    this.arrivalDelay,
    this.departureGate,
    this.arrivalGate,
  });

  static Flight fromJson(Map<dynamic,dynamic> flightItem) {

    //ToDo: handle Actual arrival qnd departure
    return Flight(
        flightStatus: flightItem['flight_status'].toString(),
        flightIata: flightItem['flight']['iata'].toString(),
        departureAirport: flightItem['departure']['airport'].toString(),
        departureTimezone: flightItem['departure']['timezone'].toString(),
        departureTerminal: flightItem['departure']['terminal'].toString(),
        departureScheduled: DateTime.parse(flightItem['departure']['scheduled']),
        arrivalScheduled: DateTime.parse(flightItem['arrival']['scheduled']),
        arrivalEstimated: DateTime.parse(flightItem['arrival']['estimated']),
        arrivalIata: flightItem['arrival']['iata'].toString(),
        arrivalTimezone: flightItem['arrival']['timezone'].toString(),
        departureEstimated: DateTime.parse(flightItem['arrival']['estimated']),
        departureIata: flightItem['departure']['iata'].toString(),
        arrivalActual: DateTime.now() /*DateTime.parse(flightItem['arrival']['actual'])*/, 
        arrivalAirport: flightItem['arrival']['airport'].toString(),
        arrivalDelay: flightItem['arrival']['delay'].toString(),
        arrivalGate: flightItem['arrival']['gate'].toString(),
        arrivalTerminal: flightItem['arrival']['terminal'].toString(),
        departureActual: DateTime.now()/*DateTime.parse(flightItem['departure']['actual'])*/,
        departureDelay: flightItem['departure']['delay'].toString(),
        departureGate: flightItem['departure']['gate'].toString());
  }
}
