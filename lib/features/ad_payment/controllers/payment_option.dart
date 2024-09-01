import 'package:aislecheck/core/constants/enumration/enumrations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'payment_option.g.dart';


@riverpod
class PaymentOptionNotifier extends _$PaymentOptionNotifier {
  @override
  String build() {
    return PaymentMethod.momoPayment.name;
  }

  void paymentOption(String value) {
    state=value;
  }
}
