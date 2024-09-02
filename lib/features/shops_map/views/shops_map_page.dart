import 'dart:developer';

import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/features/shops_geo_location/models/info_window.dart';
import 'package:aislecheck/features/shops_map/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class ShopsMapPage extends StatelessWidget {
  const ShopsMapPage({super.key});
  static const name = '/shopsMapPage';
  @override
  Widget build(BuildContext context) {
    InfoWindowClass infoWindowClass =
        ModalRoute.of(context)!.settings.arguments as InfoWindowClass;
    var mapSate = context.watch<MapController>();
    log('loading:${mapSate.loadingState}, loaded:${mapSate.loadedState},error:${mapSate.errorSate}');
    return Scaffold(
      body: Builder(
        builder: (context) {
          if (mapSate.loadingState) {
            return LoadingWidget(
              event: () {
                context
                    .read<MapController>()
                    .addPolyLinePoints(infoWindowClass: infoWindowClass);
              },
            );
          } else if (mapSate.loadedState) {
            return LoadedWidget(
              googleMap: mapSate.googleMap,
            );
          } else {
            return UserMessage(message: mapSate.errorMesage);
          }
        },
      ),
    );
  }
}

class LoadedWidget extends StatelessWidget {
  final GoogleMap? googleMap;
  const LoadedWidget({super.key, this.googleMap});

  @override
  Widget build(BuildContext context) {
    return googleMap ?? const SizedBox.shrink();
  }
}
