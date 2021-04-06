
import 'package:flutter/material.dart';
import 'package:flight_time/model/flight.dart';

class FlightWidget extends StatelessWidget {
  final List<Flight> listOfFlights;
  FlightWidget({required this.listOfFlights});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
            FlightIcon(
              departure: true,
            ),
            FlightIcon(
              departure: false,
            ),
          ],
        ),
        Expanded(
                          child: ListView.builder(
                            itemCount: listOfFlights.length,
                            itemBuilder: (ctx, element){
                 return Card(elevation: 5,
                 child: Text(listOfFlights[element].flightIata),);
              }),
            )
      ]),
      color: Theme.of(context).accentColor,
    );
  }
}

class FlightIcon extends StatelessWidget {
  final bool departure;
  const FlightIcon({Key? key, required this.departure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: MediaQuery.of(context).size.width*0.45,
        child: Card(
          
          elevation: 5,
          color: Theme.of(context).accentColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: IconButton(

              onPressed: () {},
              icon: Icon(departure ? Icons.flight_takeoff : Icons.flight_land)),
        ),
      ),
    );
  }
}
