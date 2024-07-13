import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/colors.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/cart/cubit/cart_cubit.dart';
import 'package:graduation_project/features/home/widgets/new_arrival.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/product_model.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.wantedindex});
  final int wantedindex;
  static final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final res =
        ModalRoute.of(context)?.settings.arguments as List<ProductDetailsModel>;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const VerticalSpacer(height: 32),
                  const CustomAppBar(title: 'Product Details'),
                  const VerticalSpacer(height: 24),
                  SizedBox(
                    height: 250.h,
                    child: PageView.builder(
                      itemCount: res[wantedindex].images?.length ?? 3,
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: 250.w,
                        height: 250.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 12.w),
                        margin: EdgeInsets.symmetric(horizontal: 12.w),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.teal.withOpacity(0.75),
                              width: 0.5.h),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Image.network(
                          res[wantedindex].images?[index]['image'] ?? '',
                          fit: BoxFit.fill,
                          width: 180.w,
                          height: 180.h,
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 16),
                  Align(
                    alignment: Alignment.center,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: res[wantedindex].images?.length ?? 3,
                      effect: ExpandingDotsEffect(
                        expansionFactor: 1.8,
                        activeDotColor: ConstantColors.appMainColor,
                        dotColor: ConstantColors.appMainColor.withOpacity(0.3),
                        dotWidth: 12.w,
                        dotHeight: 6.h,
                        spacing: 4,
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 24),
                  ProductSpecificationsItem(
                      firstText: 'Product Name :  ',
                      secondText: res[wantedindex].name,
                      secondTextSize: 14),
                  const VerticalSpacer(height: 10),
                  ProductSpecificationsItem(
                      firstText: 'Price : ',
                      secondTextColor: Colors.red,
                      secondText: " ${res[wantedindex].price}  EGP"),
                  const VerticalSpacer(height: 10),
                  ProductSpecificationsItem(
                      firstText: 'Quantity :  ',
                      secondText: res[wantedindex].quantity.toString()),
                  const VerticalSpacer(height: 10),
                  ProductSpecificationsItem(
                      firstText: 'Rating : ',
                      secondTextColor: Colors.red,
                      secondText: "  ${res[wantedindex].rating} / 5"),
                  const VerticalSpacer(height: 10),
                  ProductSpecificationsItem(
                      firstText: 'Company Name :  ',
                      secondText: res[wantedindex].company),
                  const VerticalSpacer(height: 20),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    margin: EdgeInsetsDirectional.symmetric(horizontal: 18.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Colors.teal)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About Product : ',
                          style:
                              getMediumStyle(fontSize: 14, color: Colors.teal),
                        ),
                        const VerticalSpacer(height: 6),
                        Text(
                          '${res[wantedindex].discription} ',
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          style:
                              getMediumStyle(fontSize: 12, color: Colors.black),
                        ),
                        const VerticalSpacer(height: 8),
                      ],
                    ),
                  ),
                  const VerticalSpacer(height: 22),
                  Padding(
                    padding: EdgeInsets.only(left: 18.w),
                    child: Text(
                      'Products you may like :',
                      style: getMediumStyle(fontSize: 14, color: Colors.teal),
                    ),
                  ),
                  const VerticalSpacer(height: 12),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: SizedBox(
                      height: 233.h,
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) => NewArrivalItem(
                          quantity: res[index + 2].quantity.toString(),
                          name: res[index + 2].name,
                          price: res[index + 2].price.toString(),
                          image: res[index + 2].images?[0]['image'] ?? '',
                        ),
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  const VerticalSpacer(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 4.h,
            child: Material(
              elevation: 10,
              child: Container(
                height: 60.h,
                width: 370.w,
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocConsumer<CartCubit, CartState>(
                        listenWhen: (previous, current) =>
                            current is PostingDataToServerSuccess ||
                            current is PostingDataToServerError,
                        listener: (context, state) {
                          if (state is PostingDataToServerError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                showCloseIcon: true,
                                duration: Duration(seconds: 4),
                                padding: EdgeInsets.only(left: 32.w),
                                margin: EdgeInsets.only(
                                    bottom: 12.h, right: 8.w, left: 8.w),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r)),
                                content: Text(
                                  state.error,
                                  style: getMediumStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            );
                          }
                          if (state is PostingDataToServerSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.teal,
                                behavior: SnackBarBehavior.floating,
                                showCloseIcon: true,
                                duration: Duration(seconds: 4),
                                padding: EdgeInsets.only(left: 32.w),
                                margin: EdgeInsets.only(
                                    bottom: 32.h, right: 8.w, left: 8.w),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.r)),
                                content: Text(
                                  'Item Added To Your Cart Successfully',
                                  style: getMediumStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                              ),
                            );
                          }
                        },
                        buildWhen: (previous, current) =>
                            current is PostingDataToServer ||
                            current is PostingDataToServerError ||
                            current is PostingDataToServerSuccess,
                        builder: (context, state) {
                          if (state is PostingDataToServer) {
                            return Container(
                              width: 180.w,
                              height: 40.h,
                              decoration:
                                  const BoxDecoration(color: Colors.teal),
                              child: Center(
                                child: Transform.scale(
                                  scale: 0.75,
                                  child:
                                      const CircularProgressIndicator.adaptive(
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              context.read<CartCubit>().postCartData(
                                    productId: res[wantedindex].id,
                                    cartId: SharedPreferencesManager.getString(
                                        LocalStorageConstants.cartId)!,
                                    quantity: 1,
                                  );
                            },
                            child: Container(
                              width: 200.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                border: Border.all(color: Colors.teal),
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add To Cart',
                                    style: getMediumStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  const HorizontalSpacer(width: 18),
                                  Icon(
                                    Icons.shopping_cart_checkout_rounded,
                                    color: Colors.white,
                                    size: 18.w,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 36.w,
                      height: 40.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.home,
                          color: Colors.teal,
                          size: 24.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.padding,
    this.leading,
  });
  final String title;
  final double? padding;
  final Widget? leading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: leading ??
                SvgHandler(
                  imagePath: 'assets/svgs/arrow-left.svg',
                  height: 20,
                  width: 24,
                  fit: BoxFit.fill,
                ),
          ),
          Text(
            title,
            style: getMediumStyle(fontSize: 17, color: Colors.black),
          ),
          const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class ProductSpecificationsItem extends StatelessWidget {
  const ProductSpecificationsItem(
      {super.key,
      required this.firstText,
      required this.secondText,
      this.firstTextColor,
      this.secondTextColor,
      this.secondTextSize,
      this.padding});

  final String firstText;
  final String secondText;
  final Color? firstTextColor;
  final Color? secondTextColor;
  final double? secondTextSize;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 18.w),
      child: Row(
        children: [
          CircleAvatar(
            radius: 4.2.w,
            backgroundColor: Colors.grey.withOpacity(0.75),
          ),
          const HorizontalSpacer(width: 8),
          Text(
            firstText,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(
                fontSize: 14, color: firstTextColor ?? Colors.teal),
          ),
          SizedBox(
            width: 200.w,
            child: Text(
              secondText,
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                  fontSize: secondTextSize ?? 15,
                  color: secondTextColor ?? Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
