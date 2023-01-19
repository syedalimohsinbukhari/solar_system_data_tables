import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPMercury extends StatelessWidget {
  const PPMercury({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.503E9,
      mass: 3.3011e23,
      radius: 2439800,
      title: 'Mercury',
    );
  }
}
