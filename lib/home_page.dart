import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'components/utilities.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solar System Data Tables',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            // Implement the network image stuff
            // image: NetworkImage('assets/images/${widget.title.toLowerCase()}_bkg.jpg'),
            image: AssetImage('assets/images/viel_nebula.jpg'),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    "Please select a celestial object.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const ExpandedButton(
                text: "Sun",
                button: 'PPSun',
              ),
              const ExpandedButton(
                text: "Mercury",
                button: 'PPMercury',
              ),
              const ExpandedButton(
                text: 'Venus',
                button: 'PPVenus',
              ),
              const ExpandedButton(
                text: 'Earth',
                button: 'PPEarth',
              ),
              const ExpandedButton(
                text: 'Mars',
                button: 'PPMars',
              ),
              const ExpandedButton(
                text: 'Jupiter',
                button: 'PPJupiter',
              ),
              const ExpandedButton(
                text: 'Saturn',
                button: 'PPSaturn',
              ),
              const ExpandedButton(
                text: 'Uranus',
                button: 'PPUranus',
              ),
              const ExpandedButton(
                text: 'Neptune',
                button: 'PPNeptune',
              ),
              const ExpandedButton(
                text: 'Pluto',
                button: 'PPPluto',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      // taken from https://stackoverflow.com/a/55983143/3212945
                      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ),
                  ),
                  Tooltip(
                    showDuration: const Duration(milliseconds: 5000),
                    message: toolTipExplanation('bkg'),
                    triggerMode: TooltipTriggerMode.tap,
                    child: const Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      launchURL(
                        getImageURL('bkg'),
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
                          text: getImageURL('bkg'),
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
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
