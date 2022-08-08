import 'package:flutter/material.dart';
import 'package:sahelmobileapplication/core/core.export.dart';

class JobInfoScreen extends StatefulWidget {
  JobInfoScreen({Key? key}) : super(key: key);

  @override
  State<JobInfoScreen> createState() => _JobInfoScreenState();
}

class _JobInfoScreenState extends State<JobInfoScreen> {
  var firstNameController = TextEditingController();
  var jobTitleController = TextEditingController();
  var employeeNumberController = TextEditingController();
  var membershipSectionController = TextEditingController();
  var membershipNumberController = TextEditingController();
  var evaluatorTypeController = TextEditingController();
  var membershipExpirationDateController = TextEditingController();
  var membershipCategoryController = TextEditingController();
  bool isEnable = false;

  @override
  void initState() {
    super.initState();
    firstNameController.text =Auth.currentUser!.user!.userName! ;
    jobTitleController.text =Auth.currentUser!.user!.jobTitle!  ;
    employeeNumberController.text=Auth.currentUser!.user!.idNumber.toString() ;
    membershipSectionController.text=Auth.currentUser!.user!.lastName!;
    membershipNumberController.text =Auth.currentUser!.user!.isEnabled!.toString() ;
    evaluatorTypeController.text =Auth.currentUser!.group!.role!.nameEN! ;
    membershipExpirationDateController.text =Auth.currentUser!.group!.isActive!.toString() ;
    membershipCategoryController.text =Auth.currentUser!.user!.firstName! ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Job Info"),
        backgroundColor: ColorHelper.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Divider(
                        color: ColorHelper.greyColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "UserName",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        enable: isEnable,
                        controller: firstNameController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        prefixIcon: const Icon(Icons.person_outline),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Job Title",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: jobTitleController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),


                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Employee Number",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: employeeNumberController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),


                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Membership Section",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: membershipSectionController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),


                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Membership Number",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: membershipNumberController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),


                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Evaluator Type",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: evaluatorTypeController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),


                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Membership Expiration Date",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: membershipExpirationDateController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),


                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Membership Category",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: ColorHelper.primaryColor2),
                      ),
                      TextFieldApp(
                        controller: membershipCategoryController,
                        borderColor: Colors.grey,
                        borderRadius: 4,
                        enable: isEnable,
                        prefixIcon: const Icon(Icons.person_outline),

                      ),
                      const Spacer(flex: 1,),

                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

