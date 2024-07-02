import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DonotHaveAccountPart extends StatelessWidget {
  const DonotHaveAccountPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Don\'t have account?',
            style: TextStyle(
              color: Color.fromARGB(255, 131, 130, 130),
              fontSize: 16,
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/Register');
              },
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 17,
                ),
              ))
        ],
      ),
    );
  }
}
