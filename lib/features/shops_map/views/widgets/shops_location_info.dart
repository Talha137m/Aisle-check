// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:developer';

import 'package:aislecheck/core/extensions/pop_up_messages.dart';
import 'package:aislecheck/features/shopping_list/views/widgets/shopping_lists.dart';
import 'package:aislecheck/features/shops_map/models/info_window.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/shops_map/controllers/shops_location_controller.dart';
import 'package:aislecheck/features/user_home/views/home_page.dart';

class ShopsLocationInfo extends StatelessWidget {
  final InfoWindowClass infoWindowClass;

  const ShopsLocationInfo({super.key, required this.infoWindowClass});
  static const double _totalHeight = 220;
  static const double _totalWidth = 170;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ShopsLocationController>();
    log('loaded:${state.loadedState.toString()},loading:${state.loadingState},initialState:${state.initialState},errorState:${state.errorState.toString()}');
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: _totalWidth,
        height: _totalHeight,
        child: Builder(builder: (context) {
          if (state.loadingState) {
            context.loadingPopUp();
            return const SizedBox.shrink();
          } else if (state.initialState || state.loadedState) {
            return DataWidget(infoWindowClass: infoWindowClass);
          } else {
            return Material(
              child: Center(
                child: Text(state.errorMesage),
              ),
            );
          }
        }),
      ),
    );
  }
}

//....create the class that show the the data
class DataWidget extends StatelessWidget {
  final InfoWindowClass infoWindowClass;
  const DataWidget({super.key, required this.infoWindowClass});
  static const double _totalWidth = 170;
  static const double _oneTwentyValue = 120;
  static const double _gap = 15;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              infoWindowClass.imagPath,
              width: _totalWidth,
              height: _oneTwentyValue,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: const Alignment(-0.7, 0.0),
              child: Text(
                infoWindowClass.shopName,
                maxLines: 1,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Align(
              alignment: const Alignment(-0.8, 0.0),
              child: Text(
                infoWindowClass.shopDistance,
                style: GoogleFonts.roboto(
                    fontSize: 12, fontWeight: FontWeight.w400),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CategoriWidget(
              padding: 5,
              category: 'visit',
              subCategory: '➡',
              subCategoryTab: () {
                context.read<ShopsLocationController>().mapInitialization(
                    targetLatude: infoWindowClass.destLatitude,
                    targetLongitude: infoWindowClass.destLongitude);
              },
            ),
            const SizedBox(
              height: _gap,
            ),
          ],
        ),
      ),
    );
  }
}
