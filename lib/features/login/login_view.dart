import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/home/view/home_view.dart';
import 'package:graduation_project/features/login/custom_path.dart';
import 'package:graduation_project/features/login/logic/logInCubit/log_in_cubit.dart';
import 'package:graduation_project/features/login/widgets/continue_with_container.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/login/widgets/custom_text_form_field.dart';

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
        child: BlocListener<LogInCubit, LogInState>(
          listener: (context, state) {
            if (state is SendingLogInDataState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Working on it .....',
                  style: getMediumStyle(fontSize: 14, color: Colors.white),
                ),
                backgroundColor: ConstantColors.appMainColor,
              ));
            } else if (state is SendingLogInDataWithError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.errorMessage)));
            } else if (state is SendingLogInDataSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Welcome Back !!')));

              Navigator.of(context).pushReplacementNamed('/');
            }
          },
          child: SingleChildScrollView(
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
                  const VerticalSpacer(height: 24),
                  CustomTextFormFiels(
                    horizontalPadding: 4,
                    validator: _validateEmail,
                    hintText: 'example@email.com',
                    contentHorizontalPadding: 12,
                    contentVerticalPadding: 17,
                    suffixIcon: Icons.email_outlined,
                    controller: context.read<LogInCubit>().emailController,
                  ),
                  const VerticalSpacer(height: 12),
                  CustomTextFormFiels(
                    horizontalPadding: 4,
                    validator: _validatePassWord,
                    hintText: 'enter your password',
                    contentHorizontalPadding: 12,
                    contentVerticalPadding: 17,
                    suffixIcon: Icons.remove_red_eye_outlined,
                    controller: context.read<LogInCubit>().passwordController,
                    obsecureText: true,
                  ),
                  const VerticalSpacer(height: 18),
                  CustomButton(
                      text: 'LOG IN',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomePageView(),
                        ));
                        // Navigator.of(context).pushNamed('/');
                        // if (_formKey.currentState!.validate()) {
                        //   context.read<LogInCubit>().sendingLogInCredinials();
                        //   return;
                        // }
                      }),
                  const VerticalSpacer(height: 16),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forget your password?',
                          style: TextStyle(
                            color: ConstantColors.appMainColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Don\'t have account?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 131, 130, 130),
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/Register');
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.teal,
                                fontSize: 17,
                              ),
                            ))
                      ],
                    ),
                  ),
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
