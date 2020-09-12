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

import 'package:cubit_study/cubits/location_visibility_cubit.dart';
import 'package:cubit_study/widgets/camera_list.dart';
import 'package:cubit_study/widgets/location_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider<LocationVisibilityCubit>(
      create: (context) => LocationVisibilityCubit(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text('Cameras', style: theme.textTheme.headline5),
              ),
              LocationToggle(),
            ],
          ),
          Expanded(
            child: CameraList(),
          ),
        ],
      ),
    );
  }
}
