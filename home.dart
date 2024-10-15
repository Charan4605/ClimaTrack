import 'dart:math';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("This is init state");
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
    print("DISPOSED");
  }

  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Mumbai", "Chennai", "Hyderabad", "Dharwad", "Kolkata", "Bangalore",
      "Pune", "Thiruvananthapuram", "Kochi", "Madurai", "Aurangabad",
      "Vijayawada", "Vadodara", "Ahmedabad", "Rajahmundry", "Mangalore",
      "Hubli", "Delhi", "Jamshedpur", "Patna", "Nagpur", "Ludhiana",
      "Bhopal", "Jaipur", "Surat", "Kanpur", "Visakhapatnam", "Coimbatore",
      "Indore", "Agra", "Amritsar", "Nashik", "Ranchi", "Meerut", "Jodhpur",
      "Raipur", "Guwahati", "Dehradun", "Chandigarh", "Gwalior", "Vellore",
      "Gorakhpur", "Udaipur", "Allahabad", "Varanasi", "Jabalpur", "Ajmer",
      "Kolhapur", "New York", "Los Angeles", "Chicago", "Miami", "Toronto",
      "Vancouver", "London", "Paris", "Berlin", "Tokyo", "Shanghai", "Beijing",
      "Seoul", "Bangkok", "Sydney", "Melbourne", "Dubai", "Cape Town",
      "Buenos Aires", "Rio de Janeiro", "Moscow", "Rome", "Madrid",
      "Barcelona", "Lisbon", "Amsterdam", "Vienna", "Zurich", "Stockholm",
      "Helsinki", "Oslo", "Copenhagen", "Dublin", "Auckland", "Wellington",
      "Hong Kong", "Singapore", "Kuala Lumpur", "Jakarta", "Manila", "Taipei",
      "Mexico City", "Lima", "Santiago", "Bogota"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    // String temp = ((info['temp_value']).toString()) ;
    // String wind = ((info['air_speed_value']).toString()) ;
    // if(temp=="NA"){
    //   print("AJgfdj") ;
    // }
    // else {
    String icon = info['icon_value'];

    String temp = ((info['temp_value']).toString()).substring(0,2);
    // }
    if(icon=="NA"){
         icon= "09d" ;
    }
    else{     }
      String wind = ((info['air_speed_value']).toString()).substring(0,2);
    //
    String main = ((info['main_value']).toString());
    String getcity = info['city_value'] ;
    String hum = (info['hum_value']).toString().substring(0, 2);

    print(temp) ;
    print(main);
    print(icon);
    print(getcity) ;
    print(hum);
    print(wind);


    return Scaffold(
    resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30),
        child: AppBar(
          title: Text("ClimaTrack ",style: TextStyle(fontWeight: FontWeight.bold , color: Colors.black, fontSize: 20),),
          backgroundColor: Colors.orangeAccent,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.5],
                colors: [
                  Colors.orangeAccent,
                  Colors.lightBlueAccent,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(2),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "")==""){
                            print("Blank search") ;
                          }
                          else {
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText": searchController.text,
                            });
                          }
                        },
        
        
                        child: Container(
                          child: Icon(
                            Icons.search_sharp,
                            size: 30,
                          ),
                          margin: EdgeInsets.fromLTRB(6, 6, 6, 6),
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: TextField(
                          controller:   searchController  ,
        
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "   Search $city ",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 90,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
        
        
                                 Image.network("https://openweathermap.org/img/wn/$icon@2x.png") ,
                                    SizedBox(width: 30),
        
                                Column(
                                  children: [
                                    Text(
                                      main,
                                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "in $getcity",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 190,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thermostat_rounded,
                                      size: 50,
                                    ),
                                    Text(
                                      "    Temperature",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(temp, style: TextStyle(fontSize: 60)),
                                    Text(
                                      "°C",
                                      style: TextStyle(fontSize: 60),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 180,
                          width: 180,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.water_drop_rounded,
                                    size: 30,
                                  ),
                                  Text(
                                    "  Humidity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    hum,
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  Text(
                                    " %",
                                    style: TextStyle(fontSize: 35),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 180,
                          width: 180,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.air_rounded,
                                    size: 30,
                                  ),
                                  Text(
                                    "Wind Speed",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(wind, style: TextStyle(fontSize: 50)),
                                  Text(
                                    "KM/H",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25,) ,
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("MADE BY CHARAN"),
                      Text("Data provided by Open Weather Map"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
