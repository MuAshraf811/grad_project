import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/features/login/widgets/continue_with_container.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/login/widgets/custom_text_form_field.dart';
import 'package:graduation_project/features/register/phone_number_view.dart';
import 'package:graduation_project/features/register/widgets/password_validation_part.dart';
import '../../core/constants/shared_pref_constants.dart';
import 'widgets/progress_stepper.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPass8Char = false;
  bool isPassHasNumOrSymol = false;
  String passStringth = '';
  final regex = RegExp(r'[0-9!@#$%^&*(),.?":{}|<>]');
  _check() {
    passwordController.addListener(() {
      if (passwordController.text.length >= 8) {
        setState(() {
          isPass8Char = true;
        });
      } else if (passwordController.text.length < 8) {
        setState(() {
          isPass8Char = false;
        });
      }
      if (regex.hasMatch(passwordController.text)) {
        setState(() {
          isPassHasNumOrSymol = true;
        });
      } else if (!regex.hasMatch(passwordController.text)) {
        setState(() {
          isPassHasNumOrSymol = false;
        });
      }
      if (isPass8Char && isPassHasNumOrSymol) {
        setState(() {
          passStringth = 'Strong';
        });
      } else if (!isPass8Char || !isPassHasNumOrSymol) {
        setState(() {
          passStringth = 'Weak';
        });
      }
    });
  }

  @override
  void initState() {
    _check();

    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.save();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpacer(height: 12),
                  const ProgressStepper(
                    isFirstStepAcctive: true,
                    isSecondStepAcctive: false,
                  ),
                  const VerticalSpacer(height: 6),

                  const Text('Hello and Welcome',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ConstantColors.appMainColor)),
                  const VerticalSpacer(height: 24),
                  CustomTextFormFiels(
                    horizontalPadding: 4.w,
                    contentHorizontalPadding: 12.w,
                    contentVerticalPadding: 16.h,
                    controller: emailController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'this field shouldn\'t be empty';
                      } else if (p0.length <= 10) {
                        return 'this field should be 10 digits at least';
                      }
                      return null;
                    },
                    suffixIcon: Icons.email_outlined,
                    hintText: 'Enter your Email',
                  ),
                  const VerticalSpacer(height: 16),
                  CustomTextFormFiels(
                    horizontalPadding: 4.w,
                    contentHorizontalPadding: 12.w,
                    contentVerticalPadding: 16.h,
                    controller: passwordController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'this field shouldn\'t be empty';
                      } else if (p0.length < 7) {
                        return 'password should be 8 digits at least';
                      }
                      return null;
                    },
                    suffixIcon: Icons.remove_red_eye_outlined,
                    hintText: 'Enter password',
                  ),
                  const VerticalSpacer(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: PasswordValidationPart(
                        passStringth: passStringth,
                        isPass8Char: isPass8Char,
                        isPassHasNumOrSymol: isPassHasNumOrSymol),
                  ),
                  const VerticalSpacer(height: 12),
                  CustomTextFormFiels(
                    horizontalPadding: 4.w,
                    contentHorizontalPadding: 12.w,
                    contentVerticalPadding: 16.h,
                    controller: confirmPasswordController,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'this field shouldn\'t be empty';
                      } else if (passwordController.value !=
                          confirmPasswordController.value) {
                        return 'password dosn\'t match';
                      }
                      return null;
                    },
                    suffixIcon: Icons.remove_red_eye_outlined,
                    hintText: 'confirm password',
                  ),
                  const VerticalSpacer(height: 4),
                  // const GenderRadio(),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Already have account?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 131, 130, 130),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              debugPrint(
                                  'Hello, This is sharedPreferences onBoarding value checker in case of changing ');
                              debugPrint(SharedPreferencesManager.getBool(
                                      LocalStorageConstants.onBoardingBoolKey)
                                  .toString());
                              Navigator.of(context)
                                  .pushReplacementNamed('/logIn');
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 16,
                              ),
                            ))
                      ],
                    ),
                  ),
                  const VerticalSpacer(height: 12),
                  CustomButton(
                      text: 'Continue',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => PhoneNumberView(
                                emil: emailController.text,
                                pass1: passwordController.text,
                                pass2: confirmPasswordController.text),
                          ));
                          return;
                        }

                        //  context.read<RegisterCubit>().checkPostDataProgress();
                      }),
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.0.h,
                          width: 130.0.w,
                          color: Colors.grey,
                        ),
                        const HorizontalSpacer(width: 12),
                        const Text(
                          'Or',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const HorizontalSpacer(width: 12),
                        Container(
                          height: 1.0.h,
                          width: 130.0.w,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacer(height: 10),
                  ContinueWithContainer(
                    onTap: () {},
                    name: 'Continue with Google',
                    svgImagePath: 'images/Svgs/google-icon-logo-svg-vector.svg',
                    space: 40.w,
                  ),
                  const VerticalSpacer(height: 8),
                  ContinueWithContainer(
                    onTap: () {},
                    name: 'Continue with Facebook',
                    svgImagePath: 'images/Svgs/facebook-3-logo-svg-vector.svg',
                    space: 30.w,
                  ),
                  const VerticalSpacer(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
