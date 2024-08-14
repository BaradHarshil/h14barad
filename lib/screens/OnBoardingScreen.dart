import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/onboarding_provider.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator(int currentPage) {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: margin_8),
      height: widgetHeight_6,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? CustomColors.kRedColor : CustomColors.kWhiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  Widget _onBoardingPages({required img, required onBoardingSTitle, required onBoardingSDis}) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(img),
              height: size.height*0.3,
              width: imageSize_360,
            ),
          ),
          const SizedBox(height: widgetHeight_40),
          Center(
            child: Text(onBoardingSTitle, style: const TextStyle(color: CustomColors.kWhiteColor, fontSize: 32.0)),
          ),
          const SizedBox(height: widgetHeight_15),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(onBoardingSDis,
                  style: const TextStyle(color: CustomColors.kWhiteColor, fontSize: 18.0), textAlign: TextAlign.center),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          color: CustomColors.kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: padding_40),
            child: Column(
              children: <Widget>[
                /// skip button
                Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(padding_20),
                    child: TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(3);
                      },
                      child: const Text(
                        CustomString.skip,
                        style: TextStyle(
                          color: CustomColors.kWhiteColor,
                          fontSize: fontSize_20,
                        ),
                      ),
                    ),
                  ),
                ),

                /// pageView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Consumer<OnBoardingProvider>(
                      builder: (context, val, child) {
                    return PageView(
                      physics: const ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        val.setOnBoardingPages(page);
                      },
                      children: <Widget>[
                        _onBoardingPages(
                            img: CustomImagePath.onScreenPath1,
                            onBoardingSTitle: CustomString.onBoardingScreenTitle_1,
                            onBoardingSDis: CustomString.onBoardingScreenDiscription_1),
                        _onBoardingPages(
                            img: CustomImagePath.onScreenPath2,
                            onBoardingSTitle: CustomString.onBoardingScreenTitle_2,
                            onBoardingSDis: CustomString.onBoardingScreenDiscription_2),
                        _onBoardingPages(
                            img: CustomImagePath.onScreenPath3,
                            onBoardingSTitle: CustomString.onBoardingScreenTitle_3,
                            onBoardingSDis: CustomString.onBoardingScreenDiscription_3),
                      ],
                    );
                  }),
                ),

                ///Manage Indicator
                Consumer<OnBoardingProvider>(builder: (context, val, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(val.currentPage),
                  );
                }),

                const SizedBox(height: widgetHeight_30),
                Consumer<OnBoardingProvider>(builder: (context, val, child) {
                  return val.currentPage != _numPages - 1 ?
                  Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: TextButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Container(
                                height: imageSize_75,
                                width: imageSize_75,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: CustomColors.kRedColor),
                                child: const Icon(
                                  Icons.arrow_forward_ios_sharp,
                                  color: CustomColors.kWhiteColor,
                                  size: iconSize_30,
                                ),
                              ),
                            ),
                          ),
                        ) :
                  Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: CustomColors.kRedColor),
                          child: InkWell(
                            onTap: () => {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginScreen()),
                              )
                            },
                            child: const Center(
                              child: Text(
                                CustomString.getStarted,
                                style: TextStyle(
                                  color: CustomColors.kWhiteColor,
                                  fontSize: fontSize_20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}