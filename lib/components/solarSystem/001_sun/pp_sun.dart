import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPSun extends StatelessWidget {
  const PPSun({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.607E9,
      mass: 1.988409870698051e+30,
      radius: 695700000,
      title: 'Sun',
    );
  }
}
