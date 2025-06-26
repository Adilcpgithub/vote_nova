import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/core/utility/media_query.dart';
import 'package:vote_nova/core/utility/simple_message.dart';

class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  int? selectedCandidate;

  final candidates = [
    {'name': 'Adil cp'},
    {'name': 'irfan'},
    {
      'name':
          'Alisjslkjlkakljslkdfjalkjfdflsdjflkwjelkasdghhlhlkhlkdjlkfjslkddjfosjlksjlkajlkce Johnson',
    },
    {'name': 'Bssssob Smith'},
    {
      'name':
          'Alisjslkjlkakljslkdfjalkjfdflsdjflkwjelkasdghhlhlkhlkdjlkfjslkddjfosjlksjlkajlkce Johnson',
    },
    {'name': 'Bssssob Smith'},
    {
      'name':
          'Alisjslkjlkakljslkdfjalkjfdflsdjflkwjelkasdghhlhlkhlkdjlkfjslkddjfosjlksjlkajlkce Johnson',
    },
    {'name': 'Bssssob Smith'},
    {
      'name':
          'Alisjslkjlkakljslkdfjalkjfdflsdjflkwjelkasdghhlhlkhlkdjlkfjslkddjfosjlksjlkajlkce Johnson',
    },
    {'name': 'Bssssob Smith'},
  ];
  final AudioPlayer player = AudioPlayer();
  Future<void> playBeebSound() async {
    log("Playing beep sound");
    await player.play(AssetSource('asset/beep_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      appBar: AppBar(
        backgroundColor: AppColors.primayColor,
        title: Text(
          'Mark Your Vote ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: deviceHeight(context),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: List.generate(candidates.length, (index) {
                        final isSelected = selectedCandidate == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCandidate = index;
                            });
                          },
                          child: Container(
                            height: 180,
                            margin: EdgeInsets.only(bottom: 16),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 20,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color:
                                    isSelected
                                        ? AppColors.primayColor
                                        : Colors.grey.shade300,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                    'assets/splash_image.png',
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        candidates[index]['name']!,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Sub title',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                // The round selection icon
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.primayColor,
                                      width: 2,
                                    ),
                                    color:
                                        isSelected
                                            ? AppColors.primayColor
                                            : Colors.transparent,
                                  ),
                                  child:
                                      isSelected
                                          ? Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 16,
                                              color: Colors.white,
                                            ),
                                          )
                                          : null,
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 55),
                  ],
                ),
              ),
            ),
          ),
          //! Vote button
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                if (selectedCandidate != null) {
                  showDialog(
                    context: context,
                    barrierDismissible: false, // Prevent dismiss on tap outside
                    builder: (BuildContext context) {
                      return Dialog(
                        backgroundColor:
                            Colors.transparent, // Makes outer area transparent
                        insetPadding: EdgeInsets.symmetric(horizontal: 24),
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
                              // Text(
                              //   'Confirm Your vote',
                              //   style: TextStyle(
                              //     fontSize: 20,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              SizedBox(height: 12),
                              Text(
                                'You are voted to \n "${candidates[selectedCandidate!]['name'] ?? 'Unknow'}"',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 24),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[300],
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop(); // Dismiss
                                      },
                                      child: Text('Cancel'),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey[300],
                                        foregroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        setState(() {
                                          selectedCandidate = null;
                                        });
                                        // Do action
                                        // Add your confirm logic here
                                        //! Playing Beeb Sound Here
                                        await playBeebSound();
                                        //!---------
                                        showModalBottomSheet(
                                          context: context,
                                          isScrollControlled:
                                              true, // Important for full/half height
                                          backgroundColor: Colors.green[100],
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(20),
                                            ),
                                          ),
                                          builder: (context) {
                                            return SizedBox(
                                              height:
                                                  deviceHeight(context) * 0.5,
                                              // 👈 Half of screen
                                              width: deviceWidth(context),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  24,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.check_circle,
                                                      color: Colors.green,
                                                      size: 48,
                                                    ),
                                                    SizedBox(height: 16),
                                                    Text(
                                                      "Voted Successfully!",
                                                      style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Text(
                                                      "Your vote has been recorded.",
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(height: 30),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.green,
                                                        foregroundColor:
                                                            Colors.white,
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 32,
                                                              vertical: 12,
                                                            ),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8,
                                                              ),
                                                        ),
                                                      ),
                                                      child: Text("Continue"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );

                                        //!---------
                                      },
                                      child: Text('Confirm'),
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
                } else {
                  //! ScaffoldMesssager show message
                  SimpleMessage.show(context, "Please choose a candidate");
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 130.0),
                child: Container(
                  height: 55,

                  decoration: BoxDecoration(
                    color: AppColors.primayColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Vote',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      //! Vote Button
    );
  }
}
