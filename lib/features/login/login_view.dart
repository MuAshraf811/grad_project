import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/home/view/home_view.dart';
import 'package:graduation_project/features/login/custom_path.dart';
import 'package:graduation_project/features/login/forget_password.dart';
import 'package:graduation_project/features/login/logic/logInCubit/log_in_cubit.dart';
import 'package:graduation_project/features/login/logic/log_in_method.dart';
import 'package:graduation_project/features/login/widgets/continue_with_container.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/login/widgets/custom_text_form_field.dart';

import 'widgets/donot_have_account.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  String? _validateEmail(String? val) {
    if (val!.isEmpty) {
      return 'this field shouldn\'t be empty';
    }
    return null;
  }

  String? _validatePassWord(String? val) {
    if (val!.isEmpty) {
      return 'this field shouldn\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocProvider<LogInMethodCubit>(
            create: (context) => LogInMethodCubit(),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipPath(
                      clipper: CustomPath(),
                      child: Container(
                        width: 160.w,
                        height: 120.h,
                        color: Colors.teal.shade300,
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 2),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 28),
                  BlocBuilder<LogInMethodCubit, int>(
                    builder: (context, state) {
                      return LOgInType(
                        isEmail: context.read<LogInMethodCubit>().state == 0
                            ? true
                            : false,
                        onTap1: () {
                          context.read<LogInMethodCubit>().checkLogInMethod(0);
                        },
                        onTap2: () {
                          context.read<LogInMethodCubit>().checkLogInMethod(1);
                        },
                      );
                    },
                  ),
                  const VerticalSpacer(height: 24),
                  BlocBuilder<LogInMethodCubit, int>(
                    builder: (context, state) {
                      return CustomTextFormFiels(
                        horizontalPadding: 4,
                        validator: _validateEmail,
                        hintText:
                            state == 0 ? 'example123@email.com' : 'User Name',
                        contentHorizontalPadding: 12,
                        contentVerticalPadding: 17,
                        suffixIcon:
                            state == 0 ? Icons.email_outlined : Icons.person_2,
                        controller: state == 0
                            ? context.read<LogInCubit>().emailController
                            : context.read<LogInCubit>().userController,
                      );
                    },
                  ),
                  const VerticalSpacer(height: 12),
                  CustomTextFormFiels(
                    horizontalPadding: 4,
                    validator: _validatePassWord,
                    hintText: 'Enter Your Password',
                    contentHorizontalPadding: 12,
                    contentVerticalPadding: 17,
                    suffixIcon: Icons.password_outlined,
                    controller: context.read<LogInCubit>().passwordController,
                    obsecureText: true,
                  ),
                  const VerticalSpacer(height: 16),
                  BlocConsumer<LogInCubit, LogInState>(
                    listenWhen: (previous, current) =>
                        current is SendingLogInDataSuccess ||
                        current is SendingLogInDataWithError,
                    listener: (context, state) {
                      if (state is SendingLogInDataWithError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: true,
                            duration: Duration(seconds: 10),
                            padding: EdgeInsets.only(left: 32.w),
                            margin: EdgeInsets.only(
                                bottom: 18.h, right: 8.w, left: 8.w),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r)),
                            content: Text(
                              'Enter a Valid Email And Password',
                              style: getMediumStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ),
                        );
                      }
                      if (state is SendingLogInDataSuccess) {
                        _formKey.currentState!.reset();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HomePageView(),
                          ),
                        );
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is SendingLogInDataState ||
                        current is SendingLogInDataWithError,
                    builder: (context, state) {
                      if (state is SendingLogInDataState) {
                        return Container(
                          width: double.infinity,
                          height: 38.h,
                          margin: EdgeInsets.symmetric(horizontal: 18.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: Colors.teal,
                          ),
                          child: Center(
                            child: Transform.scale(
                              scale: 0.75,
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                                strokeWidth: 3.w,
                              ),
                            ),
                          ),
                        );
                      }
                      return CustomButton(
                          text: 'LOG IN',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<LogInCubit>()
                                  .sendingLogInCredinials();
                            }
                          });
                    },
                  ),
                  const VerticalSpacer(height: 18),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ForgetPassWordView(),
                          ));
                        },
                        child: Text('Forget Password ?',
                            style: getMediumStyle(
                              fontSize: 16,
                              color: Colors.teal,
                            )),
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 4),
                  DonotHaveAccountPart(),
                  const VerticalSpacer(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1.0,
                          width: 150.0,
                          color: Colors.grey,
                        ),
                        const HorizontalSpacer(width: 12),
                        const Text(
                          'Or',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const HorizontalSpacer(width: 12),
                        Container(
                          height: 1.0,
                          width: 150.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpacer(height: 16),
                  ContinueWithContainer(
                    onTap: () {},
                    name: 'Continue with Google',
                    svgImagePath: 'images/Svgs/google-icon-logo-svg-vector.svg',
                    space: 48,
                  ),
                  const VerticalSpacer(height: 12),
                  ContinueWithContainer(
                    onTap: () {},
                    name: 'Continue with Facebook',
                    svgImagePath: 'images/Svgs/facebook-3-logo-svg-vector.svg',
                    space: 30,
                  ),
                  const VerticalSpacer(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LOgInType extends StatelessWidget {
  const LOgInType({
    super.key,
    required this.onTap1,
    required this.onTap2,
    required this.isEmail,
  });
  final bool isEmail;
  final VoidCallback onTap1;
  final VoidCallback onTap2;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInCubit, LogInState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: onTap1,
              child: Container(
                width: 110.w,
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color:
                        isEmail ? Colors.teal.withOpacity(0.85) : Colors.white,
                    border: Border.all(color: Colors.teal, width: 0.7.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgHandler(
                      imagePath: 'assets/svgs/sms.svg',
                      height: 20,
                      width: 16,
                      fit: BoxFit.fill,
                      color: isEmail ? Colors.white : Colors.teal,
                    ),
                    const HorizontalSpacer(width: 6),
                    Text(
                      'Email',
                      style: getRegularStyle(
                        fontSize: 16,
                        color: isEmail ? Colors.white : Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const HorizontalSpacer(width: 18),
            InkWell(
              onTap: onTap2,
              child: Container(
                width: 110.w,
                height: 48.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: isEmail ? Colors.white : Colors.teal,
                    border: Border.all(color: Colors.teal, width: 1.75.h)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgHandler(
                      imagePath: 'assets/svgs/profile-nav.svg',
                      height: 20,
                      width: 16,
                      fit: BoxFit.fill,
                      color: isEmail ? Colors.teal : Colors.white,
                    ),
                    const HorizontalSpacer(width: 4),
                    Text(
                      'User',
                      style: getRegularStyle(
                        fontSize: 16,
                        color: isEmail ? Colors.teal : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
