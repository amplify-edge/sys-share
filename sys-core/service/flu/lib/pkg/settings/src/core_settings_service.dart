import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sys_core/pkg/settings/src/module_config.dart';

abstract class CoreSettingsService extends ChangeNotifier {
  List<ModuleConfig> get moduleConfigs;

  /// each module which want's to expose its settings have to register
  /// its [ModuleConfig] here
  registerModuleConfig(ModuleConfig configs);
}
