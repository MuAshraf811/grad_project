import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/login/logic/logInCubit/log_in_cubit.dart';
import 'package:graduation_project/features/login/otp.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/login/widgets/custom_text_form_field.dart';

class ForgetPassWordView extends StatelessWidget {
  const ForgetPassWordView({super.key});

  static final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpacer(height: 72),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    'Forget Your Password ?',
                    style: getMediumStyle(fontSize: 24, color: Colors.teal),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w, top: 8.h),
                  child: Text(
                    'Enter Your Email...',
                    style: getMediumStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                const VerticalSpacer(height: 32),
                CustomTextFormFiels(
                  horizontalPadding: 0.w,
                  contentHorizontalPadding: 12.w,
                  contentVerticalPadding: 16.h,
                  controller: context.read<LogInCubit>().emailController,
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
                BlocConsumer<LogInCubit, LogInState>(
                  listenWhen: (previous, current) =>
                      current is PostingOtpError ||
                      current is PostingOtpSuccess,
                  listener: (context, state) {
                    if (state is PostingOtpSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.teal,
                            duration: Duration(seconds: 2),
                            margin: EdgeInsets.only(
                                bottom: 18.h, left: 12.w, right: 12.w),
                            content: Text(
                              state.message,
                              style: getMediumStyle(
                                  fontSize: 15, color: Colors.white),
                            )),
                      );
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OtpForgetPassword(),
                      ));
                    }
                    if (state is PostingOtpError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.red,
                            margin: EdgeInsets.only(
                                bottom: 18.h, left: 12.w, right: 12.w),
                            content: Text(
                              state.message,
                              style: getMediumStyle(
                                  fontSize: 15, color: Colors.white),
                            )),
                      );
                    }
                  },
                  buildWhen: (previous, current) =>
                      current is PostingOTP ||
                      current is PostingOtpSuccess ||
                      current is PostingOtpError,
                  builder: (context, state) {
                    if (state is PostingOTP) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Colors.teal,
                          ),
                          child: Center(
                            child: Transform.scale(
                                scale: 0.7,
                                child: CircularProgressIndicator.adaptive(
                                  backgroundColor: Colors.white,
                                )),
                          ),
                        ),
                      );
                    }
                    return CustomButton(
                        text: 'Get Otp',
                        fontSize: 18,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<LogInCubit>().sendingEmail();
                          }
                        });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
