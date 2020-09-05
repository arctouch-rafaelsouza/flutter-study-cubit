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

import 'dart:math';

import 'package:cubit_study/models/user.dart';
import 'package:logging/logging.dart';

class BogusRepository {
  final _log = Logger('BogusRepository');
  final _random = Random();

  User _loggedUser;

  Future<User> login(String username, String password) async {
    _loggedUser = null;

    _log.info('Calling API for logging in $username...');
    await Future.delayed(
      Duration(seconds: 2 + _random.nextInt(2)),
    );
    _log.info('API returned.');

    if (username.toLowerCase() == 'admin' && password == '123') {
      _loggedUser = User(id: 1, name: 'Admin');
    }

    return _loggedUser;
  }

  void logout() => _loggedUser = null;
}
