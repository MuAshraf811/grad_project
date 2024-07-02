import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/custom_text_field.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';
import 'package:graduation_project/features/settings/logic/cubit/profile_cubit.dart';
import 'package:graduation_project/features/settings/model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/constants/utils/image_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  static XFile? _file;
  static String? _fileName;
  @override
  Widget build(BuildContext context) {
    final res = ModalRoute.of(context)?.settings.arguments as List<UserModel>;
    final emailController = TextEditingController(text: res[0].email);
    final firstNameController = TextEditingController(text: res[0].firstName);
    final birthDateController = TextEditingController(text: res[0].birthDate);
    final bioController = TextEditingController(text: res[0].bio);
    final lastNameController = TextEditingController(text: res[0].lastName);
    final userController = TextEditingController(text: res[0].user);
    final _key = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                const VerticalSpacer(height: 32),
                CustomAppBar(title: 'Profile Information', padding: 2),
                const VerticalSpacer(height: 28),
                Text(
                  'Profile Photo',
                  style: getMediumStyle(fontSize: 16, color: Colors.black),
                ),
                const VerticalSpacer(height: 6),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Container(
                      width: 110.w,
                      height: 100.h,
                    ),
                    Positioned(
                      left: 4.w,
                      child: Container(
                        width: 82.w,
                        height: 82.w,
                        decoration: _file == null
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(res[0].image ?? '')),
                                border: Border.all(color: Colors.teal))
                            : BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(
                                    File(_file!.path),
                                  ),
                                ),
                                border: Border.all(color: Colors.teal)),
                      ),
                    ),
                    Positioned(
                      left: 68.w,
                      child: InkWell(
                        onTap: () {
                          showBottomSheetImagePicker(context);
                        },
                        child: Container(
                          width: 26.w,
                          height: 26.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: Border.all(color: Colors.teal),
                          ),
                          child: Center(
                            child: SvgHandler(
                                imagePath: 'assets/svgs/edit-2.svg',
                                height: 16,
                                color: Colors.teal,
                                width: 16,
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const VerticalSpacer(height: 8),
                Divider(
                  color: Colors.teal,
                  thickness: 0.4.w,
                  endIndent: 24.w,
                  indent: 24.w,
                ),
                const VerticalSpacer(height: 14),
                Text(
                  'Full Name',
                  style: getMediumStyle(fontSize: 16, color: Colors.black),
                ),
                const VerticalSpacer(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          label: 'First Name',
                          textEditingController: firstNameController,
                          borderRaduis: 12,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "This Field should not be empty";
                            }
                            return null;
                          },
                          suffixIcon: SvgHandler(
                              imagePath: 'assets/svgs/profile-circle.svg',
                              height: 18,
                              width: 18,
                              fit: BoxFit.fill)),
                    ),
                    const HorizontalSpacer(width: 16),
                    Expanded(
                      child: CustomTextFormField(
                          label: 'Last Name',
                          textEditingController: lastNameController,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "This Field should not be empty";
                            }
                            return null;
                          },
                          borderRaduis: 12,
                          suffixIcon: SvgHandler(
                              imagePath: 'assets/svgs/profile-circle.svg',
                              height: 18,
                              width: 18,
                              fit: BoxFit.fill)),
                    ),
                  ],
                ),
                Text(
                  'User Name',
                  style: getMediumStyle(fontSize: 16, color: Colors.black),
                ),
                const VerticalSpacer(height: 8),
                CustomTextFormField(
                  label: 'User',
                  textEditingController: userController,
                  readOnly: true,
                  borderRaduis: 12,
                  suffixIcon: Icon(Icons.person_2, size: 19),
                ),
                const VerticalSpacer(height: 16),
                Text(
                  'Email',
                  style: getMediumStyle(fontSize: 16, color: Colors.black),
                ),
                const VerticalSpacer(height: 8),
                CustomTextFormField(
                  label: 'Email',
                  textEditingController: emailController,
                  readOnly: true,
                  borderRaduis: 12,
                  suffixIcon: Icon(Icons.mark_email_read_outlined, size: 19),
                ),
                const VerticalSpacer(height: 16),
                Text(
                  'Data of Birth',
                  style: getMediumStyle(fontSize: 16, color: Colors.black),
                ),
                const VerticalSpacer(height: 8),
                CustomTextFormField(
                  label: 'DD/MM/YYYY',
                  textEditingController: birthDateController,
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    if (val.length == 2 || val.length == 5) {
                      birthDateController.text += '/';
                    }
                    if (val.length >= 11) {
                      birthDateController.text = val.substring(0, 10);
                    }
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "This Field should not be empty";
                    }
                    return null;
                  },
                  borderRaduis: 12,
                  suffixIcon: Icon(Icons.date_range, size: 19),
                ),
                const VerticalSpacer(height: 16),
                Text(
                  'Bio',
                  style: getMediumStyle(fontSize: 16, color: Colors.black),
                ),
                const VerticalSpacer(height: 8),
                CustomTextFormField(
                  label: 'Tell Us About Yourself',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return "This Field should not be empty";
                    }
                    return null;
                  },
                  borderRaduis: 12,
                  verticalPadding: 12,
                  isBuildCounterWantd: true,
                  textEditingController: bioController,
                  textFormFieldHeight: 100.h,
                  maxLength: 200,
                  maxLines: 10,
                  minLines: 9,
                  suffixIcon: const SizedBox.shrink(),
                ),
                const VerticalSpacer(height: 24),
                BlocConsumer<ProfileCubit, ProfileState>(
                  listenWhen: (previous, current) =>
                      current is UpdatingUserInfoState ||
                      current is UpdatingUserInfoSuccessState ||
                      current is UpdatingUserInfoErrorState,
                  buildWhen: (previous, current) =>
                      current is UpdatingUserInfoState ||
                      current is UpdatingUserInfoSuccessState ||
                      current is UpdatingUserInfoErrorState,
                  listener: (context, state) {
                    if (state is UpdatingUserInfoErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.teal.withOpacity(0.5),
                          margin: EdgeInsets.only(
                              bottom: 24.h, right: 12.w, left: 12.w),
                          duration: Duration(seconds: 4),
                          showCloseIcon: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          content: Text(
                            state.message,
                            style: getMediumStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                      );
                    }
                    if (state is UpdatingUserInfoSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.teal.withOpacity(0.5),
                          margin: EdgeInsets.only(
                              bottom: 24.h, right: 12.w, left: 12.w),
                          duration: Duration(seconds: 4),
                          showCloseIcon: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r)),
                          content: Text(
                            state.message,
                            style: getMediumStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdatingUserInfoState) {
                      return Container(
                        width: 300.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Center(
                          child: Transform.scale(
                            scale: 0.7,
                            child: CircularProgressIndicator.adaptive(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }
                    return CustomButton(
                      text: 'Change',
                      onTap: () async {
                        if (_key.currentState!.validate()) {
                          context.read<ProfileCubit>().updatingUserInfo(
                              firstName: firstNameController.text,
                              lastName: lastNameController.text,
                              file: _file ?? XFile(''),
                              fileName: _fileName ?? '',
                              userName: userController.text,
                              birthDate: birthDateController.text,
                              gender: 'male',
                              bio: bioController.text);
                        }
                      },
                    );
                  },
                ),
                const VerticalSpacer(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showBottomSheetImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 12.w),
            margin: EdgeInsets.only(
              left: 15.w,
              right: 15.w,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    topLeft: Radius.circular(12.r))),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    ImagePickerHandler.init();
                    await ImagePickerHandler.pickImage(ImageSource.camera);
                    _file = ImagePickerHandler.image;
                    Navigator.of(context).pop();
                    _fileName = _file!.path.split('/').last;
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 18.w,
                        color: Colors.grey,
                      ),
                      const HorizontalSpacer(width: 12),
                      Text(
                        'Camera ',
                        style:
                            getMediumStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: 6.w,
                  endIndent: 6.w,
                  color: Colors.black,
                  thickness: 0.7.h,
                  height: 32.h,
                ),
                InkWell(
                  onTap: () async {
                    ImagePickerHandler.init();
                    await ImagePickerHandler.pickImage(ImageSource.gallery);
                    _file = ImagePickerHandler.image;
                    _fileName = _file!.path.split('/').last;
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo,
                        size: 18.w,
                        color: Colors.grey,
                      ),
                      const HorizontalSpacer(width: 12),
                      Text(
                        ' Gallery ',
                        style:
                            getMediumStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VerticalSpacer(height: 3),
          Container(
            height: 40.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r))),
            margin: EdgeInsets.only(
              bottom: 24.h,
              left: 15.w,
              right: 15.w,
            ),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    size: 18.w,
                    color: Colors.red,
                  ),
                  const HorizontalSpacer(width: 12),
                  Text(
                    ' Cancel ',
                    style: getMediumStyle(fontSize: 16, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
