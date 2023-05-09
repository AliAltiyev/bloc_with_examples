import 'package:flutter_bloc/flutter_bloc.dart';

import 'string_extension.dart';

class IterableCubitDart<T> extends Cubit<T?> {
  IterableCubitDart() : super(null);

  void getRandomElement() {
    emit(DataProvider.list.getrandomElement());
  }
}

class DataProvider {
  static List list = [
    'Foo',
    'Mua',
    'Gaf',
  ];
}
