import 'package:flutter/material.dart';

import '../styles/styles.dart';
import '../widgets/drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: buildDrawer(context),
      body: Center(
        child: Text(
          'Home',
          style: Styles.headerDark,
        ),
      ),
    );
  }
}
