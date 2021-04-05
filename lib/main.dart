import 'package:flight_time/bloc/flightBloc.dart';
import 'package:flight_time/repositories/flightApiClient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flight_time/bloc/simple_bloc_observer.dart';
import 'package:http/http.dart' as http;
import 'package:flight_time/screens/home_screen.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  final FlightAPIClient flightAPIClient = FlightAPIClient(http.Client());
  runApp(MyApp(flightAPIClient: flightAPIClient));
}

class MyApp extends StatelessWidget {
  final FlightAPIClient flightAPIClient;
  MyApp({required this.flightAPIClient});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight data app',
      theme: ThemeData(
        primaryColor: Colors.grey,
        accentColor: Colors.amberAccent,
        canvasColor: Colors.yellow[200],

        fontFamily: 'Montserrat',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Bebas',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), 
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider<FlightBloc>(
        create: (ctx) => FlightBloc(flightApiClient: this.flightAPIClient),
        child: HomeScreen(),
      ),
    );
  }
}

