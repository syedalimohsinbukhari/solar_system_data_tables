import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_system_data_tables/components/utilities.dart';
import 'package:solar_system_data_tables/home_page.dart';

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

    // TODO: NetworkImage Implementation
    // String urlConst =
    //     'https://raw.githubusercontent.com/syedalimohsinbukhari/solar_system_data_tables/master'
    //     '/assets/images';

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
        decoration: BoxDecoration(
          image: DecorationImage(
            // Implement the network image stuff
            // image: NetworkImage('$urlConst/${widget.title.toLowerCase()}_bkg.jpg'),
            image: AssetImage('assets/images/${widget.title.toLowerCase()}_bkg.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
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
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const MyHomePage()));
                    },
                    icon: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  Tooltip(
                    showDuration: const Duration(milliseconds: 5000),
                    message: toolTipExplanation(widget.title.toLowerCase()),
                    triggerMode: TooltipTriggerMode.tap,
                    child: const Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launchURL(
                        getImageURL(widget.title.toLowerCase()),
                      );
                    },
                    icon: const Icon(
                      Icons.open_in_browser,
                      color: Colors.white,
                    ),
                  ),
                  Tooltip(
                    showDuration: const Duration(milliseconds: 1000),
                    message: 'Link copied to clipboard.',
                    triggerMode: TooltipTriggerMode.tap,
                    onTriggered: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: getImageURL(widget.title.toLowerCase()),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                  ),
                  ExpandedButton(
                    text: 'Physical Parameters',
                    button: 'PP${widget.title}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
