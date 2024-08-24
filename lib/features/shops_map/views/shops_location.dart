import 'package:aislecheck/core/common/widgets/customer_app_bar.dart';
import 'package:aislecheck/core/common/widgets/devider_widget.dart';
import 'package:aislecheck/core/common/widgets/serach.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopsLocation extends StatelessWidget {
  const ShopsLocation({super.key});
  static const name = '/shopsLocation';
  static CameraPosition initialCameraPosition = const CameraPosition(
      target: LatLng(29.3807, 71.7182),
      //tilt: 59.440717697143555,
      zoom: 14.4746);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: initialCameraPosition,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              zoomControlsEnabled: false,
              trafficEnabled: true,
              tiltGesturesEnabled: false,
            ),
            const Align(
              alignment: Alignment(0, -0.85),
              child: SizedBox(
                height: kToolbarHeight,
                child: CustomerAppBar(
                  backgroundColor: AppColors.transParentColor,
                ),
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.67),
              child: SearchWidget(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: DividerWidget(),
            )
          ],
        ),
      ),
    );
  }
}
