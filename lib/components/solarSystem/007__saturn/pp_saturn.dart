import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPSaturn extends StatelessWidget {
  const PPSaturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.503E9,
      mass: 5.6834e26,
      radius: 58232000,
      title: 'Saturn',
    );
  }
}
