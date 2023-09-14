// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reponse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseModel<T> _$$_ResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_ResponseModel<T>(
      isSuccess: json['isSuccess'] as bool,
      message: _$nullableGenericFromJson(json['message'], fromJsonT),
    );

Map<String, dynamic> _$$_ResponseModelToJson<T>(
  _$_ResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'message': _$nullableGenericToJson(instance.message, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
