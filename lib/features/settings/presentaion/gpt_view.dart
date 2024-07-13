// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:graduation_project/core/Commonwidgets%20(1)/custom_text_field.dart';
// import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
// import 'package:graduation_project/core/constants/utils/chat_gpt/chat_gpt_cubit.dart';
// import 'package:graduation_project/core/styles/text_styles.dart';
// import 'package:graduation_project/features/home/view/product_details_view.dart';
// import 'package:graduation_project/features/login/widgets/custom_button.dart';
// import 'package:shimmer/shimmer.dart';

// class ChatGPTView extends StatelessWidget {
//   const ChatGPTView({super.key});
//   static TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 18.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const VerticalSpacer(height: 32),
//               CustomAppBar(title: 'Ask Me any Question..'),
//               const VerticalSpacer(height: 24),
//               CustomTextFormField(
//                 label: 'Write Your Question Hered',
//                 suffixIcon: Icon(Icons.note_add_outlined),
//                 textEditingController: _controller,
//                 fillColor: Colors.grey.withOpacity(0.16),
//                 borderRaduis: 10.r,
//                 maxLines: 8,
//                 minLines: 6,
//                 textFormFieldHeight: 120.h,
//                 verticalPadding: 16.h,
//               ),
//               const VerticalSpacer(height: 16),
//               CustomButton(
//                 text: 'Ask Now',
//                 onTap: () {
//                   context
//                       .read<ChatGptCubit>()
//                       .sendingMyMessage(message: _controller.text);
//                 },
//               ),
//               const VerticalSpacer(height: 26),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
//                 height: 300.h,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   border: Border.all(color: Colors.teal),
//                   borderRadius: BorderRadius.circular(8.r),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black38,
//                       offset: Offset(1.w, 1.h),
//                       spreadRadius: 1.w,
//                       blurRadius: 4.r,
//                       blurStyle: BlurStyle.outer,
//                     ),
//                   ],
//                 ),
//                 child: BlocConsumer<ChatGptCubit, ChatGptState>(
//                   listenWhen: (previous, current) =>
//                       current is SendingYourMessage ||
//                       current is SendingYourMessageError,
//                   listener: (context, state) {
//                     if (state is SendingYourMessage) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: Colors.teal.withOpacity(0.7),
//                           margin: EdgeInsets.only(
//                               bottom: 24.h, right: 12.w, left: 12.w),
//                           duration: Duration(seconds: 2),
//                           showCloseIcon: true,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.r)),
//                           content: Text(
//                             'Your Question Has been Sent',
//                             style: getMediumStyle(
//                                 fontSize: 15, color: Colors.white),
//                           ),
//                         ),
//                       );
//                     }
//                     if (state is SendingYourMessageError) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           behavior: SnackBarBehavior.floating,
//                           backgroundColor: Colors.red.withOpacity(0.8),
//                           margin: EdgeInsets.only(
//                               bottom: 24.h, right: 12.w, left: 12.w),
//                           duration: Duration(seconds: 4),
//                           showCloseIcon: true,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12.r)),
//                           content: Text(
//                             state.error,
//                             style: getMediumStyle(
//                                 fontSize: 15, color: Colors.white),
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                   buildWhen: (previous, current) =>
//                       current is SendingYourMessage ||
//                       current is SendingYourMessageSuccess,
//                   builder: (context, state) {
//                     if (state is SendingYourMessage) {
//                       return Column(
//                         children: [
//                           Text(
//                             'please, wait few seconds........ ',
//                             style: getMediumStyle(
//                                 fontSize: 14, color: Colors.black),
//                           ),
//                           const VerticalSpacer(height: 16),
//                           Shimmer.fromColors(
//                             baseColor: Colors.grey.withOpacity(0.4),
//                             highlightColor: Colors.white,
//                             child: Column(
//                               children: [
//                                 Container(
//                                   width: 260.w,
//                                   height: 10.h,
//                                   color: Colors.grey.withOpacity(0.4),
//                                 ),
//                                 const VerticalSpacer(height: 6),
//                                 Container(
//                                   width: 260.w,
//                                   height: 10.h,
//                                   color: Colors.grey.withOpacity(0.4),
//                                 ),
//                                 const VerticalSpacer(height: 6),
//                                 Container(
//                                   width: 260.w,
//                                   height: 10.h,
//                                   color: Colors.grey.withOpacity(0.4),
//                                 ),
//                                 Container(
//                                   width: 260.w,
//                                   height: 10.h,
//                                   color: Colors.grey.withOpacity(0.4),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                     if (state is SendingYourMessageSuccess) {
//                       return Column(
//                         children: [
//                           Text(
//                             'Your Response is : ',
//                             style: getMediumStyle(
//                                 fontSize: 14, color: Colors.black54),
//                           ),
//                           const VerticalSpacer(height: 14),
//                           Text(
//                             state.messageResponse,
//                             style: getMediumStyle(
//                                 fontSize: 16, color: Colors.black),
//                           ),
//                         ],
//                       );
//                     }
//                     return const SizedBox();
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
