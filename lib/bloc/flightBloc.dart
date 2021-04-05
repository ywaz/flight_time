

import 'package:flight_time/model/flight.dart';
import 'package:flight_time/repositories/flightApiClient.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_time/bloc/flightEvents.dart';
import 'package:flight_time/bloc/flightStates.dart';


class FlightBloc extends Bloc<FlightEvent,FlightState>{

  final FlightAPIClient flightApiClient;

  FlightBloc({required this.flightApiClient}):super(InitialState());

  @override
  Stream<FlightState> mapEventToState(FlightEvent event) async*{

    if(event is DeparturesRequested){
      yield FlightsLoading();
      try{
        List<Flight> listOfFlights = await this.flightApiClient.getFlights(depIata: event.depIata);
        yield FlightsLoaded(listOfFlights: listOfFlights);
      }catch(_){
        yield FlightsInFailure();
      }
      
    }else if(event is ArrivalRequested){
      try{
        List<Flight> listOfFlights = await this.flightApiClient.getFlights(depIata: event.arrIata);
        yield FlightsLoaded(listOfFlights: listOfFlights);
      }catch(_){
        yield FlightsInFailure();
      }
    }
  } 
}