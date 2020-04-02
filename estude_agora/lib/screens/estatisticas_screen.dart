import 'dart:io';

import 'package:estude_agora/components/char_pieNew.dart';
import 'package:estude_agora/components/chart_bar.dart';
import 'package:estude_agora/components/chart_pie.dart';
import 'package:estude_agora/data/dataChart.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Sets a platform override for desktop to avoid exceptions. See
// https://flutter.dev/desktop#target-platform-override for more info.
void enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

class EstatisticasScreen extends StatefulWidget {
  @override
  _EstatisticasScreenState createState() => _EstatisticasScreenState();
}

class _EstatisticasScreenState extends State<EstatisticasScreen> {
  bool toggle = false;

  _createSectionContainer(Widget child) {
    return Container(
      width: 150,
      height: 100,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints.expand(
                  height: Theme.of(context).textTheme.display1.fontSize * 2.5,
                ),
                padding: const EdgeInsets.all(8.0),
                color: Theme.of(context).accentColor,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Text(
                      'RESOLVIDAS',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '1.000',
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _createSectionContainer(Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0.8),
                        child: Text('ACERTOS',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Text(
                        '300',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),
                  _createSectionContainer(Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(0.8),
                        child: Text(
                          'ERROS',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '105',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: constraints.maxHeight * 1,
                height: constraints.maxHeight * 0.5,
                child: toggle
                    ? ChartPieNew.withSampleData()
                    : ChartBar.withSampleData(),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: togglePieChart,
        child: Icon(Icons.insert_chart),
      ),
    );
  }

  void togglePieChart() {
    setState(() {
      toggle = !toggle;
    });
  }
}
