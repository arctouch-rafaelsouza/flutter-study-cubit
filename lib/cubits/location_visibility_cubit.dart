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

import 'package:cubit_study/cubits/location_visibility_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationVisibilityCubit extends Cubit<LocationVisibilityState> {
  LocationVisibilityCubit()
      : super(LocationVisibilityState(
          showInterior: true,
          showExterior: true,
        ));

  void toggleInterior() => emit(
        state.copyWith(showInterior: !state.showInterior),
      );

  void toggleExterior() => emit(
        state.copyWith(showExterior: !state.showExterior),
      );
}
