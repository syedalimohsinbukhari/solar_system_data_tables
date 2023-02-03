import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'solarSystem/001_sun/op_sun.dart';
import 'solarSystem/001_sun/pp_sun.dart';
import 'solarSystem/002_mercury/op_mercury.dart';
import 'solarSystem/002_mercury/pp_mercury.dart';
import 'solarSystem/003__venus/op_venus.dart';
import 'solarSystem/003__venus/pp_venus.dart';
import 'solarSystem/004__earth/pp_earth.dart';
import 'solarSystem/005__mars/op_mars.dart';
import 'solarSystem/005__mars/pp_mars.dart';
import 'solarSystem/006__jupiter/op_jupiter.dart';
import 'solarSystem/006__jupiter/pp_jupiter.dart';
import 'solarSystem/007__saturn/op_saturn.dart';
import 'solarSystem/007__saturn/pp_saturn.dart';
import 'solarSystem/008__uranus/op_uranus.dart';
import 'solarSystem/008__uranus/pp_uranus.dart';
import 'solarSystem/009__neptune/op_neptune.dart';
import 'solarSystem/009__neptune/pp_neptune.dart';
import 'solarSystem/010__pluto/op_pluto.dart';
import 'solarSystem/010__pluto/pp_pluto.dart';

class ExpandedButton extends StatelessWidget {
  final String text;
  final String button;

  const ExpandedButton({super.key, required this.text, required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(240, 40),
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

String? getImageName(String? objectName) {
  Map<String, String> fileName = {
    'sun': 'Sun Shines in High-Energy X-rays',
    'mercury': 'The Impressive Rays of Hokusai',
    'venus': 'Venus-Computer Simulated Global View of the Northern Hemisphere',
    'earth': 'Good Night from Space',
    'mars': 'Hubble\'s Close-up View of Mars Dust Storm',
    'jupiter': 'Hubble\'s New Portrait of Jupiter',
    'saturn': 'Saturn\'s Rings Shine in Hubble Portrait',
    'uranus': 'Hubble Finds Many Bright Clouds on Uranus',
    'neptune': 'Neptune Full Disk View',
    'pluto': 'Pluto in High Resolution',
    'bkg': 'Viel Nebula Supernova Remnant'
  };

  return fileName[objectName];
}

String imageNameParser(String? imageName) {
  return 'Image Name: ${getImageName(imageName)}\n\n';
}

String getImageURL(String objectName) {
  String urlConst = 'https://solarsystem.nasa.gov/resources/';

  Map<String, String> photoID = {
    'sun': '381',
    'mercury': '1053',
    'venus': '775',
    'earth': '',
    'mars': '948',
    'jupiter': '2486',
    'saturn': '2490',
    'uranus': '445',
    'neptune': '611',
    'pluto': '852',
    'bkg': ''
  };

  return objectName != 'earth'
      ? objectName != 'bkg'
          ? '$urlConst${photoID[objectName]}/${getImageName(objectName)?.replaceAll(' ', '-').replaceAll('\'', '').toLowerCase()}/'
          : 'https://www.nasa.gov/image-feature/veil-nebula-supernova-remnant'
      : 'https://www.nasa.gov/content/good-night-from-space-buona-notte-dallo-spazio/';
}

String? toolTipExplanation(String objectName) {
  String? imageName = imageNameParser(objectName);

  var list_ = {
    'sun': '$imageName'
        'Source:\nNASA/JPL-Caltech/Goddard Space Flight Center',
    'mercury': '$imageName'
        'Source:\nNASA/Johns Hopkins University Applied Physics Laboratory/Carnegie Institution of Washington',
    'venus': '$imageName'
        'Source:\nNASA/JPL',
    'earth': '$imageName'
        'Source:\nNASA/ESA/Alexander Gerst',
    'mars': '$imageName'
        'Source:\nAlexander Gerst/ESA/NASA',
    'jupiter': '$imageName'
        'Source:\nNASA, ESA, A. Simon (GSFC), and M.H. Wong (University of California, Berkeley)',
    'saturn': '$imageName'
        'Source:\nNASA, ESA, A. Simon (GSFC), M.H. Wong (University of California, Berkeley) and '
        'the OPAL Team',
    'uranus': '$imageName'
        'Source:\nNASA/JPL/STScI',
    'neptune': '$imageName'
        'Source:\nNASA/JPL',
    'pluto': '$imageName'
        'Source:\nNASA/John Hopkins University Applied Physics Laboratory/Southwest Research '
        'Institute',
    'bkg': '$imageName'
        'Source:\nNASA/ESA/Hubble Heritage Team'
  };

  return list_[objectName];
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
    var fontSize_ = 18.0;
    var fontWeight_ = FontWeight.bold;

    if (isHead == null) {
      fontSize_ = 16;
      fontWeight_ = FontWeight.normal;
    }

    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize_,
          fontWeight: fontWeight_,
          color: Colors.white,
        ),
      ),
    );
  }
}

Future<void> launchURL(String url_) async {
  Uri urlToCheck = Uri.parse(url_);
  if (!await launchUrl(urlToCheck)) {
    LaunchMode.inAppWebView;
    throw Exception('Could not launch $urlToCheck');
  }
}
