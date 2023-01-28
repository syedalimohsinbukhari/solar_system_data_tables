import 'package:flutter/material.dart';
import 'package:solar_system_data_tables/components/utilities.dart';

class OPClass extends StatefulWidget {
  const OPClass(
      {super.key,
      required this.meanApparentMagnitude,
      required this.geometricAlbedo,
      required this.distanceFromEarth,
      required this.meanAngularSize,
      required this.title});

  final double meanApparentMagnitude;
  final double geometricAlbedo;
  final double distanceFromEarth;
  final double meanAngularSize;
  final String title;

  @override
  State<OPClass> createState() => _OPClassState();
}

class _OPClassState extends State<OPClass> {
  @override
  Widget build(BuildContext context) {
    double absoluteMagnitude =
        calculateApparentMagnitude(widget.meanApparentMagnitude, widget.distanceFromEarth);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title}:\nObservational Parameters",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        // width: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sun_bkg4.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(5),
              ),
              Center(
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(
                    const Color(0xffd3d3d3),
                  ),
                  showBottomBorder: true,
                  border: TableBorder.all(),
                  columns: const [
                    DataColumn(
                      label: Expanded(
                        child: TextCell(text: 'Quantity', isHead: true),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: TextCell(text: 'Numeric\nValue', isHead: true),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: TextCell(text: 'Unit', isHead: true),
                      ),
                    )
                  ],
                  rows: [
                    getNewDataRow(
                      'Apparent\nMagnitude',
                      widget.meanApparentMagnitude,
                      '',
                    ),
                    getNewDataRow(
                      'Geometric\nAlbedo',
                      widget.geometricAlbedo,
                      '',
                    ),
                    getNewDataRow(
                      'Distance\nFrom Earth',
                      widget.distanceFromEarth,
                      'm',
                    ),
                    getNewDataRow(
                      'Absolute\nMagnitude',
                      absoluteMagnitude,
                      '',
                    ),
                    getNewDataRow(
                      'Mean\nAngular Size',
                      widget.meanAngularSize,
                      'deg',
                    ),
                  ],
                ),
              ),
              ExpandedButton(
                text: 'Physical Parameters',
                button: 'PP${widget.title}',
              ),
              const ExpandedButton(
                text: 'Home',
                button: 'Home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
