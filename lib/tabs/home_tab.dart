import 'package:flutter/material.dart';
import 'package:profile/pages/home/widget/large_component_widget.dart';
import 'package:profile/pages/home/widget/small_component_widget.dart';
import 'package:profile/utils/responsive_layout_ultis.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutUltis(
      largeScreen: LargeComponentWidget(),
      smallScreen: SmallComponentWidget(),
      mediumScreen: Container(),
    );
  }
}
