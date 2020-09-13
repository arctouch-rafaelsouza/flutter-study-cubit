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
import 'package:cubit_study/widgets/busy_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRoute extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.bloc<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (oldState, newState) => newState is LoggedInState,
      listener: (context, state) => Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.main,
        (route) => false,
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 8.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) => AnimatedOpacity(
                    opacity: state is LogInFailedState ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      color: Colors.red,
                      child: Text('Login failed'),
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Login'),
                  controller: _usernameController,
                  validator: (value) =>
                      value.isEmpty ? 'Type a username' : null,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Password'),
                  controller: _passwordController,
                  validator: (value) =>
                      value.isEmpty ? 'Type a password' : null,
                  obscureText: true,
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) => state is LoggingInState
                      ? BusyIndicator()
                      : FlatButton(
                          color: Colors.grey,
                          child: Text('Login'),
                          onPressed: () {
                            final form = Form.of(context);

                            if (!form.validate()) return;

                            loginCubit.login(
                              _usernameController.value.text,
                              _passwordController.value.text,
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
