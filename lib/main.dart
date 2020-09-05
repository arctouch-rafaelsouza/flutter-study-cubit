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

import 'package:cubit_study/cubit_app.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  EquatableConfig.stringify = true;

  // Initialize simple logging
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    (l) => print('${l.time} - ${l.loggerName} - ${l.level.name}: ${l.message}'),
  );

  final bogusRepository = BogusRepository();

  runApp(
    CubitApp(
      repository: bogusRepository,
    ),
  );
}
