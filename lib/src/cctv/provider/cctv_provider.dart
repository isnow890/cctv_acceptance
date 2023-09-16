import 'package:cctv_acceptance/src/cctv/model/cctv_list_model.dart';
import 'package:cctv_acceptance/src/cctv/model/cctv_update_req_model.dart';
import 'package:cctv_acceptance/src/cctv/repository/cctv_repository.dart';
import 'package:cctv_acceptance/src/common/model/reponse_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cctv_provider.g.dart';

// http://localhost:65311/#/cctv/01/1/1003824

// @Query("HSP_TP_CD") required String HSP_TP_CD,
// @Query("REQ_ID") required String REQ_ID,
// @Query("SID") required String SID,
@riverpod
Future<List<CctvListResModel>> cctvs(CctvsRef ref,
    {required String HSP_TP_CD,
    required String REQ_ID,
    required String SID,
    required initialLoad}) async {
  final repository = ref.watch(cctvRepositoryProvider);


  var resp = await Future.wait([
    repository.getCctvList(HSP_TP_CD: HSP_TP_CD, REQ_ID: REQ_ID, SID: SID),
    Future.delayed(Duration(milliseconds: initialLoad ? 555 : 300)),
  ]);

  return resp[0] as List<CctvListResModel>;
}

@riverpod
Future<String> updateCctvResponse(UpdateCctvResponseRef ref,
    {required CctvUpdateReqModel body}) async {
  try {
    final repository = ref.watch(cctvRepositoryProvider);

    var resp = await Future.wait([
      repository.responseCctv(body: body),
      Future.delayed(const Duration(milliseconds: 555)),
    ]);

    print(resp[0]);

    return (resp[0] as ResponseModel<String>).message!;
  } catch (e) {
    print('에러에러');
    print(e);

  }

  return '제출 중 에러가 발생하였습니다';
}
