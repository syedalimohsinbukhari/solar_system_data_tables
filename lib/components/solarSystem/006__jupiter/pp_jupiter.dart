import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPJupiter extends StatelessWidget {
  const PPJupiter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.603E9,
      mass: 1.8981245973360505e27,
      radius: 71492000,
      title: 'Jupiter',
    );
  }
}
