import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/cubit/localization_cubit.dart';
import 'package:graduation_project/features/cart/cubit/cart_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/pharmacy/pharmacy_data_cubit.dart';
import 'package:graduation_project/features/on_bording/views/on_boarding_view.dart';
import 'package:graduation_project/features/register/logic/register/register_cubit.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'core/constants/colors.dart';
import 'core/localStorage/shared_preferences_storage.dart';
import 'core/router/app_router.dart';
import 'core/theme/cubits/theme_cubit.dart';
import 'core/theme/theme_holder.dart';
import 'features/home/logic/cubit/navigation_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DocDoc extends StatelessWidget {
  const DocDoc({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationCubit>(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<PharmacyDataCubit>(
          create: (context) => PharmacyDataCubit()..getPharmacyDetails(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, int>(
        builder: (context, state) {
          return BlocBuilder<LocalizationCubit, int>(
            builder: (context, state) {
              return ScreenUtilInit(
                designSize: const Size(375, 812),
                minTextAdapt: true,
                splitScreenMode: true,
                ensureScreenSize: true,
                child: BlocProvider<CartCubit>(
                  create: (context) => CartCubit(),
                  child: MaterialApp(
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale:
                        BlocProvider.of<LocalizationCubit>(context).state == 0
                            ? const Locale('en')
                            : const Locale('ar'),

                    localeResolutionCallback: (locale, supportedLocales) {
                      if (locale != null) {
                        return locale;
                      }
                      return const Locale('en');
                    },

                    debugShowCheckedModeBanner: false,
                    theme: SharedPreferencesManager.getIntVal() == 0
                        ? ThemeData(
                            primaryColor: ConstantColors.appMainColor,
                            colorScheme: const ColorScheme.light(
                              primary: ConstantColors.appMainColor,
                            ),
                          )
                        : AppMainTheme.appDarkTheme,
                    onGenerateRoute: (settings) {
                      return AppRouter.generateRoute(settings);
                    },
                    home: // const SettingsView(),
                        const OnBoardingScreen(),
                    //     const MainHomeView(),

                    // const HomePageView(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
