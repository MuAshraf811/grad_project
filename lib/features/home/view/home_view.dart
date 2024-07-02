// ignore_for_file: unused_field, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/cart/cubit/cart_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/discount/offers_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/doctors_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/home_bloc_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/navigation_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/product/cubit/product_cubit.dart';
import 'package:graduation_project/features/home/view/main_app_screen.dart';
import 'package:graduation_project/features/home/view/pharmacy_view.dart';
import 'package:graduation_project/features/settings/logic/cubit/profile_cubit.dart';
import 'package:graduation_project/features/settings/presentaion/settings_view.dart';
import '../../cart/presentation/cart_view.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePageView extends StatelessWidget {
  HomePageView({super.key});
  //this list contains all screens that navigation bar will move to
  final _routersInNav = [
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBlocCubit>(
          create: (context) => HomeBlocCubit()..getCategroiesData(),
        ),
        BlocProvider<AllProductCubit>(
          create: (context) => AllProductCubit()..getProductDetails(),
        ),
        BlocProvider<OffersCubit>(
          create: (context) => OffersCubit()..getProductDiscount(),
        ),
        BlocProvider<DoctorsCubit>(
          create: (context) => DoctorsCubit()..getDoctorsDetails(),
        ),
      ],
      child: const MainAppScreen(),
    ),
    const PharmacyMainView(),
    BlocProvider<CartCubit>(
      create: (context) => CartCubit()..getCartItemFromDataBase(),
      child: const CartView(),
    ),
    BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit()..fetchUserData(),
      child: const SettingsView(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: _routersInNav[BlocProvider.of<NavigationCubit>(context).state],
          bottomNavigationBar: BottomNavBarWidget(
            state: context.read<NavigationCubit>().state,
          ),
        );
      },
    );
  }
}
