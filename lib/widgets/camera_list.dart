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
import 'package:cubit_study/cubits/camera_states.dart';
import 'package:cubit_study/cubits/location_visibility_cubit.dart';
import 'package:cubit_study/cubits/location_visibility_states.dart';
import 'package:cubit_study/cubits/overview_cubit.dart';
import 'package:cubit_study/cubits/overview_states.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:cubit_study/widgets/camera_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OverviewCubit, OverviewState>(
      builder: (context, state) => ListView.builder(
          shrinkWrap: true,
          itemCount: state.cameraIds.length,
          itemBuilder: (context, index) {
            final cameraId = state.cameraIds[index];

            return BlocProvider(
              create: (context) => CameraCubit(
                RepositoryProvider.of<BogusRepository>(context),
                cameraId,
              ),
              child: BlocBuilder<CameraCubit, CameraState>(
                builder: (context, state) => BlocBuilder<
                    LocationVisibilityCubit, LocationVisibilityState>(
                  builder: (context, visibilityState) => CameraCard(
                    camera: state.camera,
                    busy: state.busy,
                    highlight: (state.camera.exterior &&
                            visibilityState.showExterior) ||
                        (!state.camera.exterior &&
                            visibilityState.showInterior),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
