import 'package:cctv_acceptance/src/cctv/model/cctv_list_model.dart';
import 'package:cctv_acceptance/src/cctv/model/cctv_update_req_model.dart';
import 'package:cctv_acceptance/src/common/model/reponse_model.dart';
import 'package:cctv_acceptance/src/data.dart';
import 'package:cctv_acceptance/src/dio.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'cctv_repository.g.dart';

@riverpod
CctvRepository cctvRepository(CctvRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final repository = CctvRepository(dio, baseUrl: "$baseUrl/cctv");
  return repository;
}

@RestApi()
abstract class CctvRepository {
  factory CctvRepository(Dio dio, {String baseUrl}) = _CctvRepository;

  // string HSP_TP_CD, string REQ_ID, string SID

  @GET('/list')
  Future<List<CctvListResModel>> getCctvList({
    @Query("HSP_TP_CD") required String HSP_TP_CD,
    @Query("REQ_ID") required String REQ_ID,
    @Query("SID") required String SID,
  });

  @POST('/response')
  Future<ResponseModel<String>> responseCctv({
    @Body() required CctvUpdateReqModel body,
  });
}
