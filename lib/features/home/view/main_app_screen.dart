import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/home/logic/cubit/discount/offers_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/home_bloc_cubit.dart';
import 'package:graduation_project/features/home/widgets/app_bar_search.dart';
import 'package:graduation_project/features/home/widgets/chat_icon.dart';
import 'package:shimmer/shimmer.dart';

import '../logic/cubit/product/cubit/product_cubit.dart';

class MainAppScreen extends StatelessWidget {
  const MainAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpacer(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CutomAppBarSearch(),
                    ),
                    HorizontalSpacer(width: 22),
                    ClickableChatIcon(),
                  ],
                ),
              ),
              const VerticalSpacer(height: 16),
              SectionTitle(title: 'Categories'),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: BlocBuilder<HomeBlocCubit, HomeBlocState>(
                  builder: (context, state) {
                    if (state is CategoryDataFetchedSuccess) {
                      return SizedBox(
                        height: 240.h,
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.8 / 3,
                            crossAxisSpacing: 10.h,
                            mainAxisSpacing: 6.w,
                          ),
                          itemCount:
                              context.read<HomeBlocCubit>().categoryData.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => CategoryItem(
                              title: context
                                  .read<HomeBlocCubit>()
                                  .categoryData[index]
                                  .categoryName!,
                              image: context
                                  .read<HomeBlocCubit>()
                                  .categoryData[index]
                                  .imagePath!),
                        ),
                      );
                    }
                    return CategoryShimmer();
                  },
                ),
              ),
              const VerticalSpacer(height: 14),
              const SectionTitle(title: 'New Arrivals'),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: BlocBuilder<AllProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is FetchingProductDetailsSuccess) {
                      return SizedBox(
                          height: 230.h,
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) => NewArrivalItem(
                              quantity: context
                                  .read<AllProductCubit>()
                                  .productDetails![index]
                                  .quantity
                                  .toString(),
                              name: context
                                  .read<AllProductCubit>()
                                  .productDetails![index]
                                  .name,
                              price: context
                                  .read<AllProductCubit>()
                                  .productDetails![index]
                                  .price
                                  .toString(),
                              image: context
                                      .read<AllProductCubit>()
                                      .productDetails![index]
                                      .images?[1]['image'] ??
                                  context
                                      .read<AllProductCubit>()
                                      .productDetails![index]
                                      .images?[0]['image'] ??
                                  '',
                            ),
                            scrollDirection: Axis.horizontal,
                          ));
                    }
                    return ShimmerDiscount();
                  },
                ),
              ),
              const VerticalSpacer(height: 8),
              const SectionTitle(title: 'Offers'),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: BlocBuilder<OffersCubit, OffersState>(
                  builder: (context, state) {
                    if (state is FetchingProductDescountSuccess) {
                      return SizedBox(
                        height: 99.h,
                        child: ListView.builder(
                          itemCount: context
                              .read<OffersCubit>()
                              .productDiscount!
                              .length,
                          itemBuilder: (context, index) => DiscountItem(
                            image: context
                                .read<OffersCubit>()
                                .productDiscount![index]
                                .image,
                            discount: (((context
                                            .read<OffersCubit>()
                                            .productDiscount![index]
                                            .beforePrice) /
                                        (context
                                            .read<OffersCubit>()
                                            .productDiscount![index]
                                            .afterPrice)) /
                                    (context
                                        .read<OffersCubit>()
                                        .productDiscount![index]
                                        .beforePrice) *
                                    100)
                                .toInt()
                                .toString(),
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    }

                    return ShimmerDiscount();
                  },
                ),
              ),
              const VerticalSpacer(height: 14),
              const SectionTitle(title: 'Common'),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: BlocBuilder<AllProductCubit, ProductState>(
                  builder: (context, state) {
                    if (state is FetchingProductDetailsSuccess) {
                      return SizedBox(
                          height: 105.h,
                          child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (context, index) => DummyProduct(
                              price: context
                                  .read<AllProductCubit>()
                                  .productDetails![index]
                                  .price
                                  .toString(),
                              image: context
                                      .read<AllProductCubit>()
                                      .productDetails![index]
                                      .images?[1]['image'] ??
                                  context
                                      .read<AllProductCubit>()
                                      .productDetails![index]
                                      .images?[0]['image'] ??
                                  '',
                            ),
                            scrollDirection: Axis.horizontal,
                          ));
                    }
                    return ShimmerDiscount();
                  },
                ),
              ),
              const VerticalSpacer(height: 12),
              const SectionTitle(title: 'Doctors'),
              const VerticalSpacer(height: 8),
              Padding(
                padding: EdgeInsets.only(left: 6.w),
                child: SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => DoctorItem(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
              const VerticalSpacer(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class DoctorItem extends StatelessWidget {
  const DoctorItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: ConstantColors.appMainColor),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 34.w,
            backgroundColor: Colors.teal,
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'Dr/Muhammed Ashraf',
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            'Dermatology',
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
          VerticalSpacer(height: 6),
          Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            '12 St , Ahmed Orabi , Maadi',
            style: getRegularStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

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

class DummyProduct extends StatelessWidget {
  const DummyProduct({super.key, required this.image, required this.price});
  final String image;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150.w,
          height: 100.h,
          margin: EdgeInsets.only(left: 6.w, right: 2.w),
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.contain),
              border:
                  Border.all(color: ConstantColors.appMainColor, width: 0.6),
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.grey.withOpacity(0.15)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.h, right: 8.w),
                child: Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Colors.red.withOpacity(0.45),
                    child: SvgHandler(
                        imagePath: 'assets/svgs/heart.svg',
                        height: 16,
                        width: 16,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 10.w,
                    backgroundColor: Colors.teal.withOpacity(0.5),
                    child: Icon(
                      Icons.add_shopping_cart_outlined,
                      size: 12.w,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 0.h,
          left: 6.5.w,
          child: Container(
            width: 40.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.7),
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(10.r))),
            alignment: Alignment.center,
            child: Text(
              "$price \$",
              style: getMediumStyle(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Container(
        height: 30.h,
        width: 84.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: ConstantColors.appMainColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(4.r)),
        child: Text(
          title,
          style: getMediumStyle(
            fontSize: 13,
            color: Colors.white,
          ).copyWith(letterSpacing: 0.7),
        ),
      ),
    );
  }
}

class DiscountItem extends StatelessWidget {
  const DiscountItem({
    super.key,
    required this.image,
    required this.discount,
  });
  final String image;
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 80.h,
      margin: EdgeInsets.only(left: 4.w, right: 4),
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.contain),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.teal),
          color: Colors.grey.withOpacity(0.15)),
      child: Transform.rotate(
        angle: -40 * (3.14 / 180),
        child: Transform.translate(
          offset: Offset(4.w, -16.h),
          child: Container(
            width: 80.w,
            height: 18.h,
            padding: EdgeInsets.only(left: 14.h),
            alignment: Alignment.centerLeft,
            color: Colors.red.withOpacity(0.9),
            child: Text(
              '$discount %',
              style: getMediumStyle(fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.image,
    required this.title,
  });
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.h,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(bottom: 6.h),
      margin: EdgeInsets.only(left: 6.w),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              image,
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: ConstantColors.appMainColor,
          width: 0.5.h,
        ),
      ),
      child: Container(
        height: 20.h,
        width: double.infinity,
        color: Colors.black54,
        alignment: Alignment.center,
        child: Text(
          title,
          style: getRegularStyle(fontSize: 12, color: Colors.white)
              .copyWith(letterSpacing: 0.4.w),
        ),
      ),
    );
  }
}

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
              ],
            ),
            const VerticalSpacer(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
                const HorizontalSpacer(width: 16),
                Container(
                  width: 100.0.w,
                  height: 100.0.h,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerDiscount extends StatelessWidget {
  const ShimmerDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(left: 8.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.0.w,
              height: 80.0.h,
              color: Colors.grey,
            ),
            const HorizontalSpacer(width: 16),
            Container(
              width: 120.0.w,
              height: 80.0.h,
              color: Colors.grey,
            ),
            const HorizontalSpacer(width: 16),
            Container(
              width: 120.0.w,
              height: 80.0.h,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
