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

import 'package:cubit_study/models/camera.dart';
import 'package:cubit_study/widgets/camera_card.dart';
import 'package:flutter/material.dart';

class CameraList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        final cameraId = index;

        return CameraCard(
          camera: Camera(
            id: cameraId,
            description: 'Test',
            enabled: false,
            exterior: true,
          ),
          busy: false,
          highlight: true,
        );
      },
    );
  }
}
