import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/custom_text_field.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/checkout/logic/payment_cubit.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:graduation_project/features/login/widgets/custom_button.dart';

class CheckOutFirstView extends StatelessWidget {
  const CheckOutFirstView(
      {super.key, required this.totalAmount, required this.delivery});
  final String totalAmount;
  final num delivery;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VerticalSpacer(height: 32),
            CustomAppBar(title: 'Checkout Page', padding: 4.w),
            const VerticalSpacer(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(border: Border.all(color: Colors.teal)),
              child: Text(
                'Order Summary',
                style: getMediumStyle(fontSize: 14, color: Colors.black),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(vertical: 18.h),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Total Price',
                        style:
                            getMediumStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        totalAmount.toString(),
                        style: getMediumStyle(fontSize: 14, color: Colors.teal),
                      ),
                    ],
                  ),
                  Divider(
                    height: 32.h,
                    color: Colors.grey,
                    thickness: 0.4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery ',
                        style:
                            getMediumStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        delivery.toString(),
                        style: getMediumStyle(fontSize: 14, color: Colors.teal),
                      ),
                    ],
                  ),
                  Divider(
                    height: 32.h,
                    color: Colors.teal.withOpacity(0.4),
                    thickness: 0.4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price ',
                        style:
                            getMediumStyle(fontSize: 14, color: Colors.black),
                      ),
                      Text(
                        (delivery + num.parse(totalAmount)).toString(),
                        style: getMediumStyle(fontSize: 15, color: Colors.teal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                border: Border.all(color: Colors.teal),
              ),
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
              child: Form(
                key: context.read<PaymentCubit>().payKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Complete Your Shipping Information',
                      style: getMediumStyle(fontSize: 12, color: Colors.red),
                    ),
                    const VerticalSpacer(height: 16),
                    CustomTextFormField(
                      label: 'address In details',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'This Field must have value';
                        }
                        return null;
                      },
                      textEditingController:
                          context.read<PaymentCubit>().addressController,
                      keyboardType: TextInputType.emailAddress,
                      labelStyle:
                          getRegularStyle(fontSize: 12, color: Colors.grey),
                      suffixIcon: const Icon(Icons.location_on_outlined,
                          color: Colors.teal),
                      fillColor: Colors.grey.withOpacity(0.06),
                      borderRaduis: 4.r,
                    ),
                    const VerticalSpacer(height: 10),
                    CustomTextFormField(
                      label: 'Mobile Number',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'This Field must have value';
                        }
                        if (val.length != 11) {
                          return 'Mobile Number should be 11 digits ';
                        }
                        return null;
                      },
                      textEditingController:
                          context.read<PaymentCubit>().phoneNumberController,
                      keyboardType: TextInputType.phone,
                      labelStyle:
                          getRegularStyle(fontSize: 12, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.06),
                      suffixIcon: const Icon(
                        Icons.phone_android_outlined,
                        color: Colors.teal,
                      ),
                      borderRaduis: 4.r,
                    ),
                    const VerticalSpacer(height: 10),
                    CustomTextFormField(
                      label: 'Full Name',
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'This Field must have value';
                        }
                        return null;
                      },
                      textEditingController:
                          context.read<PaymentCubit>().nameController,
                      keyboardType: TextInputType.phone,
                      labelStyle:
                          getRegularStyle(fontSize: 12, color: Colors.grey),
                      fillColor: Colors.grey.withOpacity(0.06),
                      suffixIcon: const Icon(
                        Icons.person_2_outlined,
                        color: Colors.teal,
                      ),
                      borderRaduis: 4.r,
                    ),
                  ],
                ),
              ),
            ),
            const VerticalSpacer(height: 24),
            Row(
              children: [
                Text(
                  'Have a Coupon ?',
                  style: getMediumStyle(fontSize: 13, color: Colors.teal),
                ),
                const HorizontalSpacer(width: 10),
                Expanded(
                  child: CustomTextFormField(
                    label: 'Coupon Code ',
                    keyboardType: TextInputType.emailAddress,
                    labelStyle:
                        getRegularStyle(fontSize: 12, color: Colors.grey),
                    fillColor: Colors.grey.withOpacity(0.06),
                    suffixIcon: const Icon(
                      Icons.discount_outlined,
                      color: Colors.teal,
                    ),
                    borderRaduis: 4.r,
                  ),
                ),
              ],
            ),
            const VerticalSpacer(height: 36),
            CustomButton(
              fontSize: 17,
              text: 'Continue ',
              onTap: () {
                if (context
                    .read<PaymentCubit>()
                    .payKey
                    .currentState!
                    .validate()) {
                  context.read<PaymentCubit>().paying();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
