import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/logic/cubit/navigation_cubit.dart';

import '../../../core/constants/colors.dart';
import '../../../generated/l10n.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key, required this.state});
  final int state;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 9, right: 9),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ConstantColors.appMainColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 2,
          currentIndex: state,
          onTap: (target) {
            BlocProvider.of<NavigationCubit>(context).changeIndex(target);
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: S.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.local_pharmacy_outlined),
              label: 'Pharmacy',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_bag),
              label: S.of(context).cart,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: S.of(context).settings,
            ),
          ],
        ),
      ),
    );
  }
}
