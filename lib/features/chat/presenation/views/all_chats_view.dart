import 'package:flutter/material.dart';
import 'package:graduation_project/core/constants/colors.dart';

import '../../../home/widgets/app_bar_search.dart';
import '../widgets/single_chat_widget.dart';

class MainChatsView extends StatelessWidget {
  const MainChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CutomAppBarSearch(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12, top: 12),
        child: ListView.separated(
          itemBuilder: (context, index) => const ChatModelWidget(),
          separatorBuilder: (context, index) => const Divider(
            color: ConstantColors.appMainColor,
            indent: 50,
            endIndent: 24,
            thickness: 0.8,
          ),
          itemCount: 5,
        ),
      ),
    );
  }
}
