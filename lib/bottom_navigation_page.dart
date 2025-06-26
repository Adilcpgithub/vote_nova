import 'package:flutter/material.dart';
import 'package:vote_nova/core/utility/colors.dart';
import 'package:vote_nova/views/home/home_page.dart';
import 'package:vote_nova/views/home/vote_and_result_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [MyHome(), StartvoteShowresultPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 5, left: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(width: 1, color: AppColors.primayColor),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //! Home
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      color:
                          _selectedIndex == 0
                              ? AppColors.primayColor
                              : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () => _onItemTapped(0),
                      icon: Icon(
                        Icons.home_rounded,
                        size: 25,
                        color:
                            _selectedIndex != 0
                                ? AppColors.primayColor
                                : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              //! Vote bottom icon
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10,
                  ),
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      color:
                          _selectedIndex == 1
                              ? AppColors.primayColor
                              : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () => _onItemTapped(1),
                      icon: Icon(
                        Icons.how_to_vote_sharp,
                        size: 25,
                        color:
                            _selectedIndex != 1
                                ? AppColors.primayColor
                                : Colors.white,
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
