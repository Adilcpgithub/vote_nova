import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vote_nova/blocs/bloc/candidate_bloc.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/data/models/candidate_model.dart';

class AddCandidatePage extends StatefulWidget {
  const AddCandidatePage({super.key});

  @override
  State<AddCandidatePage> createState() => _AddCandidatePageState();
}

class _AddCandidatePageState extends State<AddCandidatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _teamController = TextEditingController();
  String? imagePath;
  Future<String?> pickAndSaveImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return null;

    // Get permanent app storage directory
    final appDir = await getApplicationDocumentsDirectory();

    // Create a new file path
    final fileName = basename(picked.path);
    final savedImage = await File(picked.path).copy('${appDir.path}/$fileName');

    return savedImage.path;
  }

  void pickImage() async {
    final path = await pickAndSaveImage();
    if (path != null) {
      setState(() {
        imagePath = path;
      });

      // Save it to Hive or whatever storage you're using
      print('Saved image path: $path');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primayColor,
        title: Text(
          "Add New Candidate",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),

                // Image Upload Section
                InkWell(
                  onTap: () {
                    //! Picking the profile image form the gallery
                    pickImage();
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.primayColor,
                          image:
                              imagePath != null
                                  ? DecorationImage(
                                    image: FileImage(File(imagePath!)),
                                    fit: BoxFit.cover,
                                  )
                                  : null,
                        ),
                      ),

                      if (imagePath == null)
                        Icon(Icons.camera_alt, size: 50, color: Colors.white70),

                      if (imagePath != null)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                imagePath = null;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.primayColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Icon(
                                  Icons.close,
                                  size: 25,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // Name Input Field
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter candidate name';
                    } else if (value.trim().length > 15) {
                      return 'Name must be 15 characters or less';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Candidate Name",

                    hintText: "Enter full name",
                    hintStyle: TextStyle(
                      color: AppColors.primayColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.primayColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: AppColors.primayColor,
                    ),
                    filled: true,
                    fillColor: AppColors.textColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primayColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primayColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                //! Candidate Team
                TextFormField(
                  controller: _teamController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter team name';
                    } else if (trimmed.isNotEmpty && trimmed.length > 15) {
                      return 'Team name must be 15 characters or less';
                    }
                    return null; // No error if empty or valid
                  },
                  decoration: InputDecoration(
                    labelText: "Team Name",

                    hintText: "Enter Team name",
                    hintStyle: TextStyle(
                      color: AppColors.primayColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    labelStyle: TextStyle(
                      color: AppColors.primayColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    prefixIcon: Icon(
                      Icons.groups,
                      color: AppColors.primayColor,
                    ),
                    filled: true,
                    fillColor: AppColors.textColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primayColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.primayColor),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Save Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.save,
                      color: AppColors.textColor,
                      size: 24,
                    ),
                    label: Text(
                      "Save Candidate",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor,
                      ),
                    ),
                    onPressed: () {
                      //! Save logic
                      if (_formKey.currentState!.validate() &&
                          imagePath != null) {
                        //! Save logic here
                        context.read<CandidateBloc>().add(
                          AddCandidate(
                            Candidate(
                              name: _nameController.text.trim(),
                              teamName: _teamController.text.trim(),
                              imagePath: imagePath!,
                            ),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Candidate Added successfully'),
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please add image')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primayColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
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
