import 'package:aislecheck/core/common/widgets/error_msg_widget.dart';
import 'package:aislecheck/core/common/widgets/global_app_bar.dart';
import 'package:aislecheck/core/common/widgets/loading_widget.dart';
import 'package:aislecheck/features/auth/admin_auth/views/admin_sign_in_page.dart';
import 'package:aislecheck/features/email_verfication/controllers/email_verfication_controller.dart';
import 'package:aislecheck/features/email_verfication/views/widgets/email_verification_loaded_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class EmailVerficationPage extends StatelessWidget {
  const EmailVerficationPage({super.key});
  static const name = '/emailVerficationPage';

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    EmailVerficationController emailVerficationController =
        context.watch<EmailVerficationController>();
    return Scaffold(
      appBar: GlobalAppBar(titleText: 'Ads'),
      body: Scaffold(
        body: Builder(
          builder: (context) {
            switch (emailVerficationController.state) {
              case EmailInitialState():
                return EmailVerficationWidget(
                    email: email,
                    emailVerficationController: emailVerficationController);
              case EmialLoadingState():
                return const LoadingWidget();
              case EmailVerficationLoadedState():
                _navigate(() {
                  Navigator.pushNamed(context, AdmminSignInPage.name);
                  emailVerficationController.reinitializeState();
                });
                return EmailVerficationWidget(
                    email: email,
                    emailVerficationController: emailVerficationController);
              case EmailVerficationErrorState():
                return ErrorMessageWidget(
                  title: 'Email is not verified yet',
                  message: (emailVerficationController.state
                          as EmailVerficationErrorState)
                      .msg,
                  onRetry: () {
                    emailVerficationController.verficationEmail();
                  },
                );
            }
          },
        ),
      ),
    );
  }

  void _navigate(VoidCallback navigate) {
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        navigate();
      },
    );
  }
}
