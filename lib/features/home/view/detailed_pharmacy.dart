import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/home/models/pharmacy_model.dart';

class DetailedPharmacy extends StatelessWidget {
  const DetailedPharmacy({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    final pha =
        ModalRoute.of(context)?.settings.arguments as List<PharmacyModel>;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Pharmacy Details',
          style: getMediumStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 24),
              Container(
                height: 200.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                          pha[index].pharmacyImagePath!,
                        ),
                        fit: BoxFit.cover)),
              ),
              const VerticalSpacer(height: 26),
              Row(
                children: [
                  const Icon(
                    Icons.local_pharmacy_rounded,
                    color: ConstantColors.appMainColor,
                  ),
                  const HorizontalSpacer(width: 6),
                  Text(
                    "pharmacy Name :",
                    style: getMediumStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const HorizontalSpacer(width: 12),
                  Text(
                    pha[index].pharmacyName,
                    style: getMediumStyle(
                        fontSize: 14, color: ConstantColors.appMainColor),
                  ),
                ],
              ),
              Divider(
                height: 48.h,
                color: ConstantColors.appMainColor,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_pin,
                    color: ConstantColors.appMainColor,
                  ),
                  const HorizontalSpacer(width: 6),
                  Text(
                    "pharmacy Location :",
                    style: getMediumStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const HorizontalSpacer(width: 12),
                  Flexible(
                    child: Text(
                      pha[index].pharmacyLocation,
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.start,
                      style: getMediumStyle(
                          fontSize: 14, color: ConstantColors.appMainColor),
                    ),
                  ),
                ],
              ),
              Divider(
                height: 48.h,
                color: ConstantColors.appMainColor,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone_android_outlined,
                    color: ConstantColors.appMainColor,
                  ),
                  const HorizontalSpacer(width: 6),
                  Text(
                    "pharmacy Phone Number :",
                    style: getMediumStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const HorizontalSpacer(width: 12),
                  Text(
                    pha[index].pharmacyPhoneNum!,
                    style: getMediumStyle(
                        fontSize: 14, color: ConstantColors.appMainColor),
                  ),
                ],
              ),
              Divider(
                height: 48.h,
                color: ConstantColors.appMainColor,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.watch,
                    color: ConstantColors.appMainColor,
                  ),
                  const HorizontalSpacer(width: 6),
                  Text(
                    "Openining Time :",
                    style: getMediumStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const HorizontalSpacer(width: 12),
                  Text(
                    pha[index].openTime,
                    style: getMediumStyle(
                        fontSize: 14, color: ConstantColors.appMainColor),
                  ),
                ],
              ),
              Divider(
                height: 48.h,
                color: ConstantColors.appMainColor,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.close,
                    color: ConstantColors.appMainColor,
                  ),
                  const HorizontalSpacer(width: 6),
                  Text(
                    "Closing Time :",
                    style: getMediumStyle(fontSize: 14, color: Colors.black87),
                  ),
                  const HorizontalSpacer(width: 12),
                  Text(
                    pha[index].closeTime,
                    style: getMediumStyle(
                        fontSize: 14, color: ConstantColors.appMainColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
