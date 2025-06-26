import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vote_nova/core/navigation/navigation.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/core/utility/media_query.dart';
import 'package:vote_nova/views/result/result_page.dart';
import 'package:vote_nova/views/vote/vote_page.dart';

class StartvoteShowresultPage extends StatelessWidget {
  StartvoteShowresultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('sss'), automaticallyImplyLeading: false),
      body: SafeArea(
        child: Container(
          width: deviceWidth(context),
          height: deviceHeight(context),
          child: Column(
            children: [
              //! Start  voting container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () => CustomNavigation.push(context, VotePage()),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColors.primayColor,
                        ),

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'START VOTING',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primayColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //! Show Result container
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () {
                      showPasswordDialog(context, () {
                        CustomNavigation.push(
                          context,
                          ResultsPage(
                            results: [
                              CandidateResult(
                                name: "Alice",
                                votes: 143,

                                imagePath: "asset/splash_image.png",
                              ),
                              CandidateResult(
                                name: "Bob",
                                votes: 82,
                                imagePath: "asset/splash_image.png",
                              ),
                              CandidateResult(
                                name: "Charlie",
                                votes: 45,
                                imagePath: "asset/splash_image.png",
                              ),
                            ],
                          ),
                        );
                      });
                      // CustomNavigation.push(context, ResultPage());
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColors.primayColor,
                        ),
                        // color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'SHOW RESULT',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primayColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showPasswordDialog(BuildContext context, Function onSuccess) {
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  final formKey = GlobalKey<FormState>();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return StatefulBuilder(
        builder:
            (context, setState) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text("Enter Access Password"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 4) {
                          return 'Password must be at least 4 characters';
                        }
                        if (value != '123@'.trim()) {
                          return 'Password is incorrect';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primayColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primayColor),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.redAccent),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: AppColors.primayColor),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.primayColor,
                          ),
                          onPressed:
                              () => setState(() => obscureText = !obscureText),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primayColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: AppColors.primayColor),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            log('log calling ');

                            log('inside the timer');
                            if (formKey.currentState!.validate()) {
                              log('validating ');
                              String enteredPassword = passwordController.text;
                              if (enteredPassword == "123@") {
                                Navigator.pop(context);
                                onSuccess(); // call your function
                              }
                            } else {
                              log('validating ');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            'Confirm',
                            style: TextStyle(color: AppColors.primayColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      );
    },
  );
}
