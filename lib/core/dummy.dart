import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/localization/cubit/localization_cubit.dart';

import '../generated/l10n.dart';

class LangSwitch extends StatelessWidget {
  const LangSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, int>(builder: (context, state) {
      return DropdownButton(
        padding: EdgeInsets.all(4.w),
        borderRadius: BorderRadius.circular(12.r),
        alignment: Alignment.centerRight,
        iconSize: 24.w,
        dropdownColor: Colors.white,
        underline: const SizedBox.shrink(),
        value: context.read<LocalizationCubit>().state,
        items: [
          DropdownMenuItem(value: 0, child: Text(S.of(context).en)),
          DropdownMenuItem(value: 1, child: Text(S.of(context).ar)),
          // DropdownMenuItem(value: 2, child: Text(S.of(context).de)),
        ],
        onChanged: (value) {
          context.read<LocalizationCubit>().getInt(value!);
        },
      );
    });
  }
}
