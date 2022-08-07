import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


Future<dynamic> openNewPage(BuildContext context, Widget widget,
    {bool popPreviousPages = false}) {
  return Future<dynamic>.delayed(Duration.zero, () {
    if (!popPreviousPages) {
      return Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => widget,
          settings: RouteSettings(arguments: widget),
        ),
      );
    } else {
      return Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => widget,
              settings: RouteSettings(
                arguments: widget,
              )),
              (Route<dynamic> route) => false);
    }
  });
}

double getScreenWidth(BuildContext context, {bool realWidth = false}) {
  if (realWidth) {
    return MediaQuery.of(context).size.width;
  } //to preview widget like phone scale in preview

  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.width / 4
        : MediaQuery.of(context).size.height / 4;
  }

  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;
}

double getScreenHeight(BuildContext context, {bool realHeight = false}) {
  if (realHeight) {
    return MediaQuery.of(context).size.height;
  } //to preview widget like phone scale in preview
  if (kIsWeb) {
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height / 1.4
        : MediaQuery.of(context).size.width / 1.4;
  }
  return MediaQuery.of(context).orientation == Orientation.portrait
      ? MediaQuery.of(context).size.height
      : MediaQuery.of(context).size.width;
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}

class ProgressCircleDialog {
  static bool _isShow = false;

  static show(
    BuildContext context,
  ) {
    showDialog(
        context: context,
        builder: (_) => const Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    _isShow = true;
  }

  static dismiss(BuildContext context) {
    if (_isShow) {
      Navigator.pop(context);
      _isShow = false;
    }
  }
}

void printFullText(String text){

  final pattern = RegExp('.{1800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

// String dataFormat({DateTime? date}){
//   return DateFormat('hh:mm a,  MMM.d.yyyy').format(date!);
// }
// String timeFormat({DateTime? date}){
//   return DateFormat('hh:mm a').format(date!);
// }

class OpenGallery{

  static Future<dynamic> getGalleryImage({required File? image}) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return image = File(pickedFile.path);
    } else {
      debugPrint('No Image selected.');
      return Future.error('No Image selected.');
    }
  }
  static Future<File?> openCamera({required File? image}) async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return image = File(pickedFile.path);
    } else {
      debugPrint('No Image selected.');
      return Future.error('No Image selected.');
    }
  }
  static final picker = ImagePicker();

}
