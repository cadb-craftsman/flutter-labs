import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:formvalidation_app/src/features/domain/models/product.dart';
import 'package:formvalidation_app/src/features/domain/models/user.dart';

class Params extends Equatable {
  Product product;

  Params({this.product});

  @override
  List<Object> get props => [product];
}

class ParamsFile extends Equatable {
  File image;

  ParamsFile({this.image});

  @override
  List<Object> get props => [image];
}

class ParamsUser extends Equatable {
  User user;

  ParamsUser({this.user});

  @override
  List<Object> get props => [user];
}
