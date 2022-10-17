import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBaseCubit extends Cubit<int> {
  HomeBaseCubit(this.pageIndex) : super(pageIndex);
  final int pageIndex;
  void updateIndex(int index) => emit(index);
  void getHome() => emit(0);
  void getMessage() => emit(1);
}
