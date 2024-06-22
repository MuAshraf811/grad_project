import 'package:flutter/material.dart';

class ContinueAsButton extends StatelessWidget {
  const ContinueAsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Continue As A Guest',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward, color: Colors.black, size: 22)
        ],
      ),
    );
  }
}
