import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/chat/logic/cubit/chat_cubit.dart';
import 'package:graduation_project/features/chat/presenation/views/inner_chat_view.dart';
import 'package:graduation_project/features/home/models/doctors.dart';
import 'package:graduation_project/features/home/view/pharmacy_view.dart';

import '../../../home/widgets/app_bar_search.dart';
import '../widgets/single_chat_widget.dart';

class MainChatsView extends StatelessWidget {
  const MainChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final res =
        ModalRoute.of(context)!.settings.arguments as List<DoctorsModel>;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            isDismissible: false,
            backgroundColor: Colors.transparent,
            builder: (context) => BlocListener<ChatCubit, ChatState>(
              listenWhen: (previous, current) => current is FetchingAllChats,
              listener: (context, state) {
                if (state is FetchingAllChats) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                padding: EdgeInsets.only(top: 22.h),
                height: 500.h,
                margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 12.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: 14.w, right: 18.w, bottom: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose your contact',
                            style: getMediumStyle(
                                fontSize: 15, color: Colors.black),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              context.read<ChatCubit>().fetchingAllChats();
                            },
                            child: const SvgHandler(
                              imagePath: 'assets/svgs/close-circle.svg',
                              height: 18,
                              width: 18,
                              fit: BoxFit.fill,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: res.length,
                        itemBuilder: (context, index) => InkWell(
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<ChatCubit>()
                                  .createChat(res[index].id);
                            },
                            child: Container(
                              height: 100.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 12.h),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.teal),
                                borderRadius: BorderRadius.circular(20.r),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(res[index].doctorImage),
                                  ),
                                  const HorizontalSpacer(width: 16),
                                  const HorizontalSpacer(width: 12),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        " ${res[index].firstName} ${res[index].lastName}",
                                        style: getMediumStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      const VerticalSpacer(height: 6),
                                      Text(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        res[index].email,
                                        style: getMediumStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                      const VerticalSpacer(height: 12),
                                      Text(
                                        res[index].specialization,
                                        style: getMediumStyle(
                                            fontSize: 12,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        child: Icon(Icons.add, size: 22.h),
      ),
      appBar: AppBar(
        title: const CutomAppBarSearch(
          isOut: false,
        ),
        toolbarHeight: 80.h,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 6.h),
        child: BlocConsumer<ChatCubit, ChatState>(
          listenWhen: (previous, current) =>
              current is AddingNewChat ||
              current is AddingNewChatError ||
              current is FetchingAllChatsSuccess,
          listener: (context, state) {
            if (state is AddingNewChatError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.white,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
                showCloseIcon: true,
                closeIconColor: Colors.red,
                padding: EdgeInsets.all(8.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: const BorderSide(color: Colors.teal)),
                content: Text(
                  'Adding new Chat ........',
                  style: getMediumStyle(fontSize: 15, color: Colors.red),
                ),
              ));
            }
            if (state is AddingNewChat) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.white,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 14.w),
                showCloseIcon: true,
                closeIconColor: Colors.teal,
                padding: EdgeInsets.all(8.w),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    side: const BorderSide(color: Colors.teal)),
                content: Text(
                  'Adding new Chat ........',
                  style: getMediumStyle(fontSize: 15, color: Colors.teal),
                ),
              ));
            }
          },
          buildWhen: (previous, current) =>
              current is FetchingAllChats ||
              current is FetchingAllChatsError ||
              current is FetchingAllChatsSuccess,
          builder: (context, state) {
            if (state is FetchingAllChats) {
              return ListView.builder(
                itemBuilder: (context, index) => const ShimmerPharmacy(),
                itemCount: 5,
              );
            }
            if (state is FetchingAllChatsSuccess) {
              return ListView.separated(
                itemBuilder: (context, index) => ChatModelWidget(
                  onTap: () {
                    context.read<ChatCubit>().getConversationMssages(
                        chatId:
                            context.read<ChatCubit>().allChats[index].chatId);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(
                              arguments: context.read<ChatCubit>().allChats),
                          builder: (context) => InnerChatView(
                            indx: index,
                          ),
                        ));
                  },
                  onDelete: () {
                    context.read<ChatCubit>().deletaChat(
                        context.read<ChatCubit>().allChats[index].chatId);
                  },
                  name: context.read<ChatCubit>().allChats[index].doctorName,
                  image: context.read<ChatCubit>().allChats[index].doctorImage,
                  email: context.read<ChatCubit>().allChats[index].doctorEmail,
                ),
                separatorBuilder: (context, index) => Divider(
                  color: ConstantColors.appMainColor,
                  indent: 50.w,
                  endIndent: 24.w,
                  thickness: 0.8.h,
                ),
                itemCount: context.read<ChatCubit>().allChats.length,
              );
            }
            if (state is FetchingAllChatsError) {
              return Center(child: Text(state.error));
            }
            return const Center(child: Text('OOPS , Try later!!'));
          },
        ),
      ),
    );
  }
}
