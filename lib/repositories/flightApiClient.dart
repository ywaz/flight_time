import 'dart:convert';
import 'package:http/http.dart' as http;

class FlightAPIClient {
  static const baseUrlFlight = "api.aviationstack.com";
  final apiKey = 'e52281328ef9c7b99773149c07fae8fd';
  final http.Client httpClient;

  FlightAPIClient(this.httpClient);

  Future<List<dynamic>> getFlights({String depIata='', String arrIata='' ,String flightStatus='', String airlineName='', String depOrarr='departure'}) async{

    Map<String, String> flightSearchMap = {};
    if(depOrarr == 'departure' ){
      flightSearchMap = {'dep_iata': depIata, 'flight_status': flightStatus, 'airline_name': airlineName , 'access_key':'e52281328ef9c7b99773149c07fae8fd' };
    }else if(depOrarr == 'arrival'){
      flightSearchMap = {'arr_iata': arrIata, 'flight_status': flightStatus, 'airline_name': airlineName , 'access_key':'e52281328ef9c7b99773149c07fae8fd' };
    }

    final url = Uri.http(baseUrlFlight, '/v1/flights', flightSearchMap);
    print(url);
    http.Response response;
    try{
       response = await httpClient.get(url);
    }catch(error){
      print("an error was faced"); 
      throw (error);  
      //Exception('error getting departure flights from $depIata');
    }
    
    final jsonDecodedResponse = jsonDecode(response.body) as Map<dynamic,dynamic>;
    return jsonDecodedResponse['data'];
    }

    

}