import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
    } catch (e) {
      print("error");
    }
  }

  void fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://samples.openweathermap.org/data/2.5/weather?q=London&appid=b1b15e88fa797225412429c1c50c122a1"));
      if (response.statusCode == 200) {
        String jsonData = response.body;
        var weather = jsonDecode(jsonData)['weather'][0]['description'];
        print(weather);

        var wind = jsonDecode(jsonData)['weather']['speed'];
        print(weather);

        var id = jsonDecode(jsonData)['id'];
        print(weather);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getlocation();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Get My Location"),
        onPressed: () {},
      )),
    );
  }
}
