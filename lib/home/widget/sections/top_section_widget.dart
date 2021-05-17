import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profile/components/widget/logo_component_widget.dart';
import 'package:profile/components/widget/large_component_widget.dart';
import 'package:profile/components/widget/menu_compenent_widget.dart';
import 'package:profile/core/app_colors.dart';
import 'package:profile/core/app_default.dart';
import 'package:profile/core/core.dart';

class TopSectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      constraints: BoxConstraints(maxHeight: 900.0, minHeight: 700.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightcoral,
      ),
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        width: 1200.0,
        child: Stack(
          children: [
            LogoComponentWidget(size: size),
            Positioned(
              //bottom: 0,
              //right: 0,
              child: LargeComponentWidget(),
            ),
            Positioned(
              bottom: 0,
              child: MenuComponentWidget(),
            )
          ],
        ),
      ),
    );
  }
}
