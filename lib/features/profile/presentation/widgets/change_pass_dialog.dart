import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';

Future<void> changPasswordDialog({BuildContext? context}) async {
  var oldPassController= TextEditingController();
  var newPassController= TextEditingController();
  var confirmPassController= TextEditingController();
  return showDialog(
    context: context!,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Change Password',style: TextStyle(color: ColorHelper.primaryColor),),
        content: SizedBox(
          height: 200,
          child: Column(
            children: [
              TextFieldApp(
                controller: oldPassController,
                labelText: "Old Password",
                labelStyle: const TextStyle(fontSize:16),
                borderColor: Colors.grey,
                borderRadius: 4,
                suffixIcon: const Icon(Icons.visibility),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldApp(
                controller: newPassController,
                labelText: "New Password",
                labelStyle: const TextStyle(fontSize:16),
                borderColor: Colors.grey,
                borderRadius: 4,
                suffixIcon: const Icon(Icons.visibility),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldApp(
                controller: confirmPassController,
                labelText: "Confirm New Password",
                labelStyle: const TextStyle(fontSize:16),
                borderColor: Colors.grey,
                borderRadius: 4,
                suffixIcon: const Icon(Icons.visibility),
              ),

            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  child: const Text('Close',style: TextStyle(color:ColorHelper.primaryColor2 ),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextButton(
                  style:TextButton.styleFrom (backgroundColor: ColorHelper.primaryColor),
                  child: const Text('Save',style: TextStyle(color:Colors.white ),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}