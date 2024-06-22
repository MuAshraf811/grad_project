import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/localization/cubit/localization_cubit.dart';

import '../generated/l10n.dart';

class LangSwitch extends StatelessWidget {
  const LangSwitch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, int>(builder: (context, state) {
      return Container(
        width: 95,
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
        ),
        child: DropdownButton(
          padding: const EdgeInsets.all(4),
          borderRadius: BorderRadius.circular(12),
          alignment: Alignment.centerRight,
          iconSize: 24,
          dropdownColor: Colors.white,
          underline: null,
          value: context.read<LocalizationCubit>().state,
          items: [
            DropdownMenuItem(value: 0, child: Text(S.of(context).en)),
            DropdownMenuItem(value: 1, child: Text(S.of(context).ar)),
           // DropdownMenuItem(value: 2, child: Text(S.of(context).de)),
          ],
          onChanged: (value) {
            context.read<LocalizationCubit>().getInt(value!);
          },
        ),
      );
    });
  }
}
