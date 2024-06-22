// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/on_bording/views/widgets/continue_button.dart';
import 'package:graduation_project/features/on_bording/views/widgets/custom_page_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: const Text('اللغة العربية',
                        style: TextStyle(
                            fontSize: 16, color: ConstantColors.appMainColor)),
                  )),
              const VerticalSpacer(height: 60),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomPageItem(index: index);
                  },
                ),
              ),
              const VerticalSpacer(height: 8),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  expansionFactor: 1.8,
                  activeDotColor: ConstantColors.appMainColor,
                  dotColor: ConstantColors.appMainColor.withOpacity(0.3),
                  dotWidth: 12.w,
                  dotHeight: 6.h,
                  spacing: 4,
                ),
              ),
              const VerticalSpacer(height: 40),
              CustomAppButton(
                text: 'Sign Up',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/Register');
                },
                width: double.infinity,
                height: 50,
                buttonColor: ConstantColors.appMainColor,
              ),
              const VerticalSpacer(height: 36),
              const ContinueAsButton(),
              const VerticalSpacer(height: 145),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/mainHome');
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              const VerticalSpacer(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}
