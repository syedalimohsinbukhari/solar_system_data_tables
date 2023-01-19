import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPEarth extends StatelessWidget {
  const PPEarth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.5682E9,
      mass: 5.972167867791379e+24,
      radius: 695700000,
      title: 'Earth',
    );
  }
}
