import 'dart:convert';
import 'package:http/http.dart' as http;

class FlightAPIClient {
  static const baseUrlFlight = "https://api.aviationstack.com";
  final apiKey = 'e52281328ef9c7b99773149c07fae8fd';
  final http.Client httpClient;

  FlightAPIClient(this.httpClient);

  Future<dynamic> getFlights({String depIata='', String arrIata='' ,String flightStatus='', String airlineName='', String depOrarr='departure'}) async{

    Map<String, String> flightSearchMap = {};
    if(depOrarr == 'departure' ){
      Map<String, String> flightSearchMap = {'dep_iata': depIata, 'flight_status': flightStatus, 'airline_name': airlineName , 'access_key':'e52281328ef9c7b99773149c07fae8fd' };
    }else if(depOrarr == 'arrival'){
      Map<String, String> flightSearchMap = {'arr_iata': arrIata, 'flight_status': flightStatus, 'airline_name': airlineName , 'access_key':'e52281328ef9c7b99773149c07fae8fd' };
    }else{
      return;
    }

    
    final http.Response response = await this.httpClient.get(Uri.http(baseUrlFlight, 'v1/flights', flightSearchMap));
    
    if(response.statusCode!=200){
      throw Exception('error getting departure flights from $depIata');
    }

    final jsonDecodedResponse = jsonDecode(response.body) as Map<dynamic,dynamic>;
    return jsonDecodedResponse['data'];
    }

    

}