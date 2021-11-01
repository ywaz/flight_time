
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class Flight extends Equatable {
  final String flightStatus,
      departureTimezone,
      departureIata,
      flightIata,
      arrivalIata,
      arrivalTimezone,
      arrivalScheduled,
      departureScheduled;

  final String? arrivalTerminal,
      departureTerminal,
      departureAirport,
      arrivalAirport,
      departureDelay,
      departureGate,
      arrivalDelay,
      arrivalGate,arrivalActual, departureActual, departureEstimated, arrivalEstimated;
      
      
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

//  DateTime.parse(flightItem['departure']['scheduled'])
// DateTime.parse(flightItem['arrival']['estimated'])

  static Flight fromJson(Map<dynamic,dynamic> flightItem) {
    print(flightItem['departure']['scheduled']);

    //ToDo: handle Actual arrival qnd departure
    return Flight(
        flightStatus: flightItem['flight_status'].toString(),
        flightIata: flightItem['flight']['iata'].toString(),
        departureAirport: flightItem['departure']['airport'].toString(),
        departureTimezone: flightItem['departure']['timezone'].split('/')[1], // split timezone initially as europe/paris
        departureTerminal: flightItem['departure']['terminal'].toString(),
        departureScheduled: DateFormat("MMM-d HH:mm").format(DateTime.parse(flightItem['departure']['scheduled'])),
        arrivalScheduled: DateFormat("MMM-d HH:mm").format(DateTime.parse(flightItem['arrival']['scheduled'])),
        arrivalEstimated:  DateFormat("MMM-d HH:mm").format(DateTime.parse(flightItem['arrival']['estimated'])),
        arrivalIata: flightItem['arrival']['iata'].toString(),
        arrivalTimezone: flightItem['arrival']['timezone'].split('/')[1],
        departureEstimated: DateFormat("MMM-d HH:mm").format(DateTime.parse(flightItem['departure']['estimated'])),
        departureIata: flightItem['departure']['iata'].toString(),
        arrivalActual: DateFormat("MMM-d HH:mm").format(DateTime.now())/*DateTime.parse(flightItem['arrival']['actual'])*/, 
        arrivalAirport: flightItem['arrival']['airport'].toString(),
        arrivalDelay: flightItem['arrival']['delay'].toString(),
        arrivalGate: flightItem['arrival']['gate'].toString(),
        arrivalTerminal: flightItem['arrival']['terminal'].toString(),
        departureActual: DateFormat("MMM-d HH:mm").format(DateTime.now())/*DateTime.parse(flightItem['departure']['actual'])*/,
        departureDelay: flightItem['departure']['delay'].toString(),
        departureGate: flightItem['departure']['gate'].toString());
  }
}
