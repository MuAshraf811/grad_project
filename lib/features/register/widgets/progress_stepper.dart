import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressStepper extends StatelessWidget {
  const ProgressStepper({
    super.key,
    this.isFirstStepAcctive = false,
    this.isSecondStepAcctive = false,
    this.currentStep = 0,
  });
  final bool isFirstStepAcctive;
  final bool isSecondStepAcctive;
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300.w,
      height: 75.h,
      child: Stepper(
          stepIconMargin: EdgeInsets.all(2.w),
          connectorThickness: 1.h,
          elevation: 0,
          currentStep: 0,
          type: StepperType.horizontal,
          steps: [
            Step(
              title: const Text(
                'Create account',
                style: TextStyle(fontSize: 14),
              ),
              content: const Text('Create youraccount'),
              isActive: isFirstStepAcctive,
            ),
            Step(
              title: const Text(
                ' User Name',
                style: TextStyle(fontSize: 14),
              ),
              content: const Text('Enter your mobile number'),
              isActive: isSecondStepAcctive,
            ),
          ]),
    );
  }
}
