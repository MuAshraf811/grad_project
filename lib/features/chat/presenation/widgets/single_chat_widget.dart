
import 'package:flutter/material.dart';

import '../../../../core/widgets/text_styles.dart';

class ChatModelWidget extends StatelessWidget {
  const ChatModelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(6),
      child: const Row(
        children: [
          CircleAvatar(
            radius: 30,
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Muhammed Ashraf ',
                style: TextStyles.textSize18AndW600Black,
              ),
              Text(
                'Hello Muhammed How are you?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
          SizedBox(width: 32),
          Text(
            '2 am',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
