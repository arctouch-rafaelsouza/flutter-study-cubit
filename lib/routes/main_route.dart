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
import 'package:cubit_study/cubits/overview_cubit.dart';
import 'package:cubit_study/cubits/overview_states.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:cubit_study/resources/routes.dart';
import 'package:cubit_study/widgets/busy_indicator.dart';
import 'package:cubit_study/widgets/camera_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loginCubit = context.bloc<LoginCubit>();
    final overviewCubit = context.bloc<OverviewCubit>();

    return BlocListener<LoginCubit, LoginState>(
      cubit: loginCubit,
      listenWhen: (oldState, newState) =>
          oldState is LoggedInState && newState is! LoggedInState,
      listener: (context, state) async {
        if (state is LoggedOutState && !state.requestedByUser) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              content: Text("You've been signed out."),
              actions: [
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }

        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.login,
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: RepositoryProvider.of<BogusRepository>(context).logout,
            icon: Icon(
              Icons.cloud_off,
              color: Colors.red,
            ),
          ),
          actions: [
            FlatButton(
              child: Text('Disconnect'),
              onPressed: loginCubit.logout,
            ),
          ],
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: Center(
                  child: BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) => Text(
                      state is LoggedInState
                          ? 'Welcome, ${state.user.name}'
                          : 'Welcome, you!',
                      style: theme.textTheme.headline5,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<OverviewCubit, OverviewState>(
                      cubit: overviewCubit,
                      builder: (context, state) => Text(
                        'Current temperature: ${state.temperature}',
                        style: theme.textTheme.headline5,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: BlocBuilder<OverviewCubit, OverviewState>(
                      cubit: overviewCubit,
                      builder: (context, state) => state is LoadingOverviewState
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BusyIndicator(),
                            )
                          : IconButton(
                              onPressed: overviewCubit.refresh,
                              icon: Icon(Icons.refresh),
                            ),
                    ),
                  ),
                ],
              ),
              Divider(color: Colors.black),
              Expanded(
                child: CameraDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
