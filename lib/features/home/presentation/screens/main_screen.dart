import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/home/home.export.dart';


class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var mainBloc = MainBloc.get(context);
    return BlocConsumer<MainBloc,MainState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: mainBloc.bottomNav[mainBloc.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: ColorHelper.primaryColor,
            unselectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            selectedItemColor: Colors.white,
            showUnselectedLabels: true,
            iconSize: 28.0,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white,
            onTap: (index) => mainBloc.onChangeNavIndex(index),
            currentIndex: mainBloc.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.folder_open),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Price Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

}
