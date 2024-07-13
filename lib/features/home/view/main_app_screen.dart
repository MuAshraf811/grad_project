import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/svg_handler.dart';
import 'package:graduation_project/core/styles/app_font_manager.dart';
import 'package:graduation_project/core/styles/text_styles.dart';
import 'package:graduation_project/features/chat/logic/cubit/chat_cubit.dart';
import 'package:graduation_project/features/chat/presenation/views/all_chats_view.dart';
import 'package:graduation_project/features/home/logic/cubit/discount/offers_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/doctors_cubit.dart';
import 'package:graduation_project/features/home/logic/cubit/home_bloc_cubit.dart';
import 'package:graduation_project/features/home/view/category_detailed.dart';
import 'package:graduation_project/features/home/view/filteration_page.dart';
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
import '../../settings/presentaion/location_view.dart';
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Hero(
                        tag: 's',
                        child: CutomAppBarSearch(
                          isOut: false,
                        ),
                      ),
                    ),
                    const HorizontalSpacer(width: 18),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const FilterationPage(),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 28.w,
                        height: 28.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal.withOpacity(0.1),
                            border: Border.all(color: Colors.teal)),
                        child: const SvgHandler(
                            imagePath: 'assets/svgs/filter.svg',
                            color: Colors.teal,
                            height: 20,
                            width: 20,
                            fit: BoxFit.fill),
                      ),
                    ),
                    const HorizontalSpacer(width: 16),
                    ClickableChatIcon(
                      onTap: () {
                        context.read<ChatCubit>().fetchingAllChats();
                        Navigator.of(context).push(MaterialPageRoute(
                          settings: RouteSettings(
                              arguments:
                                  context.read<DoctorsCubit>().doctorsData),
                          builder: (context) => const MainChatsView(),
                        ));
                      },
                    ),
                  ],
                ),
              ),
              const VerticalSpacer(height: 16),
              const SectionTitle(title: 'Categories'),
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
                          itemBuilder: (context, index) => InkWell(
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                              settings: RouteSettings(
                                  arguments: context
                                      .read<AllProductCubit>()
                                      .productDetails),
                              builder: (context) =>
                                  const DetailedCategoryView(),
                            )),
                            child: CategoryItem(
                                title: context
                                    .read<HomeBlocCubit>()
                                    .categoryData[index]
                                    .categoryName!,
                                image: context
                                    .read<HomeBlocCubit>()
                                    .categoryData[index]
                                    .imagePath!),
                          ),
                        ),
                      );
                    }
                    return const CategoryShimmer();
                  },
                ),
              ),
              const VerticalSpacer(height: 14),
              const SectionTitle(title: 'New Arrivals'),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: BlocBuilder<AllProductCubit, ProductState>(
                  buildWhen: (previous, current) =>
                      current is FetchingProductDetailsSuccess ||
                      current is FetchingProductDetailsError ||
                      current is FetchingProductDetails,
                  builder: (context, state) {
                    if (state is FetchingProductDetailsSuccess) {
                      return SizedBox(
                          height: 240.h,
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
                    return const ShimmerDiscount();
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
                        height: 110.h,
                        child: ListView.builder(
                          restorationId: 'homePage',
                          itemCount: context
                              .read<OffersCubit>()
                              .productDiscount!
                              .length,
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
                            child: DiscountItem(
                              afterPrice: context
                                  .read<OffersCubit>()
                                  .productDiscount![index]
                                  .afterPrice
                                  .toString(),
                              beforePrice: context
                                  .read<OffersCubit>()
                                  .productDiscount![index]
                                  .beforePrice
                                  .toString(),
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
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    }

                    return const ShimmerDiscount();
                  },
                ),
              ),
              const VerticalSpacer(height: 14),
              const SectionTitle(title: 'Common'),
              const VerticalSpacer(height: 12),
              Padding(
                padding: EdgeInsets.only(left: 4.w),
                child: BlocBuilder<AllProductCubit, ProductState>(
                  buildWhen: (previous, current) =>
                      current is FetchingProductDetailsSuccess ||
                      current is FetchingProductDetailsError ||
                      current is FetchingProductDetails,
                  builder: (context, state) {
                    if (state is FetchingProductDetailsSuccess) {
                      return SizedBox(
                          height: 105.h,
                          child: ListView.builder(
                            restorationId: 'homePage',
                            itemCount: 15,
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
                              child: DummyProduct(
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
                            ),
                            scrollDirection: Axis.horizontal,
                          ));
                    }
                    return const ShimmerDiscount();
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
                        height: 216.h,
                        child: ListView.builder(
                          itemCount:
                              context.read<DoctorsCubit>().doctorsData!.length,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const LocationView(),
                              ));
                            },
                            child: DoctorItem(
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
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    );
                  }
                  return const ShimmerDiscount();
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

class CustomSearch extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    ThemeData(
        appBarTheme: const AppBarTheme(
      shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      centerTitle: true,
    ));
    return super.appBarTheme(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Padding(
          padding: EdgeInsets.only(right: 24.w),
          child: const Icon(
            Icons.clear,
            color: Colors.red,
          ),
        ),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Padding(
        padding: EdgeInsets.only(left: 6.w),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.teal,
        ),
      ),
      onPressed: () => Navigator.of(context).pop(),
      // Exit from the search screen.
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    context.read<AllProductCubit>().filterSearch(wantedProduct: query);
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
          color: Colors.teal, indent: 12.w, endIndent: 12.w, height: 32.h),
      itemCount: context.read<AllProductCubit>().searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 20.w,
            backgroundImage: NetworkImage(context
                    .read<AllProductCubit>()
                    .searchResults[index]
                    .images?[0]['image'] ??
                ' '),
          ),
          subtitle: Text(
            context.read<AllProductCubit>().searchResults[index].discription,
            style: getRegularStyle(fontSize: 14, color: Colors.black45),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          title: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            context.read<AllProductCubit>().searchResults[index].name ?? '',
            style: getRegularStyle(fontSize: 14, color: Colors.black),
          ),
          onTap: () {
            // Handle the selected search result.
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    context.read<AllProductCubit>().filterSearch(wantedProduct: query);
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
          color: Colors.teal, indent: 12.w, endIndent: 12.w, height: 32.h),
      itemCount: context.read<AllProductCubit>().searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 20.w,
            backgroundImage: NetworkImage(context
                    .read<AllProductCubit>()
                    .searchResults[index]
                    .images?[0]['image'] ??
                ' '),
          ),
          subtitle: Text(
            context.read<AllProductCubit>().searchResults[index].discription,
            style: getRegularStyle(fontSize: 14, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          title: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            context.read<AllProductCubit>().searchResults[index].name,
            style: getBoldStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: FontConstants.poppinsFontFamily),
          ),
          onTap: () {
            // Handle the selected search result.
          },
        );
      },
    );
  }
}
