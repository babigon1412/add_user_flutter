import 'package:add_user_flutter/models/leader_model.dart';
import 'package:add_user_flutter/models/user_model.dart';
import 'package:add_user_flutter/providers/user_provider.dart';
import 'package:add_user_flutter/utils/app_colors.dart';
import 'package:add_user_flutter/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPage extends StatefulWidget {
  FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final positionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: Dimensions.screenHeight,
          width: Dimensions.screenWidth,
          margin: EdgeInsets.only(top: Dimensions.ten * 14),
          padding: EdgeInsets.symmetric(horizontal: Dimensions.ten * 2.5),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'NETFLAX',
                      style: TextStyle(
                        fontSize: Dimensions.ten * 2.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: Dimensions.ten),
                    Icon(
                      Icons.wifi_tethering_off_sharp,
                      color: Colors.red,
                      size: Dimensions.ten * 3,
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.ten * 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CustomTextFeild(
                      text: 'FIRST NAME :',
                      width: 2.5,
                      controller: firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(width: Dimensions.ten * 2),
                    _CustomTextFeild(
                      text: 'LAST NAME :',
                      width: 2.5,
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter last name';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.ten * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _CustomTextFeild(
                      text: 'AGE :',
                      width: 2.5,
                      controller: ageController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter age';
                        }
                        if (int.parse(value) < 0) {
                          return 'Invalid value';
                        }
                        return null;
                      },
                    ),
                    SizedBox(width: Dimensions.ten * 2),
                    _CustomTextFeild(
                      text: 'POSITION :',
                      hintText: 'Leader, Normal',
                      width: 2.5,
                      controller: positionController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter position';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(height: Dimensions.ten * 2),
                _CustomTextFeild(
                  text: 'EMAIL :',
                  hintText: '@email.com',
                  controller: emailController,
                  validator: (value) {
                    RegExp regExp = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    if (!regExp.hasMatch(value)) {
                      return 'Invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimensions.ten * 2),
                _CustomTextFeild(
                  text: 'PASSWORD :',
                  hintText: 'Must be atleast 8 characters',
                  controller: passwordController,
                  validator: (value) {
                    RegExp regExp = RegExp(r'.{8,}');

                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (!regExp.hasMatch(value)) {
                      return 'Must be atleast 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimensions.ten * 8),
                SizedBox(
                  height: Dimensions.ten * 5,
                  width: Dimensions.screenWidth,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var provider =
                            Provider.of<UserProvider>(context, listen: false);

                        var firstName = firstNameController.text;
                        var lastName = lastNameController.text;
                        var age = ageController.text;
                        var email = emailController.text;
                        var password = passwordController.text;
                        var position = positionController.text;

                        if (position == 'Leader' || position == 'leader') {
                          var value = LeaderModel(
                            firstName: firstName,
                            lastName: lastName,
                            age: age,
                            email: email,
                            password: password,
                            position: 'Leader',
                          );

                          provider.addLeader(value);
                        } else {
                          var data = UserModel(
                            firstName: firstName,
                            lastName: lastName,
                            age: age,
                            email: email,
                            password: password,
                            position: 'Normal',
                          );

                          provider.addUser(data);
                        }

                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add User',
                      style: TextStyle(
                        fontSize: Dimensions.ten * 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.ten * 2),
                SizedBox(
                  height: Dimensions.ten * 5,
                  width: Dimensions.screenWidth,
                  child: TextButton(
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: Dimensions.ten * 1.6,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTextFeild extends StatelessWidget {
  const _CustomTextFeild({
    Key? key,
    required this.text,
    required this.controller,
    required this.validator,
    this.width = 1,
    this.hintText = '',
  }) : super(key: key);

  final double width;
  final String text;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
              color: AppColors.greyBlack,
              fontSize: Dimensions.ten * 1.5,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(height: Dimensions.ten),
        SizedBox(
          height: Dimensions.ten * 4,
          width: Dimensions.screenWidth / width,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              hintText: hintText,
              fillColor: AppColors.grey.withOpacity(0.2),
              contentPadding: EdgeInsets.all(Dimensions.ten),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.ten * 3),
                borderSide: const BorderSide(width: 2, color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dimensions.ten * 3),
                borderSide: BorderSide(
                    width: 2, color: AppColors.grey.withOpacity(0.1)),
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
