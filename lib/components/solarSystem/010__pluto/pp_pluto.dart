import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/pp_class.dart';

class PPPluto extends StatelessWidget {
  const PPPluto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PPClass(
      age: 4.603E9,
      mass: 1.303e22,
      radius: 1188300,
      title: 'Pluto',
    );
  }
}
