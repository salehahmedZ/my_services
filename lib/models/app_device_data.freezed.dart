// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'app_device_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppDeviceData _$AppDeviceDataFromJson(Map<String, dynamic> json) {
  return _AppDeviceData.fromJson(json);
}

/// @nodoc
class _$AppDeviceDataTearOff {
  const _$AppDeviceDataTearOff();

  _AppDeviceData call({required String appVersion, required String appBuild, String? deviceID, String? osVersion, String? deviceModel}) {
    return _AppDeviceData(
      appVersion: appVersion,
      appBuild: appBuild,
      deviceID: deviceID,
      osVersion: osVersion,
      deviceModel: deviceModel,
    );
  }

  AppDeviceData fromJson(Map<String, Object> json) {
    return AppDeviceData.fromJson(json);
  }
}

/// @nodoc
const $AppDeviceData = _$AppDeviceDataTearOff();

/// @nodoc
mixin _$AppDeviceData {
  String get appVersion => throw _privateConstructorUsedError;
  String get appBuild => throw _privateConstructorUsedError;
  String? get deviceID => throw _privateConstructorUsedError;
  String? get osVersion => throw _privateConstructorUsedError;
  String? get deviceModel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDeviceDataCopyWith<AppDeviceData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDeviceDataCopyWith<$Res> {
  factory $AppDeviceDataCopyWith(AppDeviceData value, $Res Function(AppDeviceData) then) = _$AppDeviceDataCopyWithImpl<$Res>;
  $Res call({String appVersion, String appBuild, String? deviceID, String? osVersion, String? deviceModel});
}

/// @nodoc
class _$AppDeviceDataCopyWithImpl<$Res> implements $AppDeviceDataCopyWith<$Res> {
  _$AppDeviceDataCopyWithImpl(this._value, this._then);

  final AppDeviceData _value;
  // ignore: unused_field
  final $Res Function(AppDeviceData) _then;

  @override
  $Res call({
    Object? appVersion = freezed,
    Object? appBuild = freezed,
    Object? deviceID = freezed,
    Object? osVersion = freezed,
    Object? deviceModel = freezed,
  }) {
    return _then(_value.copyWith(
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appBuild: appBuild == freezed
          ? _value.appBuild
          : appBuild // ignore: cast_nullable_to_non_nullable
              as String,
      deviceID: deviceID == freezed
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: osVersion == freezed
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceModel: deviceModel == freezed
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AppDeviceDataCopyWith<$Res> implements $AppDeviceDataCopyWith<$Res> {
  factory _$AppDeviceDataCopyWith(_AppDeviceData value, $Res Function(_AppDeviceData) then) = __$AppDeviceDataCopyWithImpl<$Res>;
  @override
  $Res call({String appVersion, String appBuild, String? deviceID, String? osVersion, String? deviceModel});
}

/// @nodoc
class __$AppDeviceDataCopyWithImpl<$Res> extends _$AppDeviceDataCopyWithImpl<$Res> implements _$AppDeviceDataCopyWith<$Res> {
  __$AppDeviceDataCopyWithImpl(_AppDeviceData _value, $Res Function(_AppDeviceData) _then) : super(_value, (v) => _then(v as _AppDeviceData));

  @override
  _AppDeviceData get _value => super._value as _AppDeviceData;

  @override
  $Res call({
    Object? appVersion = freezed,
    Object? appBuild = freezed,
    Object? deviceID = freezed,
    Object? osVersion = freezed,
    Object? deviceModel = freezed,
  }) {
    return _then(_AppDeviceData(
      appVersion: appVersion == freezed
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      appBuild: appBuild == freezed
          ? _value.appBuild
          : appBuild // ignore: cast_nullable_to_non_nullable
              as String,
      deviceID: deviceID == freezed
          ? _value.deviceID
          : deviceID // ignore: cast_nullable_to_non_nullable
              as String?,
      osVersion: osVersion == freezed
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceModel: deviceModel == freezed
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppDeviceData extends _AppDeviceData {
  _$_AppDeviceData({required this.appVersion, required this.appBuild, this.deviceID, this.osVersion, this.deviceModel}) : super._();

  factory _$_AppDeviceData.fromJson(Map<String, dynamic> json) => _$_$_AppDeviceDataFromJson(json);

  @override
  final String appVersion;
  @override
  final String appBuild;
  @override
  final String? deviceID;
  @override
  final String? osVersion;
  @override
  final String? deviceModel;

  @override
  String toString() {
    return 'AppDeviceData(appVersion: $appVersion, appBuild: $appBuild, deviceID: $deviceID, osVersion: $osVersion, deviceModel: $deviceModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppDeviceData &&
            (identical(other.appVersion, appVersion) || const DeepCollectionEquality().equals(other.appVersion, appVersion)) &&
            (identical(other.appBuild, appBuild) || const DeepCollectionEquality().equals(other.appBuild, appBuild)) &&
            (identical(other.deviceID, deviceID) || const DeepCollectionEquality().equals(other.deviceID, deviceID)) &&
            (identical(other.osVersion, osVersion) || const DeepCollectionEquality().equals(other.osVersion, osVersion)) &&
            (identical(other.deviceModel, deviceModel) || const DeepCollectionEquality().equals(other.deviceModel, deviceModel)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appVersion) ^
      const DeepCollectionEquality().hash(appBuild) ^
      const DeepCollectionEquality().hash(deviceID) ^
      const DeepCollectionEquality().hash(osVersion) ^
      const DeepCollectionEquality().hash(deviceModel);

  @JsonKey(ignore: true)
  @override
  _$AppDeviceDataCopyWith<_AppDeviceData> get copyWith => __$AppDeviceDataCopyWithImpl<_AppDeviceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppDeviceDataToJson(this);
  }
}

abstract class _AppDeviceData extends AppDeviceData {
  factory _AppDeviceData({required String appVersion, required String appBuild, String? deviceID, String? osVersion, String? deviceModel}) = _$_AppDeviceData;
  _AppDeviceData._() : super._();

  factory _AppDeviceData.fromJson(Map<String, dynamic> json) = _$_AppDeviceData.fromJson;

  @override
  String get appVersion => throw _privateConstructorUsedError;
  @override
  String get appBuild => throw _privateConstructorUsedError;
  @override
  String? get deviceID => throw _privateConstructorUsedError;
  @override
  String? get osVersion => throw _privateConstructorUsedError;
  @override
  String? get deviceModel => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AppDeviceDataCopyWith<_AppDeviceData> get copyWith => throw _privateConstructorUsedError;
}