import 'package:flutter/material.dart';
import 'package:weather/Activity/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String temp;
  late String hum;
  late String airSpeed;
  late String main;
  late String des;
  late String icon;
  String city = "hyderabad";





  void startApp( String city) async {
    Worker instance = Worker(location: city);

    await instance.getData();

      temp = instance.temp;
      hum = instance.humidity;
      airSpeed = instance.windSpeed;
      main = instance.main;
      des = instance.description;
      icon = instance.icon;



    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context,'/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : airSpeed,
        "des_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,




      } );
    });

  }
  @override
  void initState() {
    super.initState();
    // Start the app with the default city on initialization


  }
  @override
  Widget build(BuildContext context) {

         // Map search = ModalRoute.of(context)?.settings.arguments as Map;
         // if(search?.isNotEmpty  ?? false )
         // {
         //      city = search['searchText'];
         // }
         final Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
         if (search?.isNotEmpty??false) {
           city = search?['searchText'];
         }
        startApp(city) ;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/770b805d5c99c7931366c2e84e88f251.png",
                height: 400,
                width: 300,
              ),
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 30.0,
              ),
              const SizedBox(height: 30),
              const Text(
                "ClimaTrack",
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 100),
              const Text(
                "Made By Charan",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
