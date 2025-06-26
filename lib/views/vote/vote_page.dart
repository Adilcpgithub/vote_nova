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
  bool isMuted = false;
  int? selectedCandidate;

  final candidates = [
    {'name': 'Adil cp'},
    {'name': 'irfan'},
    {'name': 'Afsal'},
    {'name': 'Sajith'},
    {'name': 'Shameer'},
    {'name': 'Shan'},
    {'name': 'Shanil'},
    {'name': 'Shanil'},
  ];
  final AudioPlayer player = AudioPlayer();
  Future<void> playBeebSound() async {
    log("Playing beep sound");
    //! Check if the sound is muted
    if (!isMuted) await player.play(AssetSource('asset/beep_sound.mp3'));
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.textColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
                color: AppColors.textColor,
              ),
              onPressed: () {
                setState(() {
                  isMuted = !isMuted;
                });
              },
            ),
          ),
        ],
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
                                width: 1,
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
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    245,
                                    243,
                                    243,
                                  ),
                                  foregroundColor: Colors.white,
                                  // backgroundImage: AssetImage(
                                  //   'assets/splash_image.png',
                                  // ),
                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                    color: Colors.grey.shade400,
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
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                    color:
                                        isSelected
                                            ? AppColors.primayColor
                                            : const Color.fromARGB(
                                              0,
                                              183,
                                              18,
                                              18,
                                            ),
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
              onTap: () async {
                if (selectedCandidate != null) {
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
                    isScrollControlled: true, // Important for full/half height
                    backgroundColor: Colors.green[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return SizedBox(
                        height: deviceHeight(context) * 0.5,
                        // 👈 Half of screen
                        width: deviceWidth(context),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Your vote has been recorded.",
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 30),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 32,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
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
