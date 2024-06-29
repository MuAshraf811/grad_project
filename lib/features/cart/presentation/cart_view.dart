import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/constants/shared_pref_constants.dart';
import 'package:graduation_project/core/localStorage/shared_preferences_storage.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/cart/cubit/cart_cubit.dart';
import 'package:graduation_project/features/checkout/view/screens/checkout_main_view.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:shimmer/shimmer.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 36),
              CustomAppBar(
                title: 'Cart View',
                leading: const SizedBox.shrink(),
              ),
              const VerticalSpacer(height: 28),
              Container(
                width: double.infinity,
                height: 100.h,
                margin: EdgeInsets.only(bottom: 16.h),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Total Price : ',
                          style:
                              getMediumStyle(fontSize: 14, color: Colors.black),
                        ),
                        const HorizontalSpacer(width: 12),
                        Text(
                          '${SharedPreferencesManager.getString(LocalStorageConstants.cartTotalPrice)}',
                          style: getBoldStyle(
                            fontSize: 17,
                            fontFamily: FontConstants.poppinsFontFamily,
                            color: Colors.red,
                          ).copyWith(letterSpacing: 1.w),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheckOutFirstView(
                            totalAmount: context.read<CartCubit>().totalAmount,
                            delivery: 80,
                          ),
                        ));
                      },
                      child: Container(
                        width: 300.w,
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
                              'Checkout',
                              style: getMediumStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                            const HorizontalSpacer(width: 4),
                            Icon(
                              Icons.payment_outlined,
                              color: Colors.white,
                              size: 14.w,
                            ),
                            const HorizontalSpacer(width: 8),
                            Text(
                              '${SharedPreferencesManager.getString(LocalStorageConstants.cartTotalPrice)} EGP',
                              style: getMediumStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 16.h,
                color: Colors.black,
                thickness: 0.5.h,
              ),
              const VerticalSpacer(height: 12),
              BlocConsumer<CartCubit, CartState>(
                listenWhen: (previous, current) => current is DeletingOrder,
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.teal.withOpacity(0.5),
                      margin: EdgeInsets.only(
                          bottom: 24.h, right: 12.w, left: 12.w),
                      duration: Duration(seconds: 4),
                      showCloseIcon: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r)),
                      content: Row(
                        children: [
                          Text(
                            'Working on it',
                            style: getMediumStyle(
                                fontSize: 15, color: Colors.white),
                          ),
                          const HorizontalSpacer(width: 8),
                          Transform.scale(
                            scale: 0.4,
                            child: CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                buildWhen: (previous, current) =>
                    current is FetchingCartItems ||
                    current is FetchingCartItemsError ||
                    current is FetchingCartItemsSuccess ||
                    current is FetchingCartItemsError,
                builder: (context, state) {
                  if (state is DeletingOrderError) {
                    return Text(state.error);
                  }
                  if (state is FetchingCartItems) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CartShimmer(),
                        const VerticalSpacer(height: 12),
                        CartShimmer(),
                        const VerticalSpacer(height: 12),
                        CartShimmer(),
                      ],
                    );
                  }
                  if (state is FetchingCartItemsSuccess) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: context
                            .read<CartCubit>()
                            .cartListFromDataBase
                            .length,
                        itemBuilder: (context, index) => CartItem(
                            amount: context
                                .read<CartCubit>()
                                .cartListFromDataBase[index]
                                .quantity
                                .toString(),
                            image: context
                                .read<CartCubit>()
                                .cartListFromDataBase[index]
                                .image,
                            name: context
                                .read<CartCubit>()
                                .cartListFromDataBase[index]
                                .productName,
                            price: '33',
                            onTap: index),
                      ),
                    );
                  }
                  if (state is FetchingCartItemsError) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: getMediumStyle(fontSize: 14, color: Colors.red),
                      ),
                    );
                  }
                  return Text('None');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CartShimmer extends StatelessWidget {
  const CartShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.3),
      highlightColor: Colors.white70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: Colors.grey.withOpacity(0.5)),
          ),
          const HorizontalSpacer(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 8.h,
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.5)),
              ),
              const VerticalSpacer(height: 8),
              Container(
                height: 8.h,
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.5)),
              ),
              const VerticalSpacer(height: 8),
              Container(
                height: 8.h,
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.5)),
              ),
              const VerticalSpacer(height: 8),
              Container(
                height: 8.h,
                width: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.grey.withOpacity(0.5)),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.amount,
    required this.image,
    required this.name,
    required this.price,
    required this.onTap,
  });
  final String name;
  final String price;
  final String amount;
  final String image;
  final int onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 306.w,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.teal),
          borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 100.h,
            width: 80.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              //  border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          const HorizontalSpacer(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name :  ',
                    style: getMediumStyle(fontSize: 14, color: Colors.teal),
                  ),
                  SizedBox(
                    width: 160.w,
                    child: Text(
                      name,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: getMediumStyle(fontSize: 14, color: Colors.black),
                    ),
                  )
                ],
              ),
              const VerticalSpacer(height: 12),
              Row(
                children: [
                  Text(
                    'Price : ',
                    style: getMediumStyle(fontSize: 14, color: Colors.teal),
                  ),
                  Text(
                    price,
                    style: getMediumStyle(fontSize: 14, color: Colors.red),
                  )
                ],
              ),
              const VerticalSpacer(height: 12),
              Row(
                children: [
                  Text(
                    'Quantity : ',
                    style: getMediumStyle(fontSize: 14, color: Colors.teal),
                  ),
                  Text(
                    amount,
                    style: getMediumStyle(fontSize: 14, color: Colors.red),
                  )
                ],
              ),
              const VerticalSpacer(height: 12),
              Transform.translate(
                offset: Offset(200.w, 0),
                child: InkWell(
                  onTap: () async {
                    context.read<CartCubit>().deleteOrder(context
                        .read<CartCubit>()
                        .cartListFromDataBase[onTap]
                        .itemId);
                  },
                  child: SvgHandler(
                      imagePath: 'assets/svgs/trash.svg',
                      height: 20,
                      width: 20,
                      color: Colors.red,
                      fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
