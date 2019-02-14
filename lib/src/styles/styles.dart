import 'package:flutter/material.dart';

class Styles {
  static final Color blueMS = Color(0xFF006FB4);
  static final Color darkMS = Color(0xFF3C4C61);

  static const _textLarge = 26.0;
  static const _textDefault = 20.0;
  static const _textSmall = 16.0;

  static final headerWhite = TextStyle(
    fontSize: _textLarge,
    fontFamily: 'Lato',
    color: Colors.white,
  );

  static final headerDark = TextStyle(
    fontSize: _textLarge,
    fontFamily: 'Lato',
    color: darkMS,
  );
  static final defaultDark = TextStyle(
    fontSize: _textDefault,
    fontFamily: 'OpenSans',
    color: darkMS,
  );
  static final defaultWhite = TextStyle(
    fontSize: _textDefault,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );
  static final smallDark = TextStyle(
    fontSize: _textSmall,
    fontFamily: 'OpenSans',
    color: darkMS,
  );
  static final smallWhite = TextStyle(
    fontSize: _textSmall,
    fontFamily: 'OpenSans',
    color: Colors.white,
  );
}
