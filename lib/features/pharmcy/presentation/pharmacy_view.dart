import 'package:flutter/material.dart';
import 'package:graduation_project/features/home/widgets/app_bar_search.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CutomAppBarSearch(
          isOut: false,
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: const SizedBox.shrink(),
    );
  }
}
