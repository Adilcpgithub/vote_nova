import 'package:flutter/material.dart';
import 'package:vote_nova/core/navigation/navigation.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/core/utility/media_query.dart';
import 'package:vote_nova/views/home/home_page.dart';

class AddCandidatePage extends StatelessWidget {
  const AddCandidatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: deviceHeight(context),
          width: deviceWidth(context),
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                'UPLOAD IMAGE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('asset/splash_image.png'),
                  ),
                  color: AppColors.lightblue,
                  borderRadius: BorderRadius.circular(10),
                ),

                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                'ADD NAME',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 126, 106, 26),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    // labelText: labelText,
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    // hintText: hintText,
                    //  prefixIcon: prefixIcon,

                    //  errorText: errorText, // Show error text here
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      // Keep color same as enabled
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              //! Save button
              Center(
                child: GestureDetector(
                  onTap:
                      () => CustomNavigation.pushAndRemoveUntil(
                        context,
                        MyHome(),
                      ),
                  child: Container(
                    height: 60,
                    width: 110,

                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: AppColors.lightblue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'SAVE',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
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
