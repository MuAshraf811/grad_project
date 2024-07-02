import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/register/logic/register/register_cubit.dart';

import 'logic/logInCubit/log_in_cubit.dart';
import 'widgets/custom_text_form_field.dart';

class OtpForgetPassword extends StatelessWidget {
  const OtpForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is SendingOTP) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                'it may take few seconds',
                style: getMediumStyle(fontSize: 14, color: Colors.white),
              ),
              backgroundColor: ConstantColors.appMainColor,
            ));
          } else if (state is SendingOTPFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is SendingOTPSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Change you password')));

            showNewPasswordsSheet(context);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: const BoxDecoration(),
                    child: SvgPicture.asset(
                      'images/Svgs/transaction-password-otp-verification-code-security-svgrepo-com.svg',
                      //fit: BoxFit.fill,
                      theme: const SvgTheme(
                        currentColor: Colors.teal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'We\'ve sent a Verification code \nto your Mobile number',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 24),
                OtpTextField(
                  numberOfFields: 6,
                  onSubmit: (value) {
                    context.read<RegisterCubit>().confirmOTP(otp: value);
                  },
                  showCursor: true,
                  textStyle: const TextStyle(
                    color: ConstantColors.appMainColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  enabled: true,
                  obscureText: false,
                  focusedBorderColor: ConstantColors.appMainColor,
                  borderColor: ConstantColors.appMainColor,
                  borderRadius: BorderRadius.circular(8),
                  autoFocus: false,
                  keyboardType: TextInputType.number,
                  showFieldAsBox: true,
                  borderWidth: 2,
                  fieldWidth: 50,
                  cursorColor: ConstantColors.appMainColor,
                ),
                const SizedBox(height: 32),
                CustomButton(
                    text: 'Submit',
                    onTap: () {
                      //  context.customPush(HomePageView());
                    }),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Didn\'t recieve code?',
                      style: TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Resend again.',
                          style: TextStyle(color: Colors.teal, fontSize: 20),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> showNewPasswordsSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      useSafeArea: true,
      barrierColor: Colors.black.withOpacity(0.25),
      constraints: BoxConstraints(maxHeight: 500.h),
      builder: (context) {
        final _newPassFormKey = GlobalKey<FormState>();
        return ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
          child: Container(
            height: 500.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
            color: Colors.white,
            child: Form(
              key: _newPassFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Enter Your New Password',
                          style: getMediumStyle(
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgHandler(
                              imagePath: 'assets/svgs/close-circle.svg',
                              height: 20,
                              width: 20,
                              fit: BoxFit.fill),
                        )
                      ],
                    ),
                  ),
                  const VerticalSpacer(height: 32),
                  CustomTextFormFiels(
                    horizontalPadding: 4.w,
                    contentHorizontalPadding: 12.w,
                    contentVerticalPadding: 16.h,
                    controller: context.read<LogInCubit>().passwordController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'this field shouldn\'t be empty';
                      }
                      return null;
                    },
                    suffixIcon: Icons.password,
                    hintText: 'Enter Your New Password',
                  ),
                  const VerticalSpacer(height: 20),
                  CustomTextFormFiels(
                    horizontalPadding: 4.w,
                    contentHorizontalPadding: 12.w,
                    contentVerticalPadding: 16.h,
                    controller:
                        context.read<LogInCubit>().confirmpasswordController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'this field shouldn\'t be empty';
                      } else if (context
                              .read<LogInCubit>()
                              .confirmpasswordController
                              .text !=
                          context.read<LogInCubit>().passwordController.text) {
                        return '2 Passwords Don\'t Match';
                      }
                      return null;
                    },
                    suffixIcon: Icons.password,
                    hintText: 'Confirm Your New Password',
                  ),
                  const VerticalSpacer(height: 24),
                  BlocConsumer<LogInCubit, LogInState>(
                    listenWhen: (previous, current) =>
                        current is SendingNewPasswordsSucess ||
                        current is SendingNewPasswordsError,
                    listener: (context, state) {
                      if (state is SendingNewPasswordsError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red.withOpacity(0.8),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                bottom: 18.h, left: 10.w, right: 10.w),
                            duration: Duration(seconds: 4),
                            content: Text(
                              state.message,
                              style: getMediumStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        );
                      }
                      if (state is SendingNewPasswordsSucess) {
                        Navigator.of(context).pop();
                        _newPassFormKey.currentState!.reset();
                        context.read<LogInCubit>().emailController.clear();
                        context.read<LogInCubit>().passwordController.clear();
                        Navigator.of(context).popAndPushNamed('/logIn');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.teal.withOpacity(0.7),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.only(
                                bottom: 18.h, left: 10.w, right: 10.w),
                            duration: Duration(seconds: 4),
                            content: Text(
                              state.message,
                              style: getMediumStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                        );
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is SendingNewPasswords ||
                        current is SendingNewPasswordsSucess,
                    builder: (context, state) {
                      if (state is SendingNewPasswords) {
                        return Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 300.w,
                            height: 38.h,
                            color: Colors.teal,
                            child: Center(
                              child: Transform.scale(
                                scale: 0.7,
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return CustomButton(
                          text: 'Submit',
                          fontSize: 17,
                          onTap: () {
                            if (_newPassFormKey.currentState!.validate()) {
                              context.read<LogInCubit>().sendingNewPassword();
                            }
                          });
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
