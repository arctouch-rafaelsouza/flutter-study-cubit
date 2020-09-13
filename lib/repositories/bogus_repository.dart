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

import 'package:cubit_study/models/camera.dart';
import 'package:cubit_study/models/user.dart';
import 'package:logging/logging.dart';

class UnauthorizedError extends Error {
  String toString() => 'UnauthorizedError';
}

class BogusRepository {
  final _log = Logger('BogusRepository');
  final _random = Random();

  final _cameras = <Camera>[
    Camera(id: 1, exterior: true, enabled: true, description: 'Patio'),
    Camera(id: 2, exterior: false, enabled: false, description: 'Bedroom'),
    Camera(id: 3, exterior: false, enabled: false, description: 'Living room'),
    Camera(id: 4, exterior: true, enabled: false, description: 'Driveway'),
    Camera(id: 5, exterior: false, enabled: false, description: 'Hallway'),
    Camera(id: 6, exterior: true, enabled: false, description: 'Backyard'),
    Camera(id: 7, exterior: true, enabled: true, description: 'Shed'),
  ];

  User _loggedUser;

  Future<User> login(String username, String password) async {
    _loggedUser = null;

    _log.info('Calling API for logging in $username...');

    await _processingWait();

    if (username.toLowerCase() == 'admin' && password == '123') {
      _loggedUser = User(id: 1, username: 'Admin', name: 'Rockatansky');
    }

    _log.info('API returned. User $_loggedUser');

    return _loggedUser;
  }

  void logout() {
    _loggedUser = null;
    _log.info('Logged out of server.');
  }

  int currentTemperature() {
    _checkUserIsLogged();
    return 19 + _random.nextInt(12);
  }

  Future<List<int>> getUserCamerasIds() async {
    await _processingWait();
    _checkUserIsLogged();
    return _cameras.map((camera) => camera.id).toList(growable: false);
  }

  Future<Camera> getCameraData(int cameraId) async {
    await _processingWait(minTime: 0);
    _checkUserIsLogged();

    return _cameras.firstWhere((camera) => camera.id == cameraId);
  }

  Future<Camera> toggleCamera(int cameraId) async {
    _checkUserIsLogged();
    await _processingWait(minTime: 3, maxOffset: 3);

    final camera = _cameras.firstWhere((camera) => camera.id == cameraId);
    final index = _cameras.indexOf(camera);
    final newCamera = camera.copyWith(enabled: !camera.enabled);

    _cameras[index] = newCamera;

    return newCamera;
  }

  void _checkUserIsLogged() {
    if (_loggedUser == null) throw UnauthorizedError();
  }

  Future<void> _processingWait({int minTime = 1, int maxOffset = 1}) =>
      Future.delayed(
        Duration(seconds: minTime + _random.nextInt(maxOffset)),
      );
}
