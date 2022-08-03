import 'package:flutter/material.dart';
import '../../../../core/core.export.dart';
import '../../../features.export.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: ColorHelper.primaryColor,
        title:const Text(
          'My Profile',
          style: TextStyle(
            fontFamily: FontsHelper.cairo,
            fontWeight: FontWeight.w500,
            fontSize: 22.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:   [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 35.0),
                child: CircleAvatarWidget(
                    radius: 55.0,
                    showBackgroundImage: true,
                    backgroundImageUrl:
                        'https://img.freepik.com/free-photo/calm-handsome-bearded-caucasian-man-with-curious-expression-points-thumb-aside-blank-space-demonstrates-good-promo-place-your-advertising-wears-hoodie-poses-yellow-wall_273609-42131.jpg?w=1060&t=st=1652027475~exp=1652028075~hmac=d748afab2e433d0c9d4f52f3e571c59b695b27195276c85d96b11ef406835256'),
              ),
              const SizedBox(height: 8.0,),
              const Text(
                'Account',
                style: TextStyle(
                  fontFamily: FontsHelper.cairo,
                  fontWeight: FontWeight.w500,
                  color: ColorHelper.greyColor,
                  fontSize: 18.0,
                ),
              ),
               ListTileWidget(title: 'Personal Info',onTap:() => openPersonalInfo(context),),
              const Divider(color: ColorHelper.greyColor,),
              ListTileWidget(title: 'Job Info',onTap:()=> openJobInfo(context),),
              const Divider(color: ColorHelper.greyColor,),
              const SizedBox(height: 25.0,),
              const Text(
                'Settings',
                style: TextStyle(
                  fontFamily: FontsHelper.cairo,
                  fontWeight: FontWeight.w500,
                  color: ColorHelper.greyColor,
                  fontSize: 18.0,
                ),
              ),
              ListTileWidget(title: 'Language',leadingIcon: Icons.language,onTap:()=>showLangDialog(context) ,),
              const Divider(color: ColorHelper.greyColor,),
               ListTileWidget(title: 'Change Password',leadingIcon: Icons.lock_outline,onTap:()=>showChangePassDialog(context),),
              const Divider(color: ColorHelper.greyColor,),
              ListTileWidget(
                title: 'Logout',
                textStyle: const TextStyle(color: ColorHelper.redColor),
                leadingIcon: Icons.logout,
                onTap: () => openNewPage(context, LoginScreen(),popPreviousPages: true),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openJobInfo(BuildContext context){
    openNewPage(context,  JobInfoScreen());
  }
  void openPersonalInfo(BuildContext context){
    openNewPage(context,PersonalInfoScreen());
  }
  void showLangDialog(BuildContext context){
    languageDialog(context: context);
  }
  void showChangePassDialog(BuildContext context){
    changPasswordDialog(context: context);
  }

}

