import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPNeptune extends StatelessWidget {
  const OPNeptune({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: 7.835,
      geometricAlbedo: 0.442,
      distanceFromEarth: 4365265867026,
      meanAngularSize: 0.000638,
      title: 'Neptune',
    );
  }
}
