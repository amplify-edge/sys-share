class Paths {
  final String baseRoute;
  String sysAccountVerify;

  Paths(this.baseRoute)
      : sysAccountVerify = '$baseRoute/sys-account/verify/:id';
}
