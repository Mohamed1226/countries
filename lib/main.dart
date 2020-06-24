import 'package:choosecountry/screens/cities_screen.dart';
import 'package:choosecountry/screens/countries_screen.dart';

import 'package:choosecountry/services/api.dart';
import 'package:flutter/material.dart';

void main() async {
//  var api = Api();
//  Map data = await (api.callApi());
//
//  for(int x=0; x<22; x++){
//    print(data['data'][x]['name']);
//  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "countries_screen": (context) => CountriesScreen(),
        "cities_screen": (context) => CitiesScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CountriesScreen(),
    );
  }
}
