import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/route_constants.dart';
import 'package:graduation_project/core/dummy.dart';
import 'package:graduation_project/features/settings/presentaion/our_location.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/styles/text_styles.dart';
import '../../../generated/l10n.dart';
import '../logic/cubit/profile_cubit.dart';
import 'widgets/theme_switch.dart';
import 'widgets/upper_profile_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});
  static const _titlesIcon = [
    Icons.account_box,
    Icons.map_outlined,
    Icons.help_center,
    Icons.star,
    Icons.logout,
    Icons.question_mark,
  ];
  static const _iconsColor = [
    Colors.grey,
    Colors.redAccent,
    Color.fromARGB(255, 6, 113, 201),
    Color.fromARGB(255, 238, 220, 56),
    Colors.red,
    Colors.teal,
  ];
  @override
  Widget build(BuildContext context) {
    final listTileTitles = [
      S.of(context).account,
      S.of(context).locations,
      S.of(context).support,
      S.of(context).rate,
      S.of(context).logOut,
    ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(height: 28),
            BlocConsumer<ProfileCubit, ProfileState>(
              listenWhen: (previous, current) =>
                  current is FetchingUserInformationStateError ||
                  current is FetchingUserInformationSuccessState,
              listener: (context, state) {
                if (state is FetchingUserInformationStateError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 12.w, left: 12.w),
                      duration: const Duration(seconds: 4),
                      showCloseIcon: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)),
                      content: Text(
                        state.error,
                        style:
                            getMediumStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  );
                }
                if (state is FetchingUserInformationSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.teal.withOpacity(0.5),
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 12.w, left: 12.w),
                      duration: const Duration(seconds: 4),
                      showCloseIcon: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)),
                      content: Text(
                        'Hello ${state.data[0].firstName} ${state.data[0].lastName}',
                        style:
                            getMediumStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                  );
                }
              },
              buildWhen: (previous, current) =>
                  current is FetchingUserInformationState ||
                  current is FetchingUserInformationSuccessState,
              builder: (context, state) {
                if (state is FetchingUserInformationState) {
                  return const ShimmerINProfile();
                }
                if (state is FetchingUserInformationSuccessState) {
                  return UpperProfileWidget(
                    email: state.data[0].email,
                    name:
                        '${state.data[0].firstName} ${state.data[0].lastName}',
                    image: state.data[0].image ?? '',
                  );
                }
                return const ShimmerINProfile();
              },
            ),
            const SizedBox(height: 14),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SizedBox(
                height: 30,
                child: ThemeSwitch(),
              ),
            ),
            const VerticalSpacer(height: 24),
            ListTile(
              leading: const Icon(
                Icons.language,
                color: Colors.blue,
              ),
              title: Text(S.of(context).lang),
              trailing: const LangSwitch(),
            ),
            const VerticalSpacer(height: 12),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: ConstantColors.appMainColor,
                    onTap: () async {
                      switch (index) {
                        case 0:
                          Navigator.of(context).pushNamed(
                            RoutesConstants.profileView,
                            arguments: context.read<ProfileCubit>().userInfo,
                          );
                        case 1:
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LocationHandlerView(),
                          ));
                        case 2:
                        case 3:
                          await launchUrl(Uri.parse(
                              'https://frontend-iksirs.vercel.app/en/home'));
                        case 4:
                          await launchUrl(Uri.parse(
                              'https://frontend-iksirs.vercel.app/en/home'));
                        case 5:
                          Navigator.pushReplacementNamed(context, '/logIn');

                        // case 6:
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => Gemni(),
                        //   ));
                      }
                    },
                    child: ListTile(
                      leading: Icon(
                        _titlesIcon[index],
                        color: _iconsColor[index],
                      ),
                      title: Text(
                        listTileTitles[index],
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
                itemCount: listTileTitles.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerINProfile extends StatelessWidget {
  const ShimmerINProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.4),
      highlightColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(4.w),
        margin: EdgeInsets.all(6.w),
        child: Row(
          children: [
            CircleAvatar(
              radius: 34.w,
              backgroundColor: Colors.grey.withOpacity(0.35),
            ),
            const HorizontalSpacer(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(6.r)),
                ),
                const VerticalSpacer(height: 14),
                Container(
                  width: 200.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(6.r)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
