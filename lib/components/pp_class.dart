import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/utilities.dart';

class PPClass extends StatefulWidget {
  const PPClass(
      {super.key,
      required this.age,
      required this.mass,
      required this.radius,
      required this.title});

  final double age;
  final double mass;
  final double radius;
  final String title;

  @override
  State<PPClass> createState() => _PPClassState();
}

class _PPClassState extends State<PPClass> {
  @override
  Widget build(BuildContext context) {
    List parameters = calculatePhysicalParameters(widget.mass, widget.radius);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}:\nPhysical Properties",
          textAlign: TextAlign.justify,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(5)),
            Center(
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(const Color(0xffd3d3d3)),
                showBottomBorder: true,
                border: TableBorder.all(),
                columns: const [
                  DataColumn(label: Expanded(child: TextCell(text: 'Quantity', isHead: true))),
                  DataColumn(
                    label: Expanded(child: TextCell(text: 'Numeric\nValue', isHead: true)),
                  ),
                  DataColumn(
                    label: Expanded(child: TextCell(text: 'Unit', isHead: true)),
                  )
                ],
                rows: [
                  getNewDataRow('Age', widget.age, 'yr'),
                  getNewDataRow('Mass', widget.mass, 'kg'),
                  getNewDataRow('Radius', widget.radius, 'm'),
                  // getNewDataRow('Temperature', temperature, 'K'),
                  getNewDataRow('Volume', parameters[0], 'm^3'),
                  getNewDataRow('Density', parameters[1], 'kg/m^3'),
                  getNewDataRow('Surface\nArea', parameters[2], 'm^2'),
                  getNewDataRow('Surface\nGravity', parameters[3], 'm/s^2'),
                  getNewDataRow('Escape\nVelocity', parameters[4], "km/s")
                ],
              ),
            ),
            ExpandedButton(
              text: 'Observational Parameters',
              button: 'OP${widget.title}',
            ),
            const ExpandedButton(
              text: 'Home',
              button: 'Home',
            ),
          ],
        ),
      ),
    );
  }
}
