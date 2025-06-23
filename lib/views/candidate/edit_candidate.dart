import 'package:flutter/material.dart';
import 'package:vote_nova/core/utility/colors.dart';

class EditCandidate extends StatefulWidget {
  const EditCandidate({super.key});

  @override
  State<EditCandidate> createState() => _EditCandidateState();
}

class _EditCandidateState extends State<EditCandidate> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _teamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primayColor,
        title: Text(
          "Edit Candidate",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
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
                    // TODO: Implement image picker
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.lightblue,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('asset/splash_image.png'),
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.white70,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                //! Name Input Field
                TextFormField(
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
                      borderSide: BorderSide(color: Colors.redAccent),
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
                  validator: (value) {
                    final trimmed = value?.trim() ?? '';
                    if (trimmed.isNotEmpty && trimmed.length > 15) {
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
                      borderSide: BorderSide(
                        color: AppColors.primayColor,
                        width: 2,
                      ),
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

                // !Save Button
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
                      "Update Candidate",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textColor,
                      ),
                    ),
                    onPressed: () {
                      //! Update Candidate logic
                      if (_formKey.currentState!.validate()) {
                        //! Save logic here
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Candidate Updated successfully'),
                          ),
                        );
                      }
                      // Navigator.pop(context);
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
