import 'package:aislecheck/core/common/widgets/user_side_btn.dart';
import 'package:aislecheck/core/constants/images_path.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/core/common/widgets/serach.dart';
import 'package:aislecheck/features/user_home/views/widgets/user_home_page_app_bar.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});
  static const String name = '/userHomePage';
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: UserHomePageAppBar(width: width, height: height),
      floatingActionButton: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: FloatingActionButton(
          backgroundColor: AppColors.greenColor,
          child: const Icon(Icons.home),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: AppColors.white54Color,
          activeColor: AppColors.greenColor,
          inactiveColor: AppColors.inActiveBottomColors,
          height: 75,
          icons: const [
            Icons.explore,
            Icons.list,
            Icons.notifications,
            Icons.person
          ],
          activeIndex: 0,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) {}),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            const SearchWidget(),
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const CategoriWidget(
              category: 'All Categories',
            ),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.08,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ), // Adjust the radius here
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Image.asset(
                              CustmoerImages.beautyImg,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Beauty',
                            style: GoogleFonts.roboto(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height * 0.3,
              child: FlutterCarousel.builder(
                itemCount: 3,
                itemBuilder: (context, index, realIndex) {
                  return EnlargeCenterPage(
                    height: height,
                    width: width,
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 20 / 9,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  autoPlay: true,
                  slideIndicator: const CircularSlideIndicator(
                    slideIndicatorOptions: SlideIndicatorOptions(
                        padding: EdgeInsets.all(8),
                        currentIndicatorColor: Colors.green,
                        indicatorBackgroundColor: AppColors.grayColor),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const CategoriWidget(category: 'All Stores / Shopes'),
            SizedBox(
              height: height * 0.01,
            ),
            SizedBox(
              height: height * 0.3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ShopsWidget(width: width, height: height);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EnlargeCenterPage extends StatelessWidget {
  final double height, width;
  const EnlargeCenterPage(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              CustmoerImages.item,
            ),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          alignment: const Alignment(-0.8, -0.8),
          children: [
            Text(
              'Sephora',
              style: GoogleFonts.roboto(
                  color: AppColors.whiteColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.5),
              child: Text(
                'Flat',
                style: GoogleFonts.roboto(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, -0.2),
              child: Text(
                '50 % OFF',
                style: GoogleFonts.roboto(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Align(
              alignment: const Alignment(-0.8, 0.5),
              child: UserSideBtn(
                btnHeight: 0.05,
                btnWidth: 0.25,
                borderRadius: 30,
                onTap: () {},
                btnName: 'visit',
                btnBackgroundColor: AppColors.carsoulBtnColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoriWidget extends StatelessWidget {
  final String category;
  final String subCategory;
  final Color subCategoryColor;
  final FontWeight subCategoryFontweight;
  final TextDecoration? textDecoration;
  const CategoriWidget(
      {super.key,
      required this.category,
      this.subCategory = 'See All',
      this.subCategoryColor = AppColors.black54Color,
      this.textDecoration,
      this.subCategoryFontweight = FontWeight.w500});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style:
                GoogleFonts.roboto(fontSize: 15, fontWeight: FontWeight.w700),
          ),
          Text(
            subCategory,
            style: GoogleFonts.roboto(
                color: subCategoryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                decoration: textDecoration),
          ),
        ],
      ),
    );
  }
}

class ShopsWidget extends StatelessWidget {
  final double width, height;
  const ShopsWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: width * 0.5,
        child: Card(
          color: AppColors.whiteColor,
          child: Column(
            children: [
              Image.asset(
                CustmoerImages.shop,
                width: width * 0.5,
                height: height * 0.2,
                fit: BoxFit.fill,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Sephora',
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500, fontSize: 13),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      const Icon(
                        Icons.star_rate,
                        color: AppColors.ratingStartColor,
                        size: 10,
                      ),
                      SizedBox(
                        width: width * 0.04,
                        child: FittedBox(
                          child: Text(
                            '4.9',
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400, fontSize: 10),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                      Expanded(
                        child: Text(
                          '600m (4mins away)',
                          style: GoogleFonts.roboto(
                              fontSize: 10, fontWeight: FontWeight.w400),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
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
