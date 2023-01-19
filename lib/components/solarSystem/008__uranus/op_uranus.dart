import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPUranus extends StatelessWidget {
  const OPUranus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: 5.705,
      geometricAlbedo: 0.499,
      distanceFromEarth: 2718193310619,
      meanAngularSize: 0.00103,
      title: 'Uranus',
    );
  }
}
