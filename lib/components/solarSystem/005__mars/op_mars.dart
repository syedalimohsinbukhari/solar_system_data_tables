import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPMars extends StatelessWidget {
  const OPMars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: -0.539,
      geometricAlbedo: 0.17,
      distanceFromEarth: 77790892764,
      meanAngularSize: 0.00397,
      title: 'Mars',
    );
  }
}
