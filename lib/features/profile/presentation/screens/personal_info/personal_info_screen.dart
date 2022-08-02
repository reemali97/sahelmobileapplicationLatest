import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sahelmobileapplication/core/core.export.dart';
import 'package:sahelmobileapplication/features/features.export.dart';

class PersonalInfoScreen extends StatefulWidget {

  PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  var employeeNameController = TextEditingController();
  var fatherNameController = TextEditingController();
  var grandpaNameController = TextEditingController();
  var familyNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var emailController = TextEditingController();
  String? imageUrl;
  bool isEnable=false;
  @override
  void initState() {
    super.initState();
     employeeNameController.text =Auth.currentUser!.user!.firstName!    ;
     fatherNameController.text =Auth.currentUser!.user!.nationalityCode!   ;
     grandpaNameController.text=Auth.currentUser!.user!.fullName!   ;
     familyNameController.text=Auth.currentUser!.user!.lastName! ;
     phoneNumberController.text =Auth.currentUser!.user!.lastName! ?? ''  ;
     emailController.text =Auth.currentUser!.user!.email!   ;
     imageUrl =Auth.currentUser!.user!.firstName!  ;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalInfoBloc, PersonalInfoState>(
      listener: (context, state) {
        if(state is OnEditState){
          isEnable=state.isEnable!;
        }
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: !isEnable
              ? FloatingActionButton(
                  onPressed: () => onEnable(context),
                  child: const Icon(Icons.edit),
                  backgroundColor: ColorHelper.primaryColor,
                )
              : Row(
                children: [
                  const Spacer(flex: 1,),
                  FloatingActionButton(
                      onPressed: () => onEnable(context),
                      child: const Icon(Icons.cancel),
                    backgroundColor: ColorHelper.greyColor,
                  ),
                  const Spacer(flex: 1,),
                  FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.save),
                    backgroundColor: ColorHelper.primaryColor,

                  ),
                  const Spacer(flex: 1,),

                ],
              ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Personal Info"),
            backgroundColor: ColorHelper.primaryColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
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
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 90, right: 30, left: 30, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              const CircleAvatarWidget(
                                backgroundColor: Colors.blueAccent,
                                minRadius: 50,
                              ),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.add))
                            ],
                          ),
                          const SizedBox(
                            height: 2.0,
                          ),
                            Text(
                            "${Auth.currentUser!.user!.fullName}",
                            style:  const TextStyle(fontFamily: FontsHelper.cairo),
                          ),
                          const Divider(
                            color: ColorHelper.greyColor,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Employee name",
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                            color: ColorHelper.primaryColor2
                                          //color: Constants.primaryColor2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldApp(
                                        enable: isEnable,
                                        controller: employeeNameController,
                                        borderColor: ColorHelper.primaryColor2,
                                        borderRadius: 4.0,
                                        prefixIcon: const Icon(Icons.person_outline),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Father name",
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                            color: ColorHelper.primaryColor2),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldApp(
                                        enable: isEnable,
                                        controller: familyNameController,
                                        borderColor: ColorHelper.primaryColor2,
                                        borderRadius: 4.0,
                                        prefixIcon: const Icon(Icons.person_outline),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Grandpa name",
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                            color: ColorHelper.primaryColor2
                                          //color: Constants.primaryColor2,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldApp(
                                        enable: isEnable,
                                        controller: grandpaNameController,
                                        borderColor: ColorHelper.primaryColor2,
                                        borderRadius: 4.0,
                                        prefixIcon: const Icon(Icons.person_outline),
                                      )
                                    ],
                                  )),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Family name",
                                        style: TextStyle(
                                            fontSize:
                                            MediaQuery.of(context).size.width *
                                                0.04,
                                            color: ColorHelper.primaryColor2),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextFieldApp(
                                        enable: isEnable,
                                        controller: familyNameController,
                                        borderColor: ColorHelper.primaryColor2,
                                        borderRadius: 4.0,
                                        prefixIcon: const Icon(Icons.person_outline),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone number",
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.04,
                                    color: ColorHelper.primaryColor2),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldApp(
                                enable: isEnable,
                                controller: phoneNumberController,
                                borderColor: ColorHelper.primaryColor2,
                                borderRadius: 4.0,
                                prefixIcon: const Icon(Icons.person_outline),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Email",
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.04,
                                    color: ColorHelper.primaryColor2),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFieldApp(
                                enable: isEnable,
                                controller: emailController,
                                borderColor: ColorHelper.primaryColor2,
                                borderRadius: 4.0,
                                prefixIcon: const Icon(Icons.person_outline),
                              )
                            ],
                          ),
                          const Spacer(
                            flex: 1,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void onEnable(BuildContext context) {
    debugPrint('${PersonalInfoBloc.get(context).isEnable!}');
    PersonalInfoBloc.get(context).add(OnEditEvent());
  }
}
