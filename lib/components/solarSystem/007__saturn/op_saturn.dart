import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPSaturn extends StatelessWidget {
  const OPSaturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: 0.31,
      geometricAlbedo: 0.499,
      distanceFromEarth: 1282053751899,
      meanAngularSize: 0.0048,
      title: 'Saturn',
    );
  }
}
