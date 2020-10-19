import 'package:flutter/foundation.dart';
import 'package:sys_core/pkg/settings/core_settings.dart';

/// [ModuleConfig] is the base class for every module which needs to expose
/// it's settings to the settings gui. This module can be used for any DI
/// solutions and be consumed by a Consumer class as there are in
/// flutter_modular or provider as it's also a ChangeNotifier class.
///

class ModuleConfig extends ChangeNotifier {
  String moduleID;
  String moduleName;
  Map<String, ModuleConfigItem> _configItems = Map();

  List<ModuleConfigItem> get configItems => _configItems.values.toList();

  ModuleConfig(
      {@required this.moduleID,
      @required this.moduleName,
      @required List<ModuleConfigItem> items})
      : assert(moduleID != null),
        assert(moduleName != null) {
    items.forEach((item) {
      if (_configItems[item.key] != null) {
        print(
            "Warning ModuleConfigItem with key '${item.key}' already added! Ignoring... $item");
      } else {
        _configItems[item.key] = item;
      }
    });
  }

  int getIntValue(String key) {
    var item = _configItems[key];
    if (item == null) {
      print("Error: Key $key not found!");
      return null;
    }
    if (item is! ModuleConfigItemDropdown) {
      print(
          "Error: Value of key $key has not a ModuleConfigItemDropdown: ${item.runtimeType}}");
      return null;
    }
    return (item as ModuleConfigItemDropdown).value;
  }

  bool getBoolValue(String key) {
    var item = _configItems[key];
    if (item == null) {
      print("Error: Key $key not found!");
      return null;
    }
    if (item is! ModuleConfigItemBool) {
      print(
          "Error: Value of key $key has not a ModuleConfigItemBool: ${item.runtimeType}}");
      return null;
    }
    return (item as ModuleConfigItemBool).value;
  }

  setIntValue(String key, int value) {
    var item = _configItems[key];
    if (item == null) {
      print("Error: Key $key not found!");
      return;
    }

    if (item is! ModuleConfigItemDropdown) {
      print(
          "Error: Value of key $key has not a ModuleConfigItemDropdown: ${item.runtimeType}}");
      return;
    }
    _configItems[key] =
        (item as ModuleConfigItemDropdown).copyWith(value: value);
    notifyListeners();
  }

  setBoolValue(String key, bool value) {
    var item = _configItems[key];
    if (item == null) {
      print("Error: Key $key not found!");
      return;
    }

    if (item is ModuleConfigItemDropdown) {
      print(
          "Error: Value of key $key has not a ModuleConfigItemBool: ${item.runtimeType}}");
      return;
    }
    _configItems[key] = (item as ModuleConfigItemBool).copyWith(value: value);
    notifyListeners();
  }

  @override
  String toString() {
    return "ModuleConfigs: { moduleID: $moduleID, _configs: $_configItems }";
  }
}
