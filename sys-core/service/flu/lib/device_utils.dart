import 'package:flutter/widgets.dart';

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.width >= tabletBreakpoint;
}
bool isDesktop(BuildContext context){
  return MediaQuery.of(context).size.width >= desktopBreakpoint;
}

const desktopBreakpoint = 1440.0;
const tabletBreakpoint = 768.0;
