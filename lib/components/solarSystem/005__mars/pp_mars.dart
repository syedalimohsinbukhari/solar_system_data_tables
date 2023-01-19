import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPMars extends StatelessWidget {
  const PPMars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.603E9,
      mass: 6.4171e23,
      radius: 3398500,
      title: 'Mars',
    );
  }
}
