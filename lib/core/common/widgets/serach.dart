import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Container(
      width: width * 0.9,
      padding: const EdgeInsets.all(15),
      height: height * 0.07,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.black54Color,
          width: 1,
        ),
      ),
      child: const Align(
        alignment: Alignment(0, 0),
        child: Row(
          children: <Widget>[
            Icon(Icons.search, color: AppColors.blackColor),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                "Search shops, items etc",
                style: TextStyle(color: AppColors.black54Color, fontSize: 16),
              ),
            ),
            Icon(
              Icons.filter_list,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }
}
