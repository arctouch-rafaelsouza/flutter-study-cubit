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

import 'package:equatable/equatable.dart';

class Camera extends Equatable {
  final int id;
  final String description;
  final bool enabled;
  final bool exterior;

  const Camera({
    this.id,
    this.description = '',
    this.enabled = false,
    this.exterior = false,
  })  : assert(id != null),
        assert(description != null),
        assert(enabled != null),
        assert(exterior != null);

  @override
  List<Object> get props => [id, description, enabled, exterior];

  Camera copyWith({
    int id,
    String description,
    bool enabled,
    bool exterior,
  }) =>
      Camera(
        id: id ?? this.id,
        description: description ?? this.description,
        enabled: enabled ?? this.enabled,
        exterior: exterior ?? this.exterior,
      );
}
