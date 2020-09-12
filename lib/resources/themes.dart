/*
 * Copyright 2020 ArcTouch LLC.
 * All rights reserved.
 *
 * This file, its contents, concepts, methods, behavior, and operation
 * (collectively the "Software") are protected by trade secret, patent,
 * and copyright laws. The use of the Software is governed by a license
 * agreement. Disclosure of the Software to third parties, in any form,
 * in whole or in part, is expressly prohibited except as authorized by
 * the license agreement.
 */

import 'package:flutter/material.dart';

class Themes {
  static ThemeData defaultTheme() => ThemeData(
        backgroundColor: Colors.grey,
        scaffoldBackgroundColor: Colors.grey,
        // cardColor: _zeus,
        primaryColor: Colors.grey,
        primaryColorDark: Colors.blueGrey,
        accentColor: Colors.grey,
        cursorColor: Colors.grey,
        textSelectionColor: Colors.grey,
        textSelectionHandleColor: Colors.grey,
        indicatorColor: Colors.white,
        dividerTheme: DividerThemeData(
          color: Colors.grey,
          thickness: 1.0,
        ),
        textTheme: TextTheme(
          headline5: TextStyle(
            fontSize: 14.0,
            height: 2.0,
            letterSpacing: 1.4,
            color: Colors.black,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            height: 2.0,
            letterSpacing: 1.7,
            color: Colors.black,
          ),
        ),
      );
}
