import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPPluto extends StatelessWidget {
  const OPPluto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: 14.975,
      geometricAlbedo: 0.52,
      distanceFromEarth: 5756526064535.999,
      meanAngularSize: 2.351e-5,
      title: 'Pluto',
    );
  }
}
