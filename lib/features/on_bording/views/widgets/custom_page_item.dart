import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';

class CustomPageItem extends StatelessWidget {
  CustomPageItem({
    super.key,
    required this.index,
  });

  static const List<String> images = [
    'images/on_boarding/prescription.png',
    'images/on_boarding/Ai_aid.png',
    'images/on_boarding/doctors.png'
  ];
  static const List<String> title = [
    'Get your prescriptions',
    'Ai aid with you',
    'Chat with doctors'
  ];
  static const List<String> description = [
    'You can search and easily choose the prescription,you \ncan also use a map to explore and find nearby\n pharmacies',
    'Features like suggestions and GPT powered chats to ask for advice and questions',
    'Chat with doctors and get advice from them around the clock. You can revise and check you medicines.'
  ];
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200.w,
          height: 200.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.fill,
                  filterQuality: FilterQuality.high)),
        ),
        const VerticalSpacer(height: 18),
        Text(title[index],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            )),
        const VerticalSpacer(height: 18),
        Expanded(
          child: Text(
            description[index],
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
