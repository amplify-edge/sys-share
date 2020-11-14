library syscore;

import 'package:flutter/services.dart';

// import 'dart:io';

//import 'package:hive/hive.dart';
//import 'package:path_provider/path_provider.dart';

export 'package:sys_core/device_utils.dart';
export 'package:sys_core/pkg/i18n/languages.dart';
export 'package:sys_core/pkg/widgets/gc_master_detail.dart';
export 'package:sys_core/pkg/widgets/old_master_detail.dart';
export 'package:sys_core/pkg/widgets/notification.dart';
export 'package:sys_core/pkg/settings/core_settings.dart';
export 'package:sys_core/rpc/v2/sys_core_models.pb.dart';
export 'package:sys_core/rpc/v2/sys_core_models.pbjson.dart';
export 'package:sys_core/rpc/v2/sys_core_models.pbenum.dart';
export 'package:sys_core/rpc/v2/sys_core_services.pbgrpc.dart';
export 'package:sys_core/rpc/v2/sys_core_services.pbjson.dart';
export 'package:sys_core/rpc/v2/sys_core_services.pbenum.dart';
export 'package:sys_core/rpc/v2/sys_core_file_services.pb.dart';
export 'package:sys_core/rpc/v2/sys_core_file_services.pbenum.dart';
export 'package:sys_core/rpc/v2/sys_core_file_services.pbgrpc.dart';
export 'package:sys_core/rpc/v2/sys_core_file_services.pbjson.dart';
export 'package:sys_core/pkg/shared_repositories/base_repo.dart';

coreInit() async {
  //final Directory dir = await getApplicationDocumentsDirectory();
  //Hive.init(dir.path);
  //Hive.registerAdapter(HiveProtoModuleConfigAdapter());
}
