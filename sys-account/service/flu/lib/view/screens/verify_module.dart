import 'package:flutter_modular/flutter_modular.dart';
import 'package:sys_share_sys_account_service/pkg/pkg.dart';
import 'package:sys_share_sys_account_service/view/widgets/verify_page.dart';

class VerifyModule extends ChildModule {
  final String baseRoute;
  final String url;

  VerifyModule({
    String baseRoute,
    String url,
  })  : this.baseRoute = (baseRoute == '/') ? '' : baseRoute,
        this.url = url;

  @override
  List<Bind> get binds => [
        Bind.singleton((i) => Paths(baseRoute)),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '$baseRoute/verify/:id',
          child: (_, args) => VerifyPage(
            id: args.params['id'] ?? '',
            callback: args.data,
          ),
        ),
      ];

  static Inject get to => Inject<VerifyModule>();
}
