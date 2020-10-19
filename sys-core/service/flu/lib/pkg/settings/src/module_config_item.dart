import 'package:flutter/material.dart';

/// Base config class, it has a key, value and a description which is displayed
/// on the settings screen
/// Implementations should use strong types instead of [T]
abstract class ModuleConfigItem<T> {
  final String key;
  final String description;
  final T value;

  ModuleConfigItem(this.key, this.value, this.description)
      : assert(key != null),
        assert(value != null);

  @override
  String toString() =>
      "${this.runtimeType}: { key: $key, value: $value, description: $description }";
}

/// Concrete implementation of ModuleConfig with a dropdown as value
class ModuleConfigItemDropdown extends ModuleConfigItem<int> {
  final List<String> items;

  ModuleConfigItemDropdown(String key, int value, String desc,
      {@required this.items})
      : super(key, value, desc);

  ModuleConfigItemDropdown copyWith(
      {String key, int value, String desc, List<String> items}) {
    return ModuleConfigItemDropdown(
        key ?? this.key, value ?? this.value, description ?? this.description,
        items: items ?? this.items);
  }
}

/// Concrete implementation of ModuleConfig with a bool as value
class ModuleConfigItemBool extends ModuleConfigItem<bool> {
  ModuleConfigItemBool(String key, bool value, [String desc])
      : super(key, value, desc);

  ModuleConfigItemBool copyWith({String key, bool value, String desc}) {
    return ModuleConfigItemBool(
        key ?? this.key, value ?? this.value, description ?? this.description);
  }
}
