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

import 'package:cubit_study/cubits/login_cubit.dart';
import 'package:cubit_study/cubits/login_states.dart';
import 'package:cubit_study/resources/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginCubit = context.bloc<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      cubit: loginCubit,
      listenWhen: (oldState, newState) =>
          oldState is LoggedInState && newState is! LoggedInState,
      listener: (context, state) => Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.login,
        (route) => false,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          actions: [
            FlatButton(
              child: Text('Disconnect'),
              onPressed: loginCubit.logout,
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
