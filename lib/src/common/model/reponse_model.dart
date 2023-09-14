import 'package:freezed_annotation/freezed_annotation.dart';

part 'reponse_model.g.dart';
part 'reponse_model.freezed.dart';

@Freezed(genericArgumentFactories: true)
class ResponseModel<T> with _$ResponseModel<T> {
  factory ResponseModel({required bool isSuccess, T? message}) =
  _ResponseModel;

  factory ResponseModel.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) =>
      _$ResponseModelFromJson(json, fromJsonT);
}
