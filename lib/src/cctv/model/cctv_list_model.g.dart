// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cctv_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CctvModel _$$_CctvModelFromJson(Map<String, dynamic> json) => _$_CctvModel(
      HSP_TP_CD: json['HSP_TP_CD'] as String,
      PT_NO: json['PT_NO'] as String,
      REQ_TP_CD: json['REQ_TP_CD'] as String,
      REQ_TP_NM: json['REQ_TP_NM'] as String,
      REQ_PSN_NM: json['REQ_PSN_NM'] as String,
      REQ_DT: DateTime.parse(json['REQ_DT'] as String),
      OP_EXPT_DT: DateTime.parse(json['OP_EXPT_DT'] as String),
      OP_NM: json['OP_NM'] as String,
      REQ_ID: json['REQ_ID'] as String,
      APBT_YN: json['APBT_YN'] as String?,
      APBT_STF_NO: json['APBT_STF_NO'] as String?,
      SID: json['SID'] as String,
      APBT_VETO_RSN_CD: json['APBT_VETO_RSN_CD'] as String?,
      APBT_VETO_RSN_CNTE: json['APBT_VETO_RSN_CNTE'] as String?,
      PT_NM: json['PT_NM'] as String,
      APCN_YN: json['APCN_YN'] as String?,
    );

Map<String, dynamic> _$$_CctvModelToJson(_$_CctvModel instance) =>
    <String, dynamic>{
      'HSP_TP_CD': instance.HSP_TP_CD,
      'PT_NO': instance.PT_NO,
      'REQ_TP_CD': instance.REQ_TP_CD,
      'REQ_TP_NM': instance.REQ_TP_NM,
      'REQ_PSN_NM': instance.REQ_PSN_NM,
      'REQ_DT': instance.REQ_DT.toIso8601String(),
      'OP_EXPT_DT': instance.OP_EXPT_DT.toIso8601String(),
      'OP_NM': instance.OP_NM,
      'REQ_ID': instance.REQ_ID,
      'APBT_YN': instance.APBT_YN,
      'APBT_STF_NO': instance.APBT_STF_NO,
      'SID': instance.SID,
      'APBT_VETO_RSN_CD': instance.APBT_VETO_RSN_CD,
      'APBT_VETO_RSN_CNTE': instance.APBT_VETO_RSN_CNTE,
      'PT_NM': instance.PT_NM,
      'APCN_YN': instance.APCN_YN,
    };
