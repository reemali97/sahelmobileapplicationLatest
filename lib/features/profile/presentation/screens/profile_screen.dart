import 'package:flutter/material.dart';

import '../../../../core/core.export.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            toolbarHeight: 75,
            // leading: IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.search,size: 28.0,),
            // ),
            title: Text(
              'Profile',
              style: TextStyle(
                fontFamily: FontsHelper.cairo,
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
              ),
            ),
            backgroundColor: ColorHelper.primaryColor,

          ),
          SliverFillRemaining(
            child: Center(
              child: Text('Profile Screen'),
            ),
          ),
        ],
      ),
    );
  }
}
