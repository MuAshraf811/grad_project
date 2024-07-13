import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/home/logic/cubit/pharmacy/pharmacy_data_cubit.dart';
import 'package:graduation_project/features/home/view/detailed_pharmacy.dart';
import 'package:graduation_project/features/home/widgets/app_bar_search.dart';
import 'package:graduation_project/features/home/widgets/chat_icon.dart';
import 'package:graduation_project/features/settings/presentaion/location_view.dart';
import 'package:shimmer/shimmer.dart';

class PharmacyMainView extends StatelessWidget {
  const PharmacyMainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: CutomAppBarSearch(
                      isOut: true,
                    ),
                  ),
                  const HorizontalSpacer(width: 22),
                  ClickableChatIcon(
                    onTap: () {},
                  ),
                ],
              ),
              const VerticalSpacer(height: 28),
              BlocBuilder<PharmacyDataCubit, PharmacyDataState>(
                buildWhen: (previous, current) =>
                    current is FetchingPharmacyDetails ||
                    current is FetchingPharmacyDetailsSuccess ||
                    current is FetchingPharmacyDetailsError,
                builder: (context, state) {
                  if (state is FetchingPharmacyDetailsSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: context
                            .read<PharmacyDataCubit>()
                            .pharmacyData
                            ?.length,
                        itemBuilder: (context, index) => PharmacyItem(
                          onTapImage: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              settings: RouteSettings(
                                  arguments: context
                                      .read<PharmacyDataCubit>()
                                      .pharmacyData),
                              builder: (context) =>
                                  DetailedPharmacy(index: index),
                            ));
                          },
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LocationView(),
                            ));
                          },
                          pharmacyName: context
                              .read<PharmacyDataCubit>()
                              .pharmacyData![index]
                              .pharmacyName,
                          pharmacyImage: context
                                  .read<PharmacyDataCubit>()
                                  .pharmacyData![index]
                                  .pharmacyImagePath ??
                              '',
                          pharmacyLOcation: context
                              .read<PharmacyDataCubit>()
                              .pharmacyData![index]
                              .pharmacyLocation,
                          pharmacyPhone: context
                              .read<PharmacyDataCubit>()
                              .pharmacyData![index]
                              .phone!,
                        ),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemBuilder: (context, index) => const ShimmerPharmacy(),
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

class ShimmerPharmacy extends StatelessWidget {
  const ShimmerPharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              color: Colors.grey,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    height: 16.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    height: 16.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    width: double.infinity,
                    height: 16.0,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PharmacyItem extends StatelessWidget {
  const PharmacyItem({
    super.key,
    required this.pharmacyName,
    required this.pharmacyImage,
    required this.pharmacyLOcation,
    required this.pharmacyPhone,
    required this.onTap,
    required this.onTapImage,
  });
  final String pharmacyName;
  final String pharmacyImage;
  final String pharmacyPhone;
  final VoidCallback onTap;
  final VoidCallback onTapImage;

  final String pharmacyLOcation;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.grey.withOpacity(0.15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTapImage,
            child: Container(
              width: 70.w,
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(pharmacyImage), fit: BoxFit.cover),
              ),
            ),
          ),
          const HorizontalSpacer(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pharmacyName,
                style: getRegularStyle(fontSize: 16, color: Colors.black87),
              ),
              const VerticalSpacer(height: 8),
              Container(
                width: 250.w,
                child: Text(
                  pharmacyLOcation,
                  overflow: TextOverflow.ellipsis,
                  style: getRegularStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              const VerticalSpacer(height: 8),
              Row(
                children: [
                  Icon(Icons.phone_android_outlined, size: 17.h),
                  const HorizontalSpacer(width: 4),
                  Text(
                    pharmacyPhone,
                    style: getRegularStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
              const VerticalSpacer(height: 6),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 17.h, color: Colors.red),
                  const HorizontalSpacer(width: 6),
                  InkWell(
                    onTap: onTap,
                    child: Text(
                      "Find in Google Maps",
                      style: getRegularStyle(fontSize: 13, color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
