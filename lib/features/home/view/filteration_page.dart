// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/Commonwidgets (1)/spacers.dart';
import '../../login/widgets/custom_button.dart';
import '../../register/widgets/gender_radio.dart';
import '../widgets/custom_check.dart';
import '../widgets/custom_switch.dart';
import '../widgets/filter_appbar.dart';
import '../widgets/text_sectio_title.dart';

class FilterationPage extends StatefulWidget {
  const FilterationPage({super.key});

  @override
  State<FilterationPage> createState() => _FilterationPageState();
}

class _FilterationPageState extends State<FilterationPage> {
  final bool s1Val = true;
  final bool s2Val = true;
  final bool s3Val = true;
  int playDurationGroup = 1;
  int kindOfPlace = 5;
  int gender = 8;
  final bool c1 = true;
  final bool c2 = true;
  final bool c4 = true;
  final bool c5 = true;
  final bool c3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 32),
              FilerationCustomAppBar(onTap: () {
                Navigator.pop(context);
              }),
              Expanded(
                  child: ListView(
                children: [
                  const VerticalSpacer(height: 40),
                  CustomSwitch(switchVal: s1Val, title: 'Newest'),
                  const VerticalSpacer(height: 24),
                  CustomSwitch(switchVal: s2Val, title: 'Apply Offers'),
                  const VerticalSpacer(height: 24),
                  CustomSwitch(switchVal: s3Val, title: 'Low Price'),
                  const VerticalSpacer(height: 24),
                  const SectionTitle(title: 'Types'),
                  const VerticalSpacer(height: 12),
                  CustomRadioButton(
                    onChanged: (p0) {
                      setState(() {
                        playDurationGroup = p0!;
                      });
                    },
                    title: 'Medical',
                    val: 1,
                    groupVal: playDurationGroup,
                  ),
                  CustomRadioButton(
                    onChanged: (p0) {
                      setState(() {
                        playDurationGroup = p0!;
                      });
                    },
                    title: 'Cosmetics',
                    val: 2,
                    groupVal: playDurationGroup,
                  ),
                  CustomRadioButton(
                    onChanged: (p0) {
                      setState(() {
                        playDurationGroup = p0!;
                      });
                    },
                    title: 'Others',
                    val: 3,
                    groupVal: playDurationGroup,
                  ),
                  const VerticalSpacer(height: 20),
                  const SectionTitle(title: 'Pharmaces Location'),
                  const VerticalSpacer(height: 12),
                  CustomRadioButton(
                    onChanged: (p0) {
                      setState(() {
                        kindOfPlace = p0!;
                      });
                    },
                    title: 'Cairo',
                    val: 5,
                    groupVal: kindOfPlace,
                  ),
                  CustomRadioButton(
                    onChanged: (p0) {
                      setState(() {
                        kindOfPlace = p0!;
                      });
                    },
                    title: 'Sharkia',
                    val: 6,
                    groupVal: kindOfPlace,
                  ),
                  const VerticalSpacer(height: 22),
                  const SectionTitle(
                      title: 'Facilities And Services in Pharmacies'),
                  const VerticalSpacer(height: 8),
                  CustomCheckBox(title: 'Delivery', val: c1),
                  CustomCheckBox(title: 'Doctors Existance', val: c2),
                  CustomCheckBox(title: 'Consultation Rooms', val: c3),
                  CustomCheckBox(title: 'Waiting Area', val: c4),
                  CustomCheckBox(title: 'Patient Education Materials', val: c5),
                  const VerticalSpacer(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(onTap: () {}, text: 'Save', width: 150),
                      const HorizontalSpacer(width: 14),
                      CustomButton(onTap: () {}, text: 'Reset', width: 150),
                    ],
                  ),
                  const VerticalSpacer(height: 24),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
