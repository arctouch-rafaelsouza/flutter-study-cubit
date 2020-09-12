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

import 'package:cubit_study/cubits/camera_cubit.dart';
import 'package:cubit_study/models/camera.dart';
import 'package:cubit_study/widgets/busy_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraCard extends StatelessWidget {
  final Camera camera;
  final bool isBusy;
  final bool isVisible;

  const CameraCard({
    Key key,
    @required this.camera,
    @required this.isBusy,
    @required this.isVisible,
  })  : assert(camera != null),
        assert(isBusy != null),
        assert(isVisible != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final cameraCubit = context.bloc<CameraCubit>();

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: isVisible ? 1.0 : 0.2,
      child: Card(
        elevation: 5.0,
        color: isBusy ? Colors.deepOrangeAccent : Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 5.0, 16.0, 5.0),
          child: Row(
            children: [
              Expanded(
                child: Text(camera.description),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(camera.enabled ? '100' : '0'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(camera.exterior ? Icons.landscape : Icons.home),
              ),
              RawMaterialButton(
                onPressed: isBusy ? null : cameraCubit.toggle,
                child: Container(
                  width: 70.0,
                  padding: const EdgeInsets.all(8.0),
                  color: isBusy ? Colors.transparent : Colors.grey,
                  child: isBusy
                      ? SizedBox(
                          height: 20.0,
                          child: FittedBox(
                            fit: BoxFit.fitHeight,
                            child: BusyIndicator(),
                          ),
                        )
                      : Center(
                          child: Text(
                            camera.enabled ? 'Disable' : 'Enable',
                          ),
                        ),
                ),
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
