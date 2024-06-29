import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/features/home/logic/cubit/discount/offers_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/doctors_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/home_bloc_cubit.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:graduation_project/features/home/widgets/app_bar_search.dart';
import 'package:graduation_project/features/home/widgets/category_item.dart';
import 'package:graduation_project/features/home/widgets/category_shimmer.dart';
import 'package:graduation_project/features/home/widgets/chat_icon.dart';
import 'package:graduation_project/features/home/widgets/discount_item.dart';
import 'package:graduation_project/features/home/widgets/discount_shimmer.dart';
import 'package:graduation_project/features/home/widgets/doctor_item.dart';
import 'package:graduation_project/features/home/widgets/main_product_item.dart';
import 'package:graduation_project/features/home/widgets/new_arrival.dart';
import 'package:graduation_project/features/home/widgets/section_title.dart';
import '../logic/cubit/product/cubit/product_cubit.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({super.key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> with RestorationMixin {
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
                          restorationId: 'homePage',
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2.5 / 3,
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
                          height: 233.h,
                          child: ListView.builder(
                            restorationId: 'homePage',
                            itemCount: context
                                    .read<AllProductCubit>()
                                    .productDetails!
                                    .length -
                                1,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () =>
                                  Navigator.of(context).push(MaterialPageRoute(
                                settings: RouteSettings(
                                    arguments: context
                                        .read<AllProductCubit>()
                                        .productDetails),
                                builder: (context) =>
                                    ProductDetailsView(wantedindex: index),
                              )),
                              child: NewArrivalItem(
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
                                          .productDetails?[index]
                                          .images?[1]['image'] ??
                                      context
                                          .read<AllProductCubit>()
                                          .productDetails?[index]
                                          .images?[0]['image'] ??
                                      ''),
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
                          restorationId: 'homePage',
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
                            restorationId: 'homePage',
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
                                    ''),
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
              BlocBuilder<DoctorsCubit, DoctorsState>(
                builder: (context, state) {
                  if (state is FetchingDoctorDataSuccessState) {
                    return Padding(
                      padding: EdgeInsets.only(left: 6.w),
                      child: SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                          itemCount:
                              context.read<DoctorsCubit>().doctorsData!.length,
                          itemBuilder: (context, index) => DoctorItem(
                            image: context
                                .read<DoctorsCubit>()
                                .doctorsData![index]
                                .doctorImage,
                            location: context
                                .read<DoctorsCubit>()
                                .doctorsData![index]
                                .location,
                            price: context
                                .read<DoctorsCubit>()
                                .doctorsData![index]
                                .price
                                .toString(),
                            specialization: context
                                .read<DoctorsCubit>()
                                .doctorsData![index]
                                .specialization,
                            name:
                                "${context.read<DoctorsCubit>().doctorsData![index].firstName} ${context.read<DoctorsCubit>().doctorsData![index].lastName}",
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    );
                  }
                  return ShimmerDiscount();
                },
              ),
              const VerticalSpacer(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String? get restorationId => 'homePage';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {}
}
