// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_device_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppDeviceData _$AppDeviceDataFromJson(Map<String, dynamic> json) {
  return _AppDeviceData.fromJson(json);
}

/// @nodoc
mixin _$AppDeviceData {
  String get appVersion => throw _privateConstructorUsedError;
  String get appBuild => throw _privateConstructorUsedError;
  String? get deviceID => throw _privateConstructorUsedError;
  String? get deviceOSVersion => throw _privateConstructorUsedError;
  String? get deviceModel => throw _privateConstructorUsedError;
  String? get deviceOS => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppDeviceDataCopyWith<AppDeviceData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppDeviceDataCopyWith<$Res> {
  factory $AppDeviceDataCopyWith(AppDeviceData value, $Res Function(AppDeviceData) then) = _$AppDeviceDataCopyWithImpl<$Res>;
  $Res call({String appVersion, String appBuild, String? deviceID, String? deviceOSVersion, String? deviceModel, String? deviceOS});
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
    Object? deviceOSVersion = freezed,
    Object? deviceModel = freezed,
    Object? deviceOS = freezed,
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
      deviceOSVersion: deviceOSVersion == freezed
          ? _value.deviceOSVersion
          : deviceOSVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceModel: deviceModel == freezed
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceOS: deviceOS == freezed
          ? _value.deviceOS
          : deviceOS // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppDeviceDataCopyWith<$Res> implements $AppDeviceDataCopyWith<$Res> {
  factory _$$_AppDeviceDataCopyWith(_$_AppDeviceData value, $Res Function(_$_AppDeviceData) then) = __$$_AppDeviceDataCopyWithImpl<$Res>;
  @override
  $Res call({String appVersion, String appBuild, String? deviceID, String? deviceOSVersion, String? deviceModel, String? deviceOS});
}

/// @nodoc
class __$$_AppDeviceDataCopyWithImpl<$Res> extends _$AppDeviceDataCopyWithImpl<$Res> implements _$$_AppDeviceDataCopyWith<$Res> {
  __$$_AppDeviceDataCopyWithImpl(_$_AppDeviceData _value, $Res Function(_$_AppDeviceData) _then) : super(_value, (v) => _then(v as _$_AppDeviceData));

  @override
  _$_AppDeviceData get _value => super._value as _$_AppDeviceData;

  @override
  $Res call({
    Object? appVersion = freezed,
    Object? appBuild = freezed,
    Object? deviceID = freezed,
    Object? deviceOSVersion = freezed,
    Object? deviceModel = freezed,
    Object? deviceOS = freezed,
  }) {
    return _then(_$_AppDeviceData(
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
      deviceOSVersion: deviceOSVersion == freezed
          ? _value.deviceOSVersion
          : deviceOSVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceModel: deviceModel == freezed
          ? _value.deviceModel
          : deviceModel // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceOS: deviceOS == freezed
          ? _value.deviceOS
          : deviceOS // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppDeviceData extends _AppDeviceData {
  _$_AppDeviceData({required this.appVersion, required this.appBuild, this.deviceID, this.deviceOSVersion, this.deviceModel, this.deviceOS}) : super._();

  factory _$_AppDeviceData.fromJson(Map<String, dynamic> json) => _$$_AppDeviceDataFromJson(json);

  @override
  final String appVersion;
  @override
  final String appBuild;
  @override
  final String? deviceID;
  @override
  final String? deviceOSVersion;
  @override
  final String? deviceModel;
  @override
  final String? deviceOS;

  @override
  String toString() {
    return 'AppDeviceData(appVersion: $appVersion, appBuild: $appBuild, deviceID: $deviceID, deviceOSVersion: $deviceOSVersion, deviceModel: $deviceModel, deviceOS: $deviceOS)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppDeviceData &&
            const DeepCollectionEquality().equals(other.appVersion, appVersion) &&
            const DeepCollectionEquality().equals(other.appBuild, appBuild) &&
            const DeepCollectionEquality().equals(other.deviceID, deviceID) &&
            const DeepCollectionEquality().equals(other.deviceOSVersion, deviceOSVersion) &&
            const DeepCollectionEquality().equals(other.deviceModel, deviceModel) &&
            const DeepCollectionEquality().equals(other.deviceOS, deviceOS));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(appVersion), const DeepCollectionEquality().hash(appBuild), const DeepCollectionEquality().hash(deviceID),
      const DeepCollectionEquality().hash(deviceOSVersion), const DeepCollectionEquality().hash(deviceModel), const DeepCollectionEquality().hash(deviceOS));

  @JsonKey(ignore: true)
  @override
  _$$_AppDeviceDataCopyWith<_$_AppDeviceData> get copyWith => __$$_AppDeviceDataCopyWithImpl<_$_AppDeviceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppDeviceDataToJson(
      this,
    );
  }
}

abstract class _AppDeviceData extends AppDeviceData {
  factory _AppDeviceData({required final String appVersion, required final String appBuild, final String? deviceID, final String? deviceOSVersion, final String? deviceModel, final String? deviceOS}) =
      _$_AppDeviceData;
  _AppDeviceData._() : super._();

  factory _AppDeviceData.fromJson(Map<String, dynamic> json) = _$_AppDeviceData.fromJson;

  @override
  String get appVersion;
  @override
  String get appBuild;
  @override
  String? get deviceID;
  @override
  String? get deviceOSVersion;
  @override
  String? get deviceModel;
  @override
  String? get deviceOS;
  @override
  @JsonKey(ignore: true)
  _$$_AppDeviceDataCopyWith<_$_AppDeviceData> get copyWith => throw _privateConstructorUsedError;
}
