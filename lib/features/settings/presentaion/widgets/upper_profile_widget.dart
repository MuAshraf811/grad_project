import 'package:flutter/material.dart';

class UpperProfileWidget extends StatelessWidget {
  const UpperProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(6),
        child: const Row(
          children: [
            CircleAvatar(
              radius: 40,
            ),
            SizedBox(width: 24),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Muhammed Ashraf ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '01002011850',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
