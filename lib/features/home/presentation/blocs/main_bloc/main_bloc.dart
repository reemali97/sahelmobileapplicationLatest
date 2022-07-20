import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../features.export.dart';

class MainBloc extends Cubit<MainState>{
  MainBloc() : super(MainInitialState());
  static MainBloc get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomNav = [
    HomeScreen(),
    const NotificationScreen(),
    const PriceMapScreen(),
    const ProfileScreen(),
  ];

  void onChangeNavIndex(int index){
    currentIndex = index;
    emit(ChangeNavIndexState());
  }

}