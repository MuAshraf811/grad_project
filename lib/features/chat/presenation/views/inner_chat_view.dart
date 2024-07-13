import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/features/chat/logic/cubit/chat_cubit.dart';
import 'package:graduation_project/features/chat/model/outer_chat_mode.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/Commonwidgets (1)/spacers.dart';
import '../../../../core/Commonwidgets (1)/svg_handler.dart';
import '../../../../core/styles/text_styles.dart';
import '../widgets/message_item.dart';
import '../widgets/send_message_form_filed.dart';

class InnerChatView extends StatefulWidget {
  const InnerChatView({super.key, required this.indx});
  final int indx;

  @override
  State<InnerChatView> createState() => _InnerChatViewState();
}

class _InnerChatViewState extends State<InnerChatView> {
  late ScrollController scroller;

  @override
  void initState() {
    scroller = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final res =
        ModalRoute.of(context)!.settings.arguments as List<OuterChatModel>;
    return Scaffold(
      bottomNavigationBar: SendMessageFormField(
        onSend: () {
          context
              .read<ChatCubit>()
              .postConversationMssages(chatId: res[widget.indx].chatId);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacer(height: 34),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const SvgHandler(
                      imagePath: 'assets/svgs/arrow-left.svg',
                      height: 20,
                      width: 24,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const HorizontalSpacer(width: 24),
                  CircleAvatar(
                    radius: 16.w,
                    backgroundImage: NetworkImage(res[widget.indx].doctorImage),
                  ),
                  const HorizontalSpacer(width: 36),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        res[widget.indx].doctorName,
                        style:
                            getMediumStyle(fontSize: 16, color: Colors.black),
                      ),
                      Text(
                        res[widget.indx].doctorEmail,
                        style: getMediumStyle(fontSize: 12, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
              const VerticalSpacer(height: 6),
              Divider(thickness: 0.18.h),
              const VerticalSpacer(height: 18),
              BlocBuilder<ChatCubit, ChatState>(
                buildWhen: (previous, current) =>
                    current is GettingMessages ||
                    current is GettingMessagesSucces ||
                    current is GettingMessagesError,
                builder: (context, state) {
                  if (state is GettingMessagesSucces) {
                    scroller.hasClients
                        ? scroller.jumpTo(scroller.position.maxScrollExtent)
                        : null;
                    return Expanded(
                      child: ListView.builder(
                        controller: scroller,
                        itemCount:
                            context.read<ChatCubit>().messagesInChat.length,
                        itemBuilder: (context, index) => MessageItem(
                            isSender: false,
                            text: context
                                .read<ChatCubit>()
                                .messagesInChat[index]
                                .text,
                            image: ''),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.3),
                        highlightColor: Colors.white70,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 24.h, left: 4.w),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 18.w,
                                backgroundColor: Colors.grey.withOpacity(0.3),
                              ),
                              const HorizontalSpacer(width: 10),
                              Container(
                                width: 120.w,
                                height: 42.h,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
