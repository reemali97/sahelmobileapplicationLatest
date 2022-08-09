import 'package:flutter/material.dart';
import '../../../../../core/core.export.dart';
import '../../../../features.export.dart';

class AddImageDialog {
  static final _formKey = GlobalKey<FormState>();
  static var oldPassController = TextEditingController();
  static var newPassController = TextEditingController();
  static var confirmPassController = TextEditingController();
  static var iconsColor = ColorHelper.primaryColor;

  static Future<void> showAddImageDialog({BuildContext? context}) async {
    return showDialog(
      context: context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return LayoutBuilderWidget(

          child: AlertDialog(
            content: SizedBox(
              height: 200.0,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Spacer(flex: 1,),
                    const Text('How to choose to upload photos?',style: TextStyle(fontFamily: FontsHelper.cairo),),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children:  [
                        Expanded(
                          child: Column(
                            children:[
                              CircleAvatarWidget(
                                radius: 30.0,
                                backgroundColor: ColorHelper.primaryColor,
                                child: IconButton(
                                    onPressed: () =>openCamera(context),
                                    icon: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5.0,),
                              const Text('Camera',style: TextStyle(fontFamily: FontsHelper.cairo),),


                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Column(
                            children:  [
                              CircleAvatarWidget(
                                radius: 30.0,
                                backgroundColor: ColorHelper.primaryColor,
                                child: IconButton(
                                    onPressed: () => openGallery(context),
                                    icon: const Icon(
                                      Icons.image_outlined,
                                      color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5.0,),
                              const Text('Gallery',style:  TextStyle(fontFamily: FontsHelper.cairo),),

                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 1,),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: addImageDialogButton(
                  context: context,
                  title: 'Close',
                  onPressed: ()=> onClose(context),
                  textColor: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget addImageDialogButton({
    BuildContext? context,
    VoidCallback? onPressed,
    String? title = '',
    Color? textColor,
    Color? backgroundColor = Colors.white,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
        ),
        child: Text(
          '$title',
          style: TextStyle(color: textColor ?? Colors.white,fontFamily: FontsHelper.cairo),
        ),
        onPressed: onPressed ?? () {},
      ),
    );
  }

  static void openCamera(BuildContext context) async {
    PersonalInfoBloc.get(context).add(GetCameraImageEvent(context: context));
  }

  static void openGallery(BuildContext context) {
    PersonalInfoBloc.get(context).add(GetGalleryImageEvent(context: context));
  }

  static void onClose(BuildContext context) {
    Navigator.pop(context);
  }
}
