import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPNeptune extends StatelessWidget {
  const PPNeptune({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.503E9,
      mass: 1.02413e26,
      radius: 24622000,
      title: 'Neptune',
    );
  }
}
