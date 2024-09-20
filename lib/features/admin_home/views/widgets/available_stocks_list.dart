import 'package:aislecheck/config/navigation/routes.dart';
import 'package:aislecheck/config/service_locator.dart';
import 'package:aislecheck/core/common/widgets/error_msg_widget.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/core/common/widgets/show_meesage_widget.dart';
import 'package:aislecheck/core/services/inventry_service.dart';
import 'package:aislecheck/features/add_inventory/models/inventry_model.dart';
import 'package:aislecheck/features/admin_home/controllers/fetch_inventry_controller.dart';
import 'package:aislecheck/features/edit_inventory/views/edit_inventory_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/strings/app_colors.dart';

class AdminAvailableStocksList extends StatelessWidget {
  final List<InventryModel> products;
  const AdminAvailableStocksList({
    required this.products,
    super.key,
  });

  //...CONSTANT VALUES
  static const _padding = 0.02;
  @override
  Widget build(BuildContext context) {
    // return FirestoreListView<InventryModel>(
    //   query: locator.get<InventryService>().fetchInventry(),
    //   shrinkWrap: true,
    //   showFetchingIndicator: true,
    //   physics: const NeverScrollableScrollPhysics(),
    //   emptyBuilder: (context) => UserMessage(
    //       message: 'data not found',
    //       refresh: () {
    //         locator.get<InventryService>().fetchInventry();
    //       }),
    //   errorBuilder: (context, error, stackTrace) => ErrorMessageWidget(
    //     title: 'Failed',
    //     message: error.toString(),
    //   ),
    //   loadingBuilder: (context) =>
    //       const Center(child: CircularProgressIndicator()),
    //   itemBuilder: (context, doc) {
    //     InventryModel inventryModel = doc.data();
    //     return Padding(
    //       padding: EdgeInsets.only(
    //         bottom: MediaQuery.sizeOf(context).height * _padding,
    //       ),
    //       child: AdminAvailableStockItem(
    //         editTab: () {
    //           Navigator.of(context).pushNamed(EditInventoryPage.pageName);
    //         },
    //         product: inventryModel,
    //       ),
    //     );
    //   },
    // );

    // return FirestoreQueryBuilder<InventryModel>(
    //   pageSize: 2,
    //   query: locator.get<InventryService>().fetchInventr(),
    //   builder: (context, snapshot, child) {
    //     if (snapshot.isFetching) {
    //       return const CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return const ErrorMessageWidget(
    //           title: 'Failed', message: 'Something went wrong');
    //     } else if (snapshot.docs.isNotEmpty) {
    //       return ListView.builder(
    //         shrinkWrap: true,
    //         physics: const NeverScrollableScrollPhysics(),
    //         itemCount: snapshot.docs.length,
    //         itemBuilder: (context, index) {
    //           if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
    //             snapshot.fetchMore();
    //           }
    //           InventryModel inventryModel = snapshot.docs[index].data();
    //           return Padding(
    //             padding: EdgeInsets.only(
    //               bottom: MediaQuery.sizeOf(context).height * _padding,
    //             ),
    //             child: AdminAvailableStockItem(
    //               editTab: () {
    //                 Navigator.of(context).pushNamed(EditInventoryPage.pageName);
    //               },
    //               product: inventryModel,
    //             ),
    //           );
    //         },
    //       );
    //     } else {
    //       return UserMessage(message: 'message', refresh: () {});
    //     }
    //   },
    // );

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length + 1,
      itemBuilder: (context, index) {
        if (index == products.length) {
          return context.read<FetchInventryController>().hasMoreData
              ? const Center(child: LoadingWidget())
              : const UserMessage(message: 'No more data');
        }
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.sizeOf(context).height * _padding,
          ),
          child: AdminAvailableStockItem(
            editTab: () {
              Navigator.of(context).pushNamed(EditInventoryPage.pageName);
            },
            product: products[index],
          ),
        );
      },
    );
  }
}

class AdminAvailableStockItem extends StatelessWidget {
  const AdminAvailableStockItem({
    super.key,
    required this.product,
    required this.editTab,
  });
  final InventryModel product;
  final VoidCallback editTab;
  //...CONSTANT VALUES
  static const _pointZeroOnePercent = 0.01;
  static const _pointZeroTwoPercent = 0.02;
  static const _pointZeroTwoFivePercent = 0.025;
  static const _pointOneTwoPercent = 0.12;
  static const _pointOneFivePercent = 0.15;
  static const _pointTwoFivePercent = 0.25;
  static const _pointNinePercent = 0.9;
  static const _borderRadius = 20.0;
  static const _imageBorderRadius = 10.0;
  static const _blurRadius = 5.0;
  static const _spreadRadius = 1.0;
  static const _shadowOffset = Offset(1.0, 1.0);
  static const _productFontSize = 16.0;
  static const _normalFontSize = 12.0;
  static const _situationFotSize = 10.0;
  //...CONSTANT FLEX SIZES
  static const _flexOne = 1;
  static const _flexTwo = 2;
  static const _flexFour = 4;
  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(height * _pointZeroTwoPercent),
        width: width * _pointNinePercent,
        height: height * _pointOneFivePercent,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: const [
            BoxShadow(
              color: AppColors.black54Color,
              blurRadius: _blurRadius,
              spreadRadius: _spreadRadius,
              offset: _shadowOffset,
            )
          ],
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Row(
          children: [
            Expanded(
              flex: _flexOne,
              child: Center(
                child: SizedBox(
                  width: width * _pointTwoFivePercent,
                  height: height * _pointOneTwoPercent,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      _imageBorderRadius,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: product.productImage,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(image: imageProvider),
                          ),
                        );
                      },
                      progressIndicatorBuilder: (context, url, progress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return Center(
                          child: Text(
                            'Error loading image',
                            style: GoogleFonts.poppins(
                              fontSize: _normalFontSize,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: _flexTwo,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * _pointZeroOnePercent),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: _flexFour,
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                product.productName,
                                style: GoogleFonts.roboto(
                                  fontSize: _productFontSize,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: editTab,
                            child: Icon(
                              Icons.edit_square,
                              size: height * _pointZeroTwoFivePercent,
                              color: AppColors.grayColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: _flexFour,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Current Stock : ${product.quantity}',
                          style: GoogleFonts.roboto(
                            fontSize: _normalFontSize,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: _flexFour,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'updated ${product.updatedAt.day - DateTime.now().day} day ago',
                              style: GoogleFonts.roboto(
                                fontSize: _normalFontSize,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            product.stockSituation,
                            style: GoogleFonts.roboto(
                              fontSize: _situationFotSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
