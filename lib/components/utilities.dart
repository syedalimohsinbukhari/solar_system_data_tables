import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/home_page.dart';

import 'solarSystem/001_sun/pp_sun.dart';
import 'solarSystem/001_sun/op_sun.dart';

import 'solarSystem/002_mercury/op_mercury.dart';
import 'solarSystem/002_mercury/pp_mercury.dart';

import 'solarSystem/003__venus/op_venus.dart';
import 'solarSystem/003__venus/pp_venus.dart';

import 'solarSystem/004__earth/pp_earth.dart';

import 'solarSystem/006__jupiter/op_jupiter.dart';
import 'solarSystem/006__jupiter/pp_jupiter.dart';

import 'solarSystem/005__mars/op_mars.dart';
import 'solarSystem/005__mars/pp_mars.dart';

import 'solarSystem/007__saturn/op_saturn.dart';
import 'solarSystem/007__saturn/pp_saturn.dart';

import 'solarSystem/008__uranus/op_uranus.dart';
import 'solarSystem/008__uranus/pp_uranus.dart';

import 'solarSystem/009__neptune/op_neptune.dart';
import 'solarSystem/009__neptune/pp_neptune.dart';

import 'solarSystem/010__pluto/op_pluto.dart';
import 'solarSystem/010__pluto/pp_pluto.dart';

import 'dart:math' as math;

class ExpandedButton extends StatelessWidget {
  final String text;
  final String button;

  const ExpandedButton({super.key, required this.text, required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(280, 40),
            ),
            onPressed: () => {
              if (button != 'OPEarth') {_navigateToView(context, button)}
            },
            child: button != 'OPEarth'
                ? Text(text)
                : const Text('Observational Parameters\n(Disabled)', textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }

  get _list => {
        'Home': const MyHomePage(),
        'PPSun': const PPSun(),
        'OPSun': const OPSun(),
        'PPMercury': const PPMercury(),
        'OPMercury': const OPMercury(),
        'PPVenus': const PPVenus(),
        'OPVenus': const OPVenus(),
        'PPEarth': const PPEarth(),
        'OPMars': const OPMars(),
        'PPMars': const PPMars(),
        'OPJupiter': const OPJupiter(),
        'PPJupiter': const PPJupiter(),
        'OPSaturn': const OPSaturn(),
        'PPSaturn': const PPSaturn(),
        'OPUranus': const OPUranus(),
        'PPUranus': const PPUranus(),
        'OPNeptune': const OPNeptune(),
        'PPNeptune': const PPNeptune(),
        'OPPluto': const OPPluto(),
        'PPPluto': const PPPluto()
      };

  void _navigateToView(BuildContext context, String text) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => _list[text]));
  }
}

double calculateApparentMagnitude(double appMag, double distance) {
  distance = distance / 3.085677581491367e+16; // m to pc
  return appMag - 5 * (math.log(distance) / math.ln10) + 5;
}

List calculatePhysicalParameters(double mass, double radius) {
  double G = 6.6743e-11; // Nm^2kg^{-2}

  double volume = (4 / 3) * math.pi * math.pow(radius, 3);
  double density = mass / volume;
  double surfaceArea = 4 * math.pi * math.pow(radius, 2);
  double surfaceGravity = (G * mass) / math.pow(radius, 2);
  double escapeVelocity = math.sqrt((2 * G * mass) / radius) / 1000;

  return [volume, density, surfaceArea, surfaceGravity, escapeVelocity];
}

DataRow getNewDataRow(String val1, double val2, String val3) {
  return DataRow(
    cells: [
      DataCell(TextCell(text: val1)),
      DataCell(TextCell(text: makeExponential(val2))),
      DataCell(TextCell(text: val3)),
    ],
  );
}

String makeExponential(double val1) {
  if (10000 < val1.abs() || val1.abs() < 1e-2) {
    return val1.toStringAsExponential(4);
  } else {
    return val1.toStringAsFixed(4);
  }
}

class TextCell extends StatelessWidget {
  final String text;
  final bool? isHead;

  const TextCell({super.key, required this.text, this.isHead});

  @override
  Widget build(BuildContext context) {
    var fontSize_ = 16.0;
    var fontWeight_ = FontWeight.bold;

    if (isHead == null) {
      fontSize_ = 14;
      fontWeight_ = FontWeight.normal;
    }

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize_,
          fontWeight: fontWeight_,
        ),
      ),
    );
  }
}
