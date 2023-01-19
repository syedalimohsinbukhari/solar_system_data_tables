import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPJupiter extends StatelessWidget {
  const OPJupiter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: -2.3,
      geometricAlbedo: 0.538,
      distanceFromEarth: 628311056940,
      meanAngularSize: 0.0111,
      title: 'Jupiter',
    );
  }
}
