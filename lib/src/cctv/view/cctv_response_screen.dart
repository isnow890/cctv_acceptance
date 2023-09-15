import 'package:cctv_acceptance/src/cctv/model/cctv_list_model.dart';
import 'package:cctv_acceptance/src/cctv/provider/cctv_provider.dart';
import 'package:cctv_acceptance/src/common/view/result_screen.dart';
import 'package:cctv_acceptance/theme/component/bottom_sheet/setting_bottom_sheet.dart';
import 'package:cctv_acceptance/theme/component/button/button.dart';
import 'package:cctv_acceptance/theme/component/custom_divider.dart';
import 'package:cctv_acceptance/theme/component/custom_key_value_border.dart';
import 'package:cctv_acceptance/theme/component/custom_text_form_field.dart';
import 'package:cctv_acceptance/theme/component/dialog/custom_save_dialog.dart';
import 'package:cctv_acceptance/theme/component/indicator/whole_circular_indicator.dart';
import 'package:cctv_acceptance/theme/component/custom_segment_button.dart';
import 'package:cctv_acceptance/theme/component/splash_screen.dart';
import 'package:cctv_acceptance/theme/layout/default_layout.dart';
import 'package:cctv_acceptance/theme/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:cctv_acceptance/src/util/util_extensions.dart';
import '../../../theme/component/toast/toast.dart';
import '../model/cctv_update_req_model.dart';

//http://localhost:63865/#/cctv/01/1/1003824

class CctvResponseScreen extends ConsumerStatefulWidget {
  final String HSP_TP_CD;
  final String REQ_ID;
  final String SID;

  const CctvResponseScreen(
      {required this.HSP_TP_CD,
      required this.REQ_ID,
      required this.SID,
      Key? key})
      : super(key: key);

  static String get routeName => 'cctv';

  @override
  ConsumerState<CctvResponseScreen> createState() => _CctvResponseScreenState();
}

class _CctvResponseScreenState extends ConsumerState<CctvResponseScreen> {
  bool agreeYesNo = true;
  int? agreeNoValue;
  bool _isBusy = false;
  final key2 = GlobalKey();

  final ScrollController _scrollController = ScrollController();

  final String screenTitle = '수술장면 촬영 요청 알림';
  TextStyle segmentTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isBusy = false;

    // textController.text='기본텍스트';
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeServiceProvider);

    final cctv = ref.watch(
      cctvsProvider(
          HSP_TP_CD: widget.HSP_TP_CD,
          REQ_ID: widget.REQ_ID,
          SID: widget.SID,
          initialLoad: true),
    );

    return cctv.when(
      data: (data) => WholeCircularIndicator(
        isBusy: _isBusy,
        child: data.isEmpty
            ? ResultScreen(title: '알림', detail: '데이터가 없거나 처리 완료된 건입니다.')
            : DefaultLayout(
                scrollController: _scrollController,
                useSliver: true,
                title: Text(
                  screenTitle,
                  style: theme.typo.headline1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // canBack: true,
                actions: [
                  Button(
                    icon: 'option',
                    type: ButtonType.flat,
                    color: theme.color.text,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return const SettingBottomSheet();
                        },
                      );
                    },
                  ),
                ],
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      _renderFrontSection(),
                      const SizedBox(
                        height: 20,
                      ),
                      _renderRequestInfoSection(
                          get_HSP_TP_Cd: data[0].get_HSP_TP_CD,
                          PT_NM: data[0].PT_NM,
                          PT_NO: data[0].PT_NO,
                          REQ_DT: data[0].REQ_DT),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '수술 정보',
                          style: theme.typo.headline4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ..._renderOperationSection(data: data),
                      _renderAgreementYesNoSection(),
                      const SizedBox(
                        height: 20,
                      ),
                      _renderAgreementNoSection(),
                      _renderSubmitButton(
                          HSP_TP_CD: data[0].HSP_TP_CD,
                          REQ_ID: data[0].REQ_ID,
                          SID: data[0].SID),
                    ],
                  ),
                ),
              ),
      ),
      error: (err, stack) {
        print(stack);
        return ResultScreen(title: '에러발생', detail: '에러가 발생하였습니다. 다시 시도해주세요.');
      },
      loading: () => const SplashScreen(),
    );
  }

  //제출 버튼
  _renderSubmitButton({
    required String SID,
    required String REQ_ID,
    required String HSP_TP_CD,
  }) {
    return Button(
      key: key2,
      width: double.infinity,
      onPressed: () async {
        if (!agreeYesNo) {
          if (agreeNoValue == null) {
            Toast.show('동의안함 사유가 선택되지 않았습니다.');
            return;
          } else if (agreeNoValue == 4) {
            if (textController.text.isEmpty) {
              Toast.show('상세사유가 입력되지 않았습니다.');
              return;
            }
            if (textController.text.length < 10) {
              Toast.show('상세사유는 10자 이상 입력해주세요.');
              return;
            }
          }
        }

        final String confirmMessage =
            '${(agreeYesNo ? '동의함' : '동의안함')}을 선택하셨습니다.';

        await showDialog(
          context: context,
          builder: (_) => CustomYesNoDialog(
            dialogTitle: '제출 확인',
            content: "$confirmMessage\n제출하시겠습니까?",
            onSave: () async {
              //여기서부턴 내일;
              /*ref.read(updateCctvResponseProvider())*/

              final contextSave = Navigator.of(context);

              setState(() {
                _isBusy = true;
              });

              try {
                final String val_APBT_VETO_RSN_CNTE = agreeYesNo
                    ? ''
                    : (agreeNoValue!.toString() == '4'
                        ? textController.text
                        : '');

                final req = CctvUpdateReqModel(
                    SID: SID,
                    REQ_ID: REQ_ID,
                    HSP_TP_CD: HSP_TP_CD,
                    APBT_VETO_RSN_CD:
                        agreeYesNo ? '' : agreeNoValue!.toString(),
                    APBT_VETO_RSN_CNTE: val_APBT_VETO_RSN_CNTE);


                final resp = await ref
                    .read(updateCctvResponseProvider(body: req).future);

                final result = resp.isEmpty ? '제출 완료' : '정보';
                final detail = resp.isEmpty ? '감사합니다. 응답이 기록되었습니다.' : resp;

                contextSave.push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ResultScreen(
                          title: screenTitle, detail: detail, result: result);
                    },
                  ),
                );
              } catch (e) {
                Toast.show('응답 제출중 에러가 발생하였습니다.');
              } finally {
                setState(() {
                  _isBusy = false;
                });
              }
              // context.goNamed(CctvOkScreen.routeName,extra: PostModel());
              //
              // // 다른 페이지로 이동하도록 설정
              // GoRouter.of(context).go('/restricted-page');
            },
          ),
        );
      },
      type: ButtonType.fill,
      text: '제출',
    );
  }

  //동의안함 선택했을때
  _renderAgreementNoSection() {
    final theme = ref.watch(themeServiceProvider);

    return Column(
      children: [
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: !agreeYesNo,
          child: AnimatedOpacity(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            opacity: !agreeYesNo ? 1 : 0,
            child: _AgreeNoWidget(
              agreeNoValue: agreeNoValue,
              onChanged: (int? value) {
                setState(() {
                  agreeNoValue = value;
                });
                if (agreeNoValue == 4) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Scrollable.ensureVisible(
                      key2.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
            ),
          ),
        ),
        Visibility(
          maintainAnimation: true,
          maintainState: true,
          visible: agreeNoValue == 4,
          child: Column(children: [
            const SizedBox(height: 20),
            AnimatedOpacity(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              opacity: agreeNoValue == 4 ? 1 : 0,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '전공의의 수련을 현저히 저해할 우려가 있다고 판단하는 경우를 선택하셨습니다. 상세 사유를 입력해주세요.',
                  style: theme.typo.headline4.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: textController,
              hintText: '상세 사유를 입력해주세요.',
              maxLines: 8,
            ),
            const SizedBox(
              height: 15,
            ),
          ]),
        ),
      ],
    );
  }

  //동의 segment button
  _renderAgreementYesNoSection() {
    final theme = ref.watch(themeServiceProvider);

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            '위의 수술에 대한 촬영/녹음을 동의 하시겠습니까?',
            style: theme.typo.headline4.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomSegmentButton(
            selectionIndex: agreeYesNo ? 0 : 1,
            onSegmentTapped: (selectedIndex) {
              setState(() {
                agreeYesNo = selectedIndex == 0 ? true : false;
                if (agreeYesNo) {
                  print('agreeNoValue!');
                  agreeNoValue = null;
                }

                WidgetsBinding.instance!.addPostFrameCallback((_) {
                  Scrollable.ensureVisible(
                    key2.currentContext!,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              });
            },
            children: {
              0: Text('동의', style: segmentTextStyle),
              1: Text(
                '동의안함',
                style: segmentTextStyle,
              ),
            }),
      ],
    );
  }

  //수술 정보
  _renderOperationSection({required List<CctvListResModel> data}) {
    final theme = ref.watch(themeServiceProvider);

    return data
        .asMap()
        .entries
        .map((e) => Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomKeyValueBorder(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        _renderSection(
                            title: '수술 예정일',
                            value: e.value.OP_EXPT_DT.datetimeToString()),
                        const CustomDivider(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: _renderVerticalSection(
                            title: '수술명',
                            value: e.value.OP_NM,
                            //value: e.value.OP_NM,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ))
        .toList();
  }

  //기본 정보
  _renderRequestInfoSection({
    required get_HSP_TP_Cd,
    required DateTime REQ_DT,
    required String PT_NO,
    required String PT_NM,
  }) {
    final theme = ref.watch(themeServiceProvider);

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              '기본 정보',
              style: theme.typo.headline4.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomKeyValueBorder(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                _renderSection(title: '병원', value: get_HSP_TP_Cd),
                const CustomDivider(),
                _renderSection(title: '요청일자', value: REQ_DT.datetimeToString()),
                const CustomDivider(),
                _renderSection(title: '등록번호', value: PT_NO),
                const CustomDivider(),
                _renderSection(title: '환자명', value: PT_NM),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _renderVerticalSection({required String title, required String value}) {
    final theme = ref.watch(themeServiceProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.typo.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            value,
            style: theme.typo.subtitle1,
          ),
        ],
      ),
    );
  }

  //맨 위 내용
  _renderFrontSection() {
    final theme = ref.watch(themeServiceProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '아래환자가 수술장면 촬영요청을 신청하여 알려드립니다.',
          style: theme.typo.subtitle1,
        ),
        const SizedBox(
          height: 5,
        ),
        Text('촬영 허락 또는 거부사유를 기입하여 주시기 바랍니다.', style: theme.typo.subtitle1),
        const SizedBox(
          height: 5,
        ),
        Text(
          '촬영을 거부하려는 경우 수술을 하기 전 반드시 촬영을 요청한 환자나 환자보호자에게 촬영거부사유를 설명해야 합니다. (의료법 38조의 2)',
          style: theme.typo.subtitle1.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  _renderSection({required String title, required String value}) {
    final theme = ref.watch(themeServiceProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: theme.typo.subtitle1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              value,
              style: theme.typo.subtitle1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _AgreeNoWidget extends ConsumerStatefulWidget {
  const _AgreeNoWidget(
      {required this.agreeNoValue, required this.onChanged, Key? key})
      : super(key: key);
  final void Function(int? value) onChanged;
  final int? agreeNoValue;

  @override
  ConsumerState<_AgreeNoWidget> createState() => _AgreeNoWidgetState();
}

class _AgreeNoWidgetState extends ConsumerState<_AgreeNoWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeServiceProvider);

    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          '동의안함을 선택하셨습니다. 아래 항목에서 사유를 선택해주세요.',
          style: theme.typo.headline4.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomKeyValueBorder(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _renderRadioTile(
                  title: '응급환자를 수술하는 경우',
                  value: 1,
                  groupValue: widget.agreeNoValue,
                  onChanged: widget.onChanged,
                ),
                _renderRadioTile(
                  title: '생명에 위협이 되거나 신체기능의 장애를 초래하는 질환을 가진 경우',
                  value: 2,
                  groupValue: widget.agreeNoValue,
                  onChanged: widget.onChanged,
                ),
                _renderRadioTile(
                  title: '상급종합병원 지정 기준에서 정하는 전문 진료 질병군에 해당하는 수술을 하는 경우',
                  value: 3,
                  groupValue: widget.agreeNoValue,
                  onChanged: widget.onChanged,
                ),
                _renderRadioTile(
                  title: '전공의의 수련을 현저히 저해할 우려가 있다고 판단하는 경우',
                  value: 4,
                  groupValue: widget.agreeNoValue,
                  onChanged: widget.onChanged,
                ),
                _renderRadioTile(
                  title: '수술 시행 직전 촬영이 기술적으로 어려운 시점에 환자나 보호자가 촬영을 요청하는 경우',
                  value: 5,
                  groupValue: widget.agreeNoValue,
                  onChanged: widget.onChanged,
                ),
                _renderRadioTile(
                  title: '천재지변, 통신장애, 사이버 공격 기타 불가항력적 사유로 촬영이 불가능한 경우',
                  value: 6,
                  groupValue: widget.agreeNoValue,
                  onChanged: widget.onChanged,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  _renderRadioTile(
      {required String title,
      required int? groupValue,
      required int value,
      required Function(int? value) onChanged}) {
    final theme = ref.watch(themeServiceProvider);

    return RadioListTile(
      title: Text(
        title,
        style: theme.typo.subtitle1,
      ),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      fillColor:
          MaterialStateColor.resolveWith((states) => theme.color.primary),
    );
  }
}
