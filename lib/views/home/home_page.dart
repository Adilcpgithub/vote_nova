import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vote_nova/core/navigation/navigation.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/core/utility/media_query.dart';
import 'package:vote_nova/views/candidate/add_candidate_page.dart';
import 'package:vote_nova/views/candidate/edit_candidate.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primayColor,
        title: Text(
          'Candidates',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: deviceWidth(context),

          height: deviceHeight(context),
          child: Column(
            children: [
              //! Top container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    color: AppColors.primayColor,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  height: 80,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        //! Restat icon
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible:
                                  false, // Prevent dismiss on tap outside
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor:
                                      Colors
                                          .transparent, // Makes outer area transparent
                                  insetPadding: EdgeInsets.symmetric(
                                    horizontal: 24,
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20,
                                          offset: Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Restart Data?',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          'If you restart, you will lose all your previous vote data. Please make sure you really want to proceed.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(height: 24),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                  foregroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(
                                                    context,
                                                  ).pop(); // Dismiss
                                                },
                                                child: Text('Cancel'),
                                              ),
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.grey[300],
                                                  foregroundColor: Colors.black,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12,
                                                        ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(
                                                    context,
                                                  ).pop(); // Do action
                                                  // Add your confirm logic here
                                                },
                                                child: Text('Restart'),
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
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(Icons.restart_alt_outlined, size: 28),
                          ),
                        ),
                        Expanded(child: SizedBox(width: 10)),
                        //! Add icon
                        GestureDetector(
                          onTap: () {
                            CustomNavigation.push(context, AddCandidatePage());
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),

                            child: Icon(Icons.add, size: 28),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //! Candidate List container
              Expanded(
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 110,

                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: AppColors.primayColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColors.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'Team name',
                              style: TextStyle(color: AppColors.textColor),
                            ),
                            leading: GestureDetector(
                              onTap: () {
                                showCandidateProfileDialog(
                                  context: context,
                                  name: 'adil',
                                  imageUrl: 'asset/splash_image.png',
                                );
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage(
                                  'asset/splash_image.png',
                                ),
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //! Delete
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder:
                                          (context) => Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 12,
                                                    offset: Offset(0, 6),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .warning_amber_rounded,
                                                        color: Colors.orange,
                                                        size: 28,
                                                      ),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        'Delete Candidate?',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'If you delete this candidate, the voting process will restart and all current vote data will be lost.',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                  SizedBox(height: 24),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          onPressed:
                                                              () =>
                                                                  Navigator.pop(
                                                                    context,
                                                                  ),
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            foregroundColor:
                                                                Colors.black87,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                            ),
                                                          ),
                                                          child: Text('Cancel'),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            // ✅ Call your deletion logic
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            foregroundColor:
                                                                Colors
                                                                    .redAccent,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                            ),
                                                          ),
                                                          child: Text('Delete'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.delete_outline,
                                    size: 25,
                                    color: AppColors.textColor,
                                  ),
                                ),
                                //! Edit
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder:
                                          (context) => Dialog(
                                            backgroundColor: Colors.transparent,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black26,
                                                    blurRadius: 12,
                                                    offset: Offset(0, 6),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_note_rounded,
                                                        color:
                                                            Colors.blueAccent,
                                                        size: 28,
                                                      ),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        'Edit Candidate?',
                                                        style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black87,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 12),
                                                  Text(
                                                    'Editing this candidate will restart the voting process and remove all existing vote data. Are you sure you want to proceed?',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey[700],
                                                    ),
                                                  ),
                                                  SizedBox(height: 24),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          onPressed:
                                                              () =>
                                                                  Navigator.pop(
                                                                    context,
                                                                  ),
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            foregroundColor:
                                                                Colors.black87,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                            ),
                                                          ),
                                                          child: Text('Cancel'),
                                                        ),
                                                      ),
                                                      SizedBox(width: 12),
                                                      Expanded(
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                            CustomNavigation.push(
                                                              context,
                                                              EditCandidate(),
                                                            );
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .grey[300],
                                                            foregroundColor:
                                                                Colors
                                                                    .blueAccent,
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    12,
                                                                  ),
                                                            ),
                                                          ),
                                                          child: Text('Edit'),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 25,
                                    color: AppColors.textColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //!--------------------------
    );
  }
}

void showCandidateProfileDialog({
  required BuildContext context,
  required String name,
  required String imageUrl,
  String? teamName,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage(imageUrl),
                  backgroundColor: Colors.grey[200],
                ),
                SizedBox(height: 16),

                // Candidate Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),

                // Team Name (if available)
                if (teamName != null && teamName.isNotEmpty) ...[
                  SizedBox(height: 6),
                  Text(
                    'Team: $teamName',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],

                SizedBox(height: 20),

                // Close Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Close",
                      style: TextStyle(color: AppColors.primayColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}
