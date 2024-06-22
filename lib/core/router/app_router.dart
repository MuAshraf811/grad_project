import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/logic/cubit/pharmacy/pharmacy_data_cubit.dart';
import 'package:graduation_project/features/home/view/home_view.dart';
import 'package:graduation_project/features/home/view/pharmacy_view.dart';
import 'package:graduation_project/features/login/logic/logInCubit/log_in_cubit.dart';
import 'package:graduation_project/features/login/login_view.dart';
import 'package:graduation_project/features/on_bording/views/on_boarding_view.dart';
import 'package:graduation_project/features/register/otp.dart';
import 'package:graduation_project/features/register/register_view.dart';
import 'package:graduation_project/features/settings/presentaion/settings_view.dart';

import '../../features/chat/presenation/views/all_chats_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomePageView());

      case '/settings':
        return MaterialPageRoute(builder: (_) => const SettingsView());

      case '/onBoarding':
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case '/logIn':
        return MaterialPageRoute(
            builder: (_) => BlocProvider<LogInCubit>(
                  create: (context) => LogInCubit(),
                  child: LoginView(),
                ));

      case '/otp':
        return MaterialPageRoute(builder: (_) => const Otp());

      // case '/phoneNumberView':
      //   return MaterialPageRoute(
      //       builder: (_) => BlocProvider<RegisterCubit>(
      //             create: (context) => RegisterCubit(),
      //             child: const PhoneNumberView(),
      //           ));

      case '/Register':
        return MaterialPageRoute(builder: (_) => const RegisterView());

      case '/mainChat':
        return MaterialPageRoute(
          builder: (_) => const MainChatsView(),
        );
      case '/mainHome':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PharmacyDataCubit>(
            create: (context) => PharmacyDataCubit()..getPharmacyDetails(),
            child: const PharmacyMainView(),
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => HomePageView());
    }
  }
}
