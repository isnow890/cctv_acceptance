import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cctv_model.g.dart';

part 'cctv_model.freezed.dart';

@freezed
class CctvListResModel with _$CctvListResModel {
  CctvListResModel._();

  factory CctvListResModel({
    required String HSP_TP_CD,
    required String PT_NO,
    required String REQ_TP_CD,
    required String REQ_TP_NM,
    required String REQ_PSN_NM,
    required DateTime REQ_DT,
    required DateTime OP_EXPT_DT,
    required String OP_NM,
    required String REQ_ID,
    required String? APBT_YN,
    required String? APBT_STF_NO,
    required String SID,
    required String? APBT_VETO_RSN_CD,
    required String? APBT_VETO_RSN_CNTE,
    required String PT_NM,
    required String? APCN_YN,
  }) = _CctvModel;

  get get_HSP_TP_CD => HSP_TP_CD == '01' ? '서울병원' : '목동병원';

  factory CctvListResModel.fromJson(Map<String, dynamic> json) =>
      _$CctvListResModelFromJson(json);
}
