import 'package:aislecheck/core/common/widgets/item_scale_animation.dart';
import 'package:aislecheck/features/choose_role/views/choose_role_page.dart';
import 'package:aislecheck/features/on_boarding/controllers/on_bording_behaviour.dart';
import 'package:aislecheck/features/on_boarding/views/widgets/on_bording_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OnBordingPage extends HookWidget with OnBordingBehaviour {
  OnBordingPage({super.key});
  static const name = '/shoppingPage';

  @override
  Widget build(BuildContext context) {
    PageController pageController = usePageController();
    return Scaffold(
      body: PageView.builder(
        itemCount: onBoardingWidgets.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return ItemScaleAnimation(
            child: OnBoardingWidget(
                imagePath: onBoardingWidgets[index].imagePath,
                controller: pageController,
                heading: onBoardingWidgets[index].heading,
                nextBtnTab: () {
                  onTab(context, index, pageController);
                },
                skipBtnTab: () {
                  onTab(context, index, pageController);
                },
                subHeading: onBoardingWidgets[index].subHeading),
          );
        },
      ),
    );
  }

  void onTab(BuildContext context, int index, PageController pageController) {
    if (index == 2) {
      Navigator.pushNamed(context, ChooseRolePage.name);
    } else {
      pageController.animateToPage(index + 1,
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
}
