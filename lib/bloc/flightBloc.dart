import 'package:flight_time/model/flight.dart';
import 'package:flight_time/repositories/flightApiClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_time/bloc/flightEvents.dart';
import 'package:flight_time/bloc/flightStates.dart';

class FlightBloc extends Bloc<FlightEvent, FlightState> {
  final FlightAPIClient flightApiClient;

  FlightBloc({required this.flightApiClient}) : super(InitialState());

  @override
  Stream<FlightState> mapEventToState(FlightEvent event) async* {
    if (event is DeparturesRequested) {
      yield FlightsLoading(city: event.depIata);
      try {
        //ToDo: handle different search criteria
        List<dynamic> listOfDeparturesJson = await this
            .flightApiClient
            .getFlights(depIata: event.depIata);
        final List<Flight> listOfDepartures = listOfDeparturesJson.map((e) {
          //print(e);
          return Flight.fromJson(e);
        }).toList();
        // print(listOfFlights);
        yield DeparturesLoaded(city: event.depIata,listOfFlights: listOfDepartures);
      } catch (error) {
        yield FlightsInFailure();
        throw error;
      }
    } else if (event is ArrivalsRequested) {
      yield FlightsLoading(city: event.arrIata);
      try {
        List<dynamic> listOfArrivalsJson = await this
            .flightApiClient
            .getFlights(arrIata: event.arrIata, depOrarr: 'arrival');
        final List<Flight> listOfArrivals = listOfArrivalsJson.map((e) {
          return Flight.fromJson(e);
        }).toList();
        yield ArrivalsLoaded(city: event.arrIata,listOfFlights: listOfArrivals);
      } catch (error) {
        yield FlightsInFailure();
        throw error;
      }
    }else if (event is BackToHome){
      yield InitialState();
    }
  }
}
