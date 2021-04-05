
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
      departureEstimated,
      arrivalScheduled,
      arrivalEstimated;

  DateTime? arrivalActual, departureActual;

  @override
  List<Object> get props => [
        flightStatus,
        departureTimezone,
        departureIata,
        flightIata,
        arrivalIata,
        arrivalTimezone,
        departureScheduled,
        departureEstimated,
        arrivalScheduled,
        arrivalEstimated,
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

  static Flight fromJson(dynamic flightItem) {
    return Flight(
        flightStatus: flightItem['flight_status'],
        flightIata: flightItem['flight']['iata'],
        departureAirport: flightItem['departure']['airport'],
        departureTimezone: flightItem['departure']['timezone'],
        departureTerminal: flightItem['departure']['terminal'],
        departureScheduled: flightItem['departure']['scheduled'] as DateTime,
        arrivalScheduled: flightItem['arrival']['scheduled'] as DateTime,
        arrivalEstimated: flightItem['arrival']['estimated'] as DateTime,
        arrivalIata: flightItem['arrival']['iata'],
        arrivalTimezone: flightItem['arrival']['timezone'],
        departureEstimated: flightItem['arrival']['estimated'] as DateTime,
        departureIata: flightItem['departure']['iata'],
        arrivalActual: flightItem['arrival']['actual'] as DateTime,
        arrivalAirport: flightItem['arrival']['airport'],
        arrivalDelay: flightItem['arrival']['delay'],
        arrivalGate: flightItem['arrival']['gate'],
        arrivalTerminal: flightItem['arrival']['terminal'],
        departureActual: flightItem['departure']['actual'] as DateTime,
        departureDelay: flightItem['departure']['delay'],
        departureGate: flightItem['departure']['gate']);
  }
}
