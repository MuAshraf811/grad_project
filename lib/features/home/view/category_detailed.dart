import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_project/core/Commonwidgets%20(1)/spacers.dart';
import 'package:graduation_project/features/home/models/product_model.dart';
import 'package:graduation_project/features/home/view/product_details_view.dart';
import 'package:graduation_project/features/home/widgets/new_arrival.dart';

class DetailedCategoryView extends StatelessWidget {
  const DetailedCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final res =
        ModalRoute.of(context)?.settings.arguments as List<ProductDetailsModel>;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpacer(height: 24),
              const CustomAppBar(title: 'Products'),
              const VerticalSpacer(height: 16),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 6.w,
                      mainAxisSpacing: 6.h,
                      childAspectRatio: 2 / 2.7),
                  itemCount: res.length - 2,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      settings: RouteSettings(arguments: res),
                      builder: (context) =>
                          ProductDetailsView(wantedindex: index + 2),
                    )),
                    child: SizedBox(
                      height: 240.h,
                      child: NewArrivalItem(
                        quantity: res[index + 2].quantity.toString(),
                        name: res[index + 2].name,
                        price: res[index + 2].price.toString(),
                        image: res[index + 2].images?[0]['image'] ?? '',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
