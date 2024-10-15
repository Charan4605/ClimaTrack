import 'package:http/http.dart' as http;
import 'dart:convert';

class Worker {
  String location;

 late String temp;
 late String humidity;
 late String windSpeed;
 late String description;
 late String main;
 late String icon ;

  Worker({required this.location});

  // Method
  Future<void> getData() async {
 try {
   final response = await http.get(Uri.parse(
       "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=a93f7462d1064b0e0551dca15784b161&units=metric"));

   Map data = jsonDecode(response.body);
   print(data);
   //Getting Temp,Humidity
   Map tempData = data['main'];
   String getHumidity = tempData['humidity'].toString();
   double getTemp = tempData['temp']  ;

//Getting air_speed
   Map wind = data['wind'];
   double getairSpeed = wind["speed"]/0.27777777777778;


   //Getting Description
   List weatherData = data['weather'];
   Map weatherMainData = weatherData[0];
   String getmainDes = weatherMainData['main'];
   String getDesc = weatherMainData["description"];




   //Assigning Values
   temp = getTemp.toString(); //C
   humidity = getHumidity; // %
   windSpeed = getairSpeed.toString(); //km/hr
   description = getDesc;
   main = getmainDes;
   icon = weatherMainData["icon"].toString();

 }
 catch(e){
   print(e) ;
   temp =  "NA "  ;
   humidity = "NA";
   windSpeed = "NA";
   description = "Can't find data";
   main = "Can't find data";
   icon = "NA";


 }
      }
    }


