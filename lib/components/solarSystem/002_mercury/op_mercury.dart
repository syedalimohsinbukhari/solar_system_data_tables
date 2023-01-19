import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/op_class.dart';

class OPMercury extends StatelessWidget {
  const OPMercury({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const OPClass(
      meanApparentMagnitude: 2.385,
      geometricAlbedo: 0.138,
      distanceFromEarth: 91703494739.1,
      meanAngularSize: 0.1458,
      title: 'Mercury',
    );
  }
}
