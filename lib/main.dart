import 'package:flutter/material.dart';

import 'src/screens/masters_screen.dart';
import 'src/screens/home.dart';
import 'src/screens/sells_screen.dart';

void main() => runApp(
      MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,

        routes: <String, WidgetBuilder>{
          '/masters': (BuildContext context) => DataMasters(),
          '/sells': (BuildContext context) => DataSells(),
        },
      ),
    );
