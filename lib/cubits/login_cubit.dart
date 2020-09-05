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

import 'package:cubit_study/cubits/login_states.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final BogusRepository repository;

  LoginCubit(this.repository) : super(LoggedOutState());

  Future login(String username, String password) async {
    emit(LoggingInState());

    final user = await repository.login(username, password);

    emit(
      user != null ? LoggedInState(user) : LogInFailedState(),
    );
  }

  void logout() {
    repository.logout();
    emit(LoggedOutState());
  }
}
