import 'package:equatable/equatable.dart';

abstract class FlightEvent extends Equatable{
  FlightEvent([List props = const[]]);

  List<dynamic> get props => [];

} 

class DeparturesRequested extends FlightEvent {
  final String depIata;
  DeparturesRequested({required this.depIata});
}

class ArrivalsRequested extends FlightEvent {
  final String arrIata;
  ArrivalsRequested({required this.arrIata});
}

