import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPVenus extends StatelessWidget {
  const OPVenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: -3.95,
      geometricAlbedo: 0.689,
      distanceFromEarth: 41438610183.9,
      meanAngularSize: 0.0105,
      title: 'Venus',
    );
  }
}
