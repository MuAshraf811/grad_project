import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/extensions/context_extensions.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/login/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/register/logic/register/register_cubit.dart';
import 'package:graduation_project/features/register/otp.dart';
import 'package:graduation_project/features/register/widgets/progress_stepper.dart';

import 'widgets/gender_radio.dart';

class PhoneNumberView extends StatelessWidget {
  const PhoneNumberView({
    super.key,
    required this.emil,
    required this.pass1,
    required this.pass2,
  });
  final String emil;
  final String pass1;
  final String pass2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is PostingRegisterDataState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'please, wait a few seconds',
                style: getMediumStyle(fontSize: 14, color: Colors.white),
              ),
              backgroundColor: ConstantColors.appMainColor,
            ));
          } else if (state is RegisterDataPostedErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is DataPostedSuccessfullyState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            context.customPush(const Otp());
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const ProgressStepper(
                  isFirstStepAcctive: false,
                  isSecondStepAcctive: true,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Complete Registeration',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const VerticalSpacer(height: 24),
                CustomTextFormFiels(
                  horizontalPadding: 4,
                  contentHorizontalPadding: 8,
                  contentVerticalPadding: 18,
                  controller: context.read<RegisterCubit>().userName,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'this field shouldn\'t be empty';
                    }
                    return null;
                  },
                  suffixIcon: Icons.person,
                  hintText: 'User Name',
                ),
                const VerticalSpacer(height: 12),
                CustomTextFormFiels(
                  hintText: 'First name',
                  horizontalPadding: 4,
                  suffixIcon: Icons.person,
                  contentHorizontalPadding: 8,
                  contentVerticalPadding: 18,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'this field shouldn\'t be empty';
                    }
                    return null;
                  },
                  controller: context.read<RegisterCubit>().firstNameController,
                ),
                const SizedBox(height: 12),
                CustomTextFormFiels(
                  horizontalPadding: 4,
                  contentHorizontalPadding: 8,
                  contentVerticalPadding: 18,
                  controller:
                      context.read<RegisterCubit>().secondNameController,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return 'this field shouldn\'t be empty';
                    }
                    return null;
                  },
                  suffixIcon: Icons.person,
                  hintText: 'Second Name',
                ),
                const VerticalSpacer(height: 16),
                const GenderRadio(),
                const VerticalSpacer(height: 36),
                CustomButton(
                    text: 'Continue',
                    onTap: () {
                      context.read<RegisterCubit>().checkPostDataProgress(
                          email: emil, pass1: pass1, pass2: pass2);

                      //   context.customPush(const Otp());
                    }),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderRadio extends StatefulWidget {
  const GenderRadio({super.key});

  @override
  State<GenderRadio> createState() => _GenderRadioState();
}

class _GenderRadioState extends State<GenderRadio> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 14.w),
      child: Row(
        children: [
          Text(
            'Gender',
            style: getMediumStyle(fontSize: 16, color: Colors.black),
          ),
          const HorizontalSpacer(width: 24),
          CustomRadioButton<bool>(
              title: 'Male',
              groupVal: value,
              val: true,
              onChanged: (val) {
                setState(() {
                  value = val;
                  context.read<RegisterCubit>().genderType(val);
                });
              }),
          const HorizontalSpacer(width: 16),
          CustomRadioButton<bool>(
              title: 'Female',
              groupVal: value,
              val: false,
              onChanged: (val) {
                setState(() {
                  value = val;
                  context.read<RegisterCubit>().genderType(val);
                });
              }),
        ],
      ),
    );
  }
}
