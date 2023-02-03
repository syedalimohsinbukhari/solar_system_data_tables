import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:solar_system_data_tables/components/utilities.dart';
import 'package:solar_system_data_tables/home_page.dart';

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
          "${widget.title}:\nPhysical Parameters",
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
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
                    ),
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
              const Padding(padding: EdgeInsets.all(2)),
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
                    text: 'Observational Parameters',
                    button: 'OP${widget.title}',
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
