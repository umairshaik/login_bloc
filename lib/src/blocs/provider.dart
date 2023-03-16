import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class Provider extends InheritedWidget {
  final block = Bloc();

  Provider({super.key, required super.child});

  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.block;
  }

  @override
  bool updateShouldNotify(oldWidget) => true;
}
