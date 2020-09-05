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
import 'package:cubit_study/repositories/bogus_repository.dart';
import 'package:cubit_study/resources/routes.dart';
import 'package:cubit_study/routes/login_route.dart';
import 'package:cubit_study/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitApp extends StatelessWidget {
  final BogusRepository repository;

  const CubitApp({
    Key key,
    @required this.repository,
  })  : assert(repository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => LoginCubit(repository),
        child: MaterialApp(
          title: 'Cubit Study',
          initialRoute: Routes.login,
          onGenerateRoute: _generateRoute,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        ),
      );
}

Route _generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.login:
      return MaterialPageRoute<LoginRoute>(
        builder: (context) => LoginRoute(),
        settings: settings,
      );
    case Routes.main:
      return MaterialPageRoute<MainRoute>(
        builder: (context) => MainRoute(),
        settings: settings,
      );

    default:
      throw UnsupportedError('Can not generate route for ${settings.name}');
  }
}
