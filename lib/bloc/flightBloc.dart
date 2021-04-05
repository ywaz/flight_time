

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
         List<dynamic> listOfFlightsJson = await this.flightApiClient.getFlights(depIata:  event.depIata);
        final List<Flight> listOfFlights = listOfFlightsJson.map((e){
          print(e);
          return Flight.fromJson(e);}).toList();
        yield FlightsLoaded(listOfFlights: listOfFlights);
      }catch(error){
        yield FlightsInFailure();
        throw error;
      }
      
    }else if(event is ArrivalRequested){
      /* try{
        List<Flight> listOfFlights = await this.flightApiClient.getFlights(depIata: event.arrIata);
        yield FlightsLoaded(listOfFlights: listOfFlights);
      }catch(_){
        yield FlightsInFailure();
        
        
      } */
    }
  } 
}