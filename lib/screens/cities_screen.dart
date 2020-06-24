import 'package:choosecountry/services/api.dart';

import 'package:flutter/material.dart';

class CitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int CountryID = ModalRoute.of(context).settings.arguments;
    Map data = {};
    List countries = [];
    List cites = [];

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Text("Cities".toUpperCase()),
        ),
        body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              data = snapshot.data;
              countries = data["data"];
              for (int x = 0; x < countries.length; x++) {
                if (countries[x]["id"] == CountryID) {
                  //this SELECTED Country
                  cites = countries[x]["cities"];
                }
              }
              if (cites.length > 0) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(child: Text(cites[index]["name"],style: TextStyle(
                        fontSize: 25,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),)),
                    );
                  },
                  itemCount: cites.length,
                );
              } else {
                //Empty cities
                return Center(child: Text("no cities",style: TextStyle(
                  color: Colors.deepPurple,
                      fontSize: 25,
                ),));
              }
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
        ));
  }
}
