import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPUranus extends StatelessWidget {
  const PPUranus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.503E9,
      mass: 8.681e25,
      radius: 25362000,
      title: 'Uranus',
    );
  }
}
