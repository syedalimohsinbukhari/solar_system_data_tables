import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPVenus extends StatelessWidget {
  const PPVenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.503E9,
      mass: 4.8675e24,
      radius: 6051800,
      title: 'Venus',
    );
  }
}
