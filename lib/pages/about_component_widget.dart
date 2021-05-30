import 'package:flutter/material.dart';
import 'package:profile/core/app_colors.dart';
import 'package:profile/core/app_default.dart';
import 'package:profile/core/app_fonts.dart';
import 'package:profile/core/app_string.dart';
import 'package:profile/core/app_text_style.dart';
import 'package:profile/models/education.dart';
import 'package:profile/utils/education_ultis.dart';
import 'package:profile/utils/responsive_layout_ultis.dart';
import 'package:profile/utils/skills_ultis.dart';

import 'about/large_about_components_widget.dart';
import 'about/widget/content_about_widget.dart';

class AboutComponentWidget extends StatelessWidget {
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
              return buildBody(context, constraints);
            }),
          ],
        ),
      ),
    );
  }
}

Widget buildBody(BuildContext context, BoxConstraints constraints) {
  return SingleChildScrollView(
    child: ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
      child: ResponsiveLayoutUltis(
        largeScreen: LargeAboutComponentsWidget(),
        mediumScreen: _buildMediumScreen(context),
        smallScreen: _buildSmallScreen(context),
      ),
    ),
  );
}

Widget _buildMediumScreen(BuildContext context) {
  return IntrinsicHeight(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(flex: 1, child: ContentAboutWidget()),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildSmallScreen(BuildContext context) {
  return IntrinsicHeight(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(flex: 1, child: ContentAboutWidget()),
        Divider(),
        SizedBox(
            height: ResponsiveLayoutUltis.isSmallScreen(context) ? 12.0 : 0.0),
      ],
    ),
  );
}