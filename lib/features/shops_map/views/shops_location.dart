
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/global_serach_item.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/shops_map/controllers/shops_location_controller.dart';
import 'package:aislecheck/features/shops_map/views/widgets/shops_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ShopsLocation extends StatelessWidget {
  const ShopsLocation({super.key});
  static const name = '/shopsLocation';

  @override
  Widget build(BuildContext context) {
    var state = context.watch<ShopsLocationController>();
    //log('loading:${state.loadingState}, loaded:${state.loadedState},initial:${state.initialState}');
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (state.initialState) {
            return LoadingWidget(
              event: () {
                context.read<ShopsLocationController>().mapInitialization();
              },
            );
          } else if (state.loadedState) {
            state.context = context;
            return DataWidget(
              googleMap: state.googleMap,
            );
          } else if (state.loadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return UserMessage(
              message: state.errorMesage,
            );
          }
        },
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({super.key, this.googleMap});
  final GoogleMap? googleMap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        googleMap ?? const SizedBox.shrink(),
         Align(
          alignment: const Alignment(0, -0.9),
          child: SizedBox(
            height: 71,
            child: GlobalAppBar(
              titleText: 'Ads',
              color: AppColors.transParentColor,
            ),
          ),
        ),
        Align(
          alignment: const Alignment(0, -0.65),
          child: GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: ShopSearchDelegate(),
              );
            },
            child: const GlobalSearchItem(),
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: DividerWidget(),
        )
      ],
    );
  }
}
