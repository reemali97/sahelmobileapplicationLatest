import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/config/app_env.dart';
import '../../../../core/core.export.dart';
import '../widgets/notifications_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            toolbarHeight: 75,
            floating: true,
          
            title: Text(
              'Notifications',
              style: TextStyle(
                fontFamily: FontsHelper.cairo,
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
              ),
            ),
            backgroundColor: ColorHelper.primaryColor,
          ),
          SliverList(
            delegate:SliverChildBuilderDelegate(

              (context, index) {
                return const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16.0,vertical: 6.0),
                  child:  NotificationsItem(),
                );
              },
              childCount: 20,

            ),
          ),
        ],
      ),
    );
  }
}

