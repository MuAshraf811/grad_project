import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';

class NewArrivalItem extends StatelessWidget {
  const NewArrivalItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });
  final String price;
  final String name;
  final String image;
  final String quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ConstantColors.appMainColor),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 90.h,
            width: 125.w,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      image,
                    ),
                    fit: BoxFit.contain),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r))),
          ),
          const VerticalSpacer(height: 8),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            name,
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
          const VerticalSpacer(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Price : ',
                style: getRegularStyle(fontSize: 14, color: Colors.black),
              ),
              Text(
                '$price EGP',
                style: getMediumStyle(fontSize: 14, color: Colors.red),
              ),
            ],
          ),
          const VerticalSpacer(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                'Quantity :  ',
                style: getMediumStyle(fontSize: 12, color: Colors.black),
              ),
              Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                quantity,
                style: getMediumStyle(fontSize: 14, color: Colors.teal),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            height: 18.h,
            endIndent: 12.w,
            indent: 12.w,
            thickness: 0.7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 10.w,
                backgroundColor: Colors.red.withOpacity(0.45),
                child: SvgHandler(
                    imagePath: 'assets/svgs/heart.svg',
                    height: 16,
                    width: 16,
                    fit: BoxFit.cover),
              ),
              const HorizontalSpacer(width: 24),
              CircleAvatar(
                radius: 10.w,
                backgroundColor: Colors.teal.withOpacity(0.5),
                child: Icon(
                  Icons.add_shopping_cart_outlined,
                  size: 12.w,
                ),
              ),
            ],
          ),
          const VerticalSpacer(height: 6),
        ],
      ),
    );
  }
}
