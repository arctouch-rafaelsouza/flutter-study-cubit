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
import 'package:cubit_study/cubits/login_cubit.dart';
import 'package:cubit_study/cubits/overview_cubit.dart';
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:cubit_study/resources/routes.dart';
import 'package:cubit_study/resources/themes.dart';
import 'package:cubit_study/routes/login_route.dart';
import 'package:cubit_study/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitApp extends StatelessWidget {
  final BogusRepository repository;
  final LoginCubit loginCubit;

  const CubitApp({
    Key key,
    @required this.repository,
    @required this.loginCubit,
  })  : assert(repository != null),
        assert(loginCubit != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: loginCubit,
        child: MaterialApp(
          title: 'Cubit Study',
          initialRoute: Routes.login,
          onGenerateRoute: _generateRoute,
          theme: Themes.defaultTheme(),
        ),
      );

  Route _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute<LoginRoute>(
          builder: (context) => LoginRoute(),
          settings: settings,
        );
      case Routes.main:
        return MaterialPageRoute<MainRoute>(
          builder: (context) => RepositoryProvider<BogusRepository>.value(
            value: repository,
            child: MultiBlocProvider(
              providers: [
                BlocProvider<OverviewCubit>(
                  create: (context) => OverviewCubit(repository),
                ),
                BlocProvider<LocationVisibilityCubit>(
                  create: (context) => LocationVisibilityCubit(),
                ),
              ],
              child: MainRoute(),
            ),
          ),
          settings: settings,
        );

      default:
        throw UnsupportedError('Can not generate route for ${settings.name}');
    }
  }
}
