import 'package:choosecountry/screens/cities_screen.dart';
import 'package:choosecountry/services/api.dart';
import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  @override
  Widget build(BuildContext context) {
    Map data = {};
    List countries = [];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Counteries",style: TextStyle(color: Colors.black),),
        ),
        body: Container(
          color: Colors.black87,
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                data = snapshot.data;
                countries = data["data"];
                return ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (context, index) {
                      return RaisedButton(
                        elevation: 1,
                        color: Colors.white,
                        onPressed: () {
                          int id = countries[index]["id"];
                          Navigator.pushNamed(context, "cities_screen",
                              arguments: id);
                        },
                        child: Text(
                          countries[index]['name'],
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      );
                    });
              } else {
                return Container(
                    color: Colors.amber,
                    child: Center(
                        child: Text(
                      "data is loading",
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )));
              }
            },
            future: Api.callApi(),
          ),
        ));
  }
}
