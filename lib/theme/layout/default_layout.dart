import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../foundation/app_theme.dart';
import '../provider/theme_provider.dart';

class DefaultLayout extends ConsumerStatefulWidget {
  final Widget child;

  final Widget? title;

  final bool canBack;

  final ScrollController? scrollController;
  final bool? tabToHideAppbar;
  final bool useSliver;

  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool? centerTitle;
  final List<Widget>? actions;

  final Future<void> Function()? onRefreshAndError;
  final List<String>? appBarBottomList;

  const DefaultLayout({
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

  @override
  ConsumerState<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends ConsumerState<DefaultLayout> {
  bool hideAppbar = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeServiceProvider);

    return _renderScaffold(theme);
  }

  _renderScaffold(AppTheme theme) {
    //

    // AppBar appBar = _renderAppbar(theme);
    // var appBarHeight = appBar.preferredSize.height;

    return Scaffold(
      // backgroundColor: theme.color.surface,
      backgroundColor: theme.color.surface,
      body: widget.useSliver
          ? CustomScrollView(
              controller: widget.scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                widget.title == null
                    ? const SliverToBoxAdapter()
                    : _renderSliverAppbar(theme),
                SliverToBoxAdapter(
                  child: widget.child,
                ),
              ],
            )
          : widget.child,
      bottomNavigationBar: widget.bottomNavigationBar,
      floatingActionButton: widget.floatingActionButton,
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
      leading: !widget.canBack
          ? null
          : IconButton(
              icon: Icon(Icons.arrow_back, color: theme.color.text),
              onPressed: () => Navigator.of(context).pop(),
            ),
      iconTheme: IconThemeData(color: theme.color.onPrimary),
      // backgroundColor: theme.color.primary,
      centerTitle: widget.centerTitle ?? true,
      //앱바가 튀어나오도록 보이게끔
      elevation: 0,
      title: widget.title,
      // title: Text(
      //   widget.title!,
      //   style: theme.typo.headline6,
      //   // style: theme.typo.headline6.copyWith(
      //   //   color: theme.color.onPrimary,
      //   // ),
      // ),
      actions: widget.actions,
      titleSpacing: 0,
      bottom: widget.appBarBottomList == null
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                color: theme.color.surface,
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  tabs: List.generate(
                    widget.appBarBottomList!.length,
                    (index) => Tab(
                      text: widget.appBarBottomList![index],
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
    if (widget.title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: theme.color.surface,
        leading: !widget.canBack
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back, color: theme.color.text),
                onPressed: () => Navigator.of(context).pop(),
              ),
        iconTheme: IconThemeData(color: theme.color.onPrimary),
        // backgroundColor: theme.color.primary,
        centerTitle: widget.centerTitle ?? true,
        //앱바가 튀어나오도록 보이게끔
        elevation: 0,
        title: widget.title,
        // title: Text(
        //   widget.title!,
        //   style: theme.typo.headline6,
        //   // style: theme.typo.headline6.copyWith(
        //   //   color: theme.color.onPrimary,
        //   // ),
        // ),
        actions: widget.actions,
        titleSpacing: 0,
        bottom: widget.appBarBottomList == null
            ? null
            : PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  color: theme.color.surface,
                  child: TabBar(
                    indicatorPadding: EdgeInsets.zero,
                    tabs: List.generate(
                      widget.appBarBottomList!.length,
                      (index) => Tab(
                        text: widget.appBarBottomList![index],
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
