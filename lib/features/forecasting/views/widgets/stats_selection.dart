import 'package:aislecheck/core/constants/enumration/enumrations.dart';
import 'package:aislecheck/core/constants/strings/app_colors.dart';
import 'package:aislecheck/features/forecasting/controllers/stats_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatsSelection extends StatelessWidget {
  const StatsSelection({
    super.key,
  });
  static const int _oneFlex = 1;
  static const int _threeFlex = 3;
  static const int _fourFlex = 4;
  @override
  Widget build(BuildContext context) {
    var state = context.watch<StatsController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Spacer(
          flex: _oneFlex,
        ),
        Radio<String>(
          activeColor: AppColors.greenColor,
          value: StatsEnumuration.currentStats.name,
          groupValue: state.selectStats,
          onChanged: (value) {
            context
                .read<StatsController>()
                .statsOption(value ?? StatsEnumuration.currentStats.name);
          },
        ),
        const Spacer(
          flex: _oneFlex,
        ),
        Text(
          'Current stats',
          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const Spacer(
          flex: _threeFlex,
        ),
        Radio<String>(
          activeColor: AppColors.greenColor,
          value: StatsEnumuration.historicStats.name,
          groupValue: state.selectStats,
          onChanged: (value) {
            context
                .read<StatsController>()
                .statsOption(value ?? StatsEnumuration.historicStats.name);
          },
        ),
        const Spacer(
          flex: _oneFlex,
        ),
        Text(
          'Current stats',
          style: GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const Spacer(
          flex: _fourFlex,
        ),
      ],
    );
  }
}