import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vote_nova/core/navigation/navigation.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/core/utility/media_query.dart';
import 'package:vote_nova/views/candidate/add_candidate_page.dart';
import 'package:vote_nova/views/home/vote_page.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightblue,
        title: Text(
          'Candidates',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: deviceWidth(context),

          height: deviceHeight(context),
          child: Column(
            children: [
              //! Top container
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    color: const Color.fromARGB(255, 141, 213, 246),
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
                            showAboutDialog(
                              context: context,
                              applicationName: 'ssss',
                              barrierLabel: '2222',
                              applicationLegalese: 'rrr',
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  color: Colors.amberAccent,
                                ),
                              ],
                            );
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 184, 170, 130),
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
                              color: const Color.fromARGB(255, 184, 170, 130),
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
                          color: const Color.fromARGB(255, 141, 213, 246),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: ListTile(
                            title: Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text('Team name'),
                            leading: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'asset/splash_image.png',
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.delete_outline, size: 25),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.edit, size: 25),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(width: 10),
              //! Home
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightblue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.home_rounded, size: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              //! Vote bottom icon
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightblue,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: IconButton(
                      onPressed: () {
                        CustomNavigation.push(context, VotePage());
                      },
                      icon: Icon(Icons.how_to_vote_sharp, size: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
