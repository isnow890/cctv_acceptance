import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cctv_update_req_model.g.dart';

part 'cctv_update_req_model.freezed.dart';

@freezed
class CctvUpdateReqModel with _$CctvUpdateReqModel {
  factory CctvUpdateReqModel({
    String? APBT_VETO_RSN_CD,
    String? APBT_VETO_RSN_CNTE,
    required String SID,
    required String REQ_ID,
    required String HSP_TP_CD,
  }) = _CctvUpdateReqModel;

  factory CctvUpdateReqModel.fromJson(Map<String, dynamic> json) =>
      _$CctvUpdateReqModelFromJson(json);
}
