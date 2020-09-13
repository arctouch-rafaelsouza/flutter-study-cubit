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

class LocationToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        height: 40.0,
        child: ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          onPressed: (index) {
            if (index == 0) debugPrint('Toggle show exterior');
            if (index == 1) debugPrint('Toggle show exterior');
          },
          isSelected: [
            false,
            false,
          ],
          children: [
            Icon(Icons.landscape),
            Icon(Icons.home),
          ],
        ),
      ),
    );
  }
}
