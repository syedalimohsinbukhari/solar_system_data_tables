import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPSun extends StatelessWidget {
  const OPSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: -26.74,
      geometricAlbedo: 0.0001,
      distanceFromEarth: 149597870700,
      meanAngularSize: 0.536,
      title: 'Sun',
    );
  }
}
