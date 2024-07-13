import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/logic/cubit/product/cubit/product_cubit.dart';

import '../view/main_app_screen.dart';

class CutomAppBarSearch extends StatelessWidget {
  const CutomAppBarSearch({
    super.key,
    required this.isOut,
  });
  final bool isOut;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: true,
      onTapOutside: (event) {
        context.read<AllProductCubit>().searchResults.clear();
      },
      onTap: () async {
        await showSearch(context: context, delegate: CustomSearch());
      },
      onChanged: (value) {
        context.read<AllProductCubit>().filterSearch(wantedProduct: value);
        debugPrint(
            '**************Hello this is search part ********************');
        debugPrint(context.read<AllProductCubit>().searchResults.toString());
      },
      decoration: const InputDecoration(
        labelText: 'Search ',
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: Colors.grey,
        ),
        constraints: BoxConstraints(
          maxHeight: 44,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
