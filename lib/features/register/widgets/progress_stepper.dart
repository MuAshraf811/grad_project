import 'package:flutter/material.dart';

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
      width: double.infinity,
      height: 75,
      child: Stepper(
          connectorThickness: 2,
          elevation: 0,
          currentStep: 0,
          type: StepperType.horizontal,
          steps: [
            Step(
              title: const Text('Create account'),
              content: const Text('Create youraccount'),
              isActive: isFirstStepAcctive,
            ),
            Step(
              title: const Text(' phone number'),
              content: const Text('Enter your mobile number'),
              isActive: isSecondStepAcctive,
            ),
          ]),
    );
  }
}
