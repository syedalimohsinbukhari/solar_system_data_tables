import 'package:flutter/material.dart';

import 'components/utilities.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solar System Data Tables',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Please select a celestial object.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            ExpandedButton(
              text: "Sun",
              button: 'PPSun',
            ),
            ExpandedButton(
              text: "Mercury",
              button: 'PPMercury',
            ),
            ExpandedButton(
              text: 'Venus',
              button: 'PPVenus',
            ),
            ExpandedButton(
              text: 'Earth',
              button: 'PPEarth',
            ),
            ExpandedButton(
              text: 'Mars',
              button: 'PPMars',
            ),
            ExpandedButton(
              text: 'Jupiter',
              button: 'PPJupiter',
            ),
            ExpandedButton(
              text: 'Saturn',
              button: 'PPSaturn',
            ),
            ExpandedButton(
              text: 'Uranus',
              button: 'PPUranus',
            ),
            ExpandedButton(
              text: 'Neptune',
              button: 'PPNeptune',
            ),
            ExpandedButton(
              text: 'Pluto',
              button: 'PPPluto',
            )
          ],
        ),
      ),
    );
  }
}
