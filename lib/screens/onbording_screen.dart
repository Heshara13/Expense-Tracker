import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/screens/user_data_screen.dart';
import 'package:expense_tracker/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/data/onbording_data.dart';
import 'package:expense_tracker/screens/onbording/front_page.dart';
import 'package:expense_tracker/screens/onbording/shared_onboarding_screen.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  //page controller
  final PageController _controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                // onborading pages list is passed here
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FrontPage(),
                    SharedOnboardingScreen(
                      title: OnbardingData.onboardingList[0].title,
                      imagePath: OnbardingData.onboardingList[0].imagePath,
                      description: OnbardingData.onboardingList[0].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnbardingData.onboardingList[1].title,
                      imagePath: OnbardingData.onboardingList[1].imagePath,
                      description: OnbardingData.onboardingList[1].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnbardingData.onboardingList[2].title,
                      imagePath: OnbardingData.onboardingList[2].imagePath,
                      description: OnbardingData.onboardingList[2].description,
                    ),
                  ],
                ),
                // page dot indicator
                Container(
                  alignment: const Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                ),

                // skip button
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child:
                        !showDetailsPage
                            ? GestureDetector(
                              onTap: () {
                                _controller.animateToPage(
                                  _controller.page!.toInt() + 1,
                                  duration: Duration(microseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: CustomButton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor,
                              ),
                            )
                            : GestureDetector(
                              onTap: () {
                                //navigate to user data screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => const UserDataScreen(),
                                  ),
                                );
                              },
                              child: CustomButton(
                                buttonName:
                                    showDetailsPage ? "Get Started" : "Next",
                                buttonColor: kMainColor,
                              ),
                            ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
