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

import 'package:cubit_study/widgets/busy_indicator.dart';
import 'package:cubit_study/widgets/camera_details.dart';
import 'package:cubit_study/widgets/value_display.dart';
import 'package:flutter/material.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.cloud_off,
            color: Colors.red,
          ),
        ),
        actions: [
          FlatButton(
            child: Text('Disconnect'),
            onPressed: () => debugPrint('Log out'),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              child: Center(
                child: Text(
                  'Welcome, you!',
                  style: theme.textTheme.headline5,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        'Current temperature: ',
                        style: theme.textTheme.headline5,
                      ),
                      ValueDisplay(
                        value: 22,
                        suffix: '°',
                        style: theme.textTheme.headline5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BusyIndicator(),
                  ),
                ),
                IconButton(
                  onPressed: () => debugPrint('Refresh pressed'),
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
            Divider(color: Colors.black),
            Expanded(
              child: CameraDetails(),
            ),
          ],
        ),
      ),
    );
  }
}
