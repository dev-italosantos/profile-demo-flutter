import 'package:flutter/material.dart';
import 'package:profile_demo/core/app_colors.dart';
import 'package:profile_demo/core/app_default.dart';

import 'package:profile_demo/pages/home/widget/responsive/large_component_widget.dart';
import 'package:profile_demo/pages/home/widget/responsive/medium_component_widget.dart';
import 'package:profile_demo/pages/home/widget/responsive/small_component_widget.dart';
import 'package:profile_demo/utils/responsive_layout_ultis.dart';

class TopSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 900.0, minHeight: 700.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.purple,
      ),
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        width: 1200.0,
        child: Stack(
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return homedBody(context, constraints);
            }),
          ],
        ),
      ),
    );
  }
}

Widget homedBody(BuildContext context, BoxConstraints constraints) {
  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
      child: ResponsiveLayoutUltis(
        largeScreen: LargeComponentWidget(),
        mediumScreen: MediumComponentWidget(),
        smallScreen: SmallComponentWidget(),
      ),
    ),
  );
}
