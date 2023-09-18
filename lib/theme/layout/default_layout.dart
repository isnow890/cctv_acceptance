import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../router/provider/go_router_provider.dart';
import '../foundation/app_theme.dart';
import '../provider/theme_provider.dart';

class DefaultLayout extends ConsumerWidget {
  final Widget child;

  final Widget? title;

  final bool canBack;

  final ScrollController? scrollController;
  final bool? tabToHideAppbar;
  final bool useSliver;

  final Widget? bottomSheet;

  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? centerTitle;
  final List<Widget>? actions;

  final Future<void> Function()? onRefreshAndError;
  final List<String>? appBarBottomList;

  DefaultLayout({
    this.bottomSheet,
    this.scrollController,
    required this.useSliver,
    Key? key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.centerTitle,
    this.actions,
    this.onRefreshAndError,
    this.appBarBottomList,
    this.tabToHideAppbar,
    this.canBack = false,
  }) : super(key: key);

  bool hideAppbar = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeServiceProvider);

    return _renderScaffold(theme, context);
  }

  _renderScaffold(AppTheme theme, BuildContext context) {
    //

    // AppBar appBar = _renderAppbar(theme);
    // var appBarHeight = appBar.preferredSize.height;


    return Scaffold(


      // resizeToAvoidBottomInset: false,
      bottomSheet: bottomSheet,
      // bottomSheet: SafeArea(
      //   child: Padding(
      //     padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      //   ),
      // ),
      // backgroundColor: theme.color.surface,
      backgroundColor: theme.color.surface,
      body: useSliver
          ? CustomScrollView(
        // reverse: true,
        controller: scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          title == null
              ? const SliverToBoxAdapter()
              : _renderSliverAppbar(theme),
          child,
          SliverPadding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
          // SliverToBoxAdapter(
          //   child: Container(
          //     height: MediaQuery.of(context).viewInsets.bottom,
          //   ),
          // )
        ],
      )
          : child,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }

  _renderSliverAppbar(AppTheme theme) {
    return SliverAppBar(
      expandedHeight: 50.0,
      //SliverAppBar 영역을 고정시킨다. default false
      // pinned: true,
      // AppBar가 하단 List 내렸을 때 바로 보여야 한다 -> true
      // List를 최상단으로 올렸을 때만 나와야 한다. -> false
      floating: true,
      backgroundColor: theme.color.surface,
      leading: !canBack
          ? null
          : IconButton(
        icon: Icon(Icons.arrow_back, color: theme.color.text),
        onPressed: () {
          BuildContext? context = navigatorKey.currentContext;

          Navigator.of(context!).pop();
        },
      ),
      iconTheme: IconThemeData(color: theme.color.onPrimary),
      // backgroundColor: theme.color.primary,
      centerTitle: centerTitle ?? true,
      //앱바가 튀어나오도록 보이게끔
      elevation: 0,
      title: title,
      // title: Text(
      //   widget.title!,
      //   style: theme.typo.headline6,
      //   // style: theme.typo.headline6.copyWith(
      //   //   color: theme.color.onPrimary,
      //   // ),
      // ),
      actions: actions,
      titleSpacing: 0,
      bottom: appBarBottomList == null
          ? null
          : PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          color: theme.color.surface,
          child: TabBar(
            indicatorPadding: EdgeInsets.zero,
            tabs: List.generate(
              appBarBottomList!.length,
                  (index) => Tab(
                text: appBarBottomList![index],
              ),
            ),
            // 5
            labelColor: theme.color.primary,
            // 6
            unselectedLabelColor: theme.color.subtext,
            labelStyle:
            theme.typo.body1.copyWith(fontWeight: FontWeight.bold),

            indicator: UnderlineTabIndicator(
              borderSide:
              BorderSide(width: 2, color: theme.color.primary),
            ),
          ),
        ),
      ),
    );
  }

  _renderAppbar(AppTheme theme) {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: theme.color.surface,
        leading: !canBack
            ? null
            : IconButton(
          icon: Icon(Icons.arrow_back, color: theme.color.text),
          onPressed: () {
            BuildContext? context = navigatorKey.currentContext;
            Navigator.of(context!).pop();
          },
        ),
        iconTheme: IconThemeData(color: theme.color.onPrimary),
        // backgroundColor: theme.color.primary,
        centerTitle: centerTitle ?? true,
        //앱바가 튀어나오도록 보이게끔
        elevation: 0,
        title: title,
        // title: Text(
        //   widget.title!,
        //   style: theme.typo.headline6,
        //   // style: theme.typo.headline6.copyWith(
        //   //   color: theme.color.onPrimary,
        //   // ),
        // ),
        actions: actions,
        titleSpacing: 0,
        bottom: appBarBottomList == null
            ? null
            : PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: Container(
            color: theme.color.surface,
            child: TabBar(
              indicatorPadding: EdgeInsets.zero,
              tabs: List.generate(
                appBarBottomList!.length,
                    (index) => Tab(
                  text: appBarBottomList![index],
                ),
              ),
              // 5
              labelColor: theme.color.primary,
              // 6
              unselectedLabelColor: theme.color.subtext,
              labelStyle:
              theme.typo.body1.copyWith(fontWeight: FontWeight.bold),

              indicator: UnderlineTabIndicator(
                borderSide:
                BorderSide(width: 2, color: theme.color.primary),
              ),
            ),
          ),
        ),
      );
    }
  }
}
