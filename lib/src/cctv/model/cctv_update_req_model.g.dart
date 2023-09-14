// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cctv_update_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CctvUpdateReqModel _$$_CctvUpdateReqModelFromJson(
        Map<String, dynamic> json) =>
    _$_CctvUpdateReqModel(
      APBT_VETO_RSN_CD: json['APBT_VETO_RSN_CD'] as String?,
      APBT_VETO_RSN_CNTE: json['APBT_VETO_RSN_CNTE'] as String?,
      SID: json['SID'] as String,
      REQ_ID: json['REQ_ID'] as String,
      HSP_TP_CD: json['HSP_TP_CD'] as String,
    );

Map<String, dynamic> _$$_CctvUpdateReqModelToJson(
        _$_CctvUpdateReqModel instance) =>
    <String, dynamic>{
      'APBT_VETO_RSN_CD': instance.APBT_VETO_RSN_CD,
      'APBT_VETO_RSN_CNTE': instance.APBT_VETO_RSN_CNTE,
      'SID': instance.SID,
      'REQ_ID': instance.REQ_ID,
      'HSP_TP_CD': instance.HSP_TP_CD,
    };
