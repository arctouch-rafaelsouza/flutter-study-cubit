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

import 'package:cubit_study/models/user.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}

class LoggedOutState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoggingInState extends LoggedOutState {}

class LogInFailedState extends LoggedOutState {}

class LoggedInState extends LoginState {
  final User user;

  LoggedInState(this.user);

  @override
  List<Object> get props => [user];
}
