import 'package:cctv_acceptance/src/cctv/model/cctv_model.dart';
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
    required String SID}) async {
  final repository = ref.watch(cctvRepositoryProvider);

  var resp = await Future.wait([
    repository.getCctvList(HSP_TP_CD: HSP_TP_CD, REQ_ID: REQ_ID, SID: SID),
    Future.delayed(const Duration(milliseconds: 1000)),
  ]);

  print('resp[0].length');
  print(resp[0].length);

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
    return (resp[0] as ResponseModel).message;
  } catch (e) {
    print(e);
//state = ModelBaseError(message: CANNOT_PROCESS_DATA_MESSAGE);
    return '';
  }
}
