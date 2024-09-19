import 'dart:developer';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/features/choose_role/views/choose_role_page.dart';
import 'package:aislecheck/features/on_boarding/controllers/on_bording_behaviour.dart';
import 'package:aislecheck/features/on_boarding/controllers/on_bording_controller.dart';
import 'package:aislecheck/features/on_boarding/views/widgets/on_bording_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class OnBordingPage extends HookWidget with OnBordingBehaviour {
  OnBordingPage({super.key});
  static const name = '/shoppingPage';

  @override
  Widget build(BuildContext context) {
    OnBordingController onBordingController =
        context.watch<OnBordingController>();
    log(onBordingController.state.toString());
    return Scaffold(
        body: switch (onBordingController.state) {
      SigninLoadingState() => LoadingWidget(
          event: () {
            onBordingController.isSignin();
          },
        ),
      SigninTrueState() => const ChooseRolePage(),
      SinginFalseState() => OnBording(),
    });
  }
}

class OnBording extends HookWidget with OnBordingBehaviour {
  OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = usePageController();
    return PageView.builder(
      itemCount: onBoardingWidgets.length,
      controller: pageController,
      itemBuilder: (context, index) {
        return OnBoardingWidget(
            imagePath: onBoardingWidgets[index].imagePath,
            controller: pageController,
            heading: onBoardingWidgets[index].heading,
            nextBtnTab: () {
              onTab(context, index, pageController);
            },
            skipBtnTab: () {
              onTab(context, index, pageController);
            },
            subHeading: onBoardingWidgets[index].subHeading);
      },
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
