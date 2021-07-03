import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers.dart';
import '../icons.dart';
import 'main_state_empty_widget.dart';
import 'main_state_error_widget.dart';
import 'my_progress_indicator.dart';

abstract class _MainStateData<T extends ConsumerStatefulWidget> extends ConsumerState<T> {
  /////Theme
  ThemeData get theme => Theme.of(context);

  TextTheme get textTheme => theme.textTheme;

  bool get isDarkTheme => theme.brightness == Brightness.dark;

  //////PageSize
  MediaQueryData get mediaQueryData => MediaQuery.of(context);

  Orientation get pageOrientation => mediaQueryData.orientation;

  bool get isPageOrientationLandScape => pageOrientation == Orientation.landscape;

  bool get isPageOrientationPortrait => pageOrientation == Orientation.portrait;

  Size get pageSize => mediaQueryData.size;

  double get pageHeight => pageSize.height;

  double get pageWidth => pageSize.width;
}

abstract class MainStateTemplate<T extends ConsumerStatefulWidget> extends _MainStateData<T> {
  List<Widget> bodyChildren = <Widget>[];

  @protected
  bool get emptyData => bodyChildren.isEmpty;

  List<Widget> get appBarActions => <Widget>[];

  List<Widget> get _appBarActionsWithProgress =>
      <Widget>[if (!emptyData && actionBarLoading) Container(margin: const EdgeInsets.all(8), height: 24, width: 24, child: const CupertinoActivityIndicator()) else ...appBarActions];

  String title = '';

  bool pageLoading = false;

  bool hideTopAdBanner = false;
  bool hideBottomAdBanner = false;
  Widget topBanner = const SizedBox();
  Widget bottomBanner = const SizedBox();

  bool actionBarLoading = false;
  Widget? appBarLeading;

  String noDataLabel = 'لايوجد بيانات';
  IconData noDataIcon = iconNoData;

  Object? error;
  StackTrace? stackTrace;

  bool showAppBar = true;

  Widget get appBarTitle {
    return Text(title, textDirection: getTextDirection(title));
  }

  //tab view
  List<Widget>? get tabs => null;
  bool isTabView = false;

  TabController? _tabController;

  // TabController? get tabController => _tabController;

  void setTabController(TabController tabController, {bool replace = false}) {
    if (replace) {
      _tabController = tabController;
    } else {
      _tabController ??= tabController;
    }
  }

  bool get _isValidTabBar => _isValidTabView && tabs != null && (tabs ?? []).length > 1;

  bool get _isValidTabView => isTabView && _tabController != null;

  Widget appBar(bool innerBoxIsScrolled) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      sliver: SliverAppBar(
        toolbarHeight: 50,
        elevation: 2,
        centerTitle: true,
        bottom: _isValidTabBar ? _buildAppBarBottom() : null,
        title: appBarTitle,
        leading: _buildAppBarLeading(),
        actions: _buildAppBarActions(),
        floating: true,
        snap: true,
        forceElevated: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  List<Widget> _buildAppBarActions() {
    return _appBarActionsWithProgress.map((e) {
      return Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(8),
        child: e,
      );
    }).toList();
  }

  Widget? _buildAppBarLeading() {
    if (appBarLeading != null) {
      return Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          topLeft: Radius.circular(14),
          bottomLeft: Radius.circular(14),
        ),
        child: appBarLeading,
      );
    }
    return null;
  }

  PreferredSizeWidget? _buildAppBarBottom() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(35),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        tabs: tabs!,
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @protected
  void startPageLoading() {
    setState(() => pageLoading = true);
  }

  @protected
  void stopPageLoading() {
    setState(() => pageLoading = false);
  }

  @protected
  void startActionBarLoading() {
    setState(() => actionBarLoading = true);
  }

  @protected
  void stopActionBarLoading() {
    setState(() => actionBarLoading = false);
  }

  @override
  @protected
  void initState() {
    super.initState();
    if (WidgetsBinding.instance != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => init());
    } else {
      init();
    }
  }

  void init() {}

  Future<void> onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    // ref.watch(appStateProvider);
    return Container(
      color: theme.scaffoldBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                if (showAppBar)
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    sliver: appBar(innerBoxIsScrolled),
                  )
                else
                  const SliverToBoxAdapter(child: SizedBox())
              ];
            },
            body: Builder(builder: (context) {
              return Center(child: isTabView == false ? buildBody(context) : buildTabView(context));
            }),
          ),
        ),
      ),
    );
  }

  Widget buildTabView(BuildContext context) {
    if (!pageLoading && error == null && emptyData) {
      return PageEmptyWidget(noDataIcon: noDataIcon, noDataLabel: noDataLabel);
    }

    if (pageLoading || !_isValidTabView) {
      return MyProgressIndicator(margin: EdgeInsets.symmetric(vertical: pageHeight / 3));
    }

    if (!pageLoading && error != null && emptyData) {
      return FutureErrorWidget(err: error);
    }

    int i = 0;
    return TabBarView(
      controller: _tabController,
      children: bodyChildren.map((e) {
        i++;
        return RefreshIndicator(
          displacement: 55,
          onRefresh: i == 1 ? onRefresh : () async {},
          child: e,
        );
      }).toList(),
    );
  }

  Widget buildBody(BuildContext context) {
    return RefreshIndicator(
      displacement: 55,
      onRefresh: onRefresh,
      child: CustomScrollView(
        slivers: <Widget>[
          if (showAppBar) SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),

          //top banner
          if (!hideTopAdBanner) SliverToBoxAdapter(child: topBanner),

          //show loading
          if (pageLoading)
            SliverToBoxAdapter(child: MyProgressIndicator(margin: EdgeInsets.symmetric(vertical: pageHeight / 3)))

          //no data
          else if (pageLoading == false && error == null && emptyData == true)
            SliverToBoxAdapter(child: PageEmptyWidget(margin: const EdgeInsets.all(20), noDataIcon: noDataIcon, noDataLabel: noDataLabel))
          // error
          else if (!pageLoading && error != null && emptyData)
            SliverToBoxAdapter(child: FutureErrorWidget(err: error))
          else
            ...bodyChildren,

          const SliverPadding(padding: EdgeInsets.only(top: 50)),

          //bottom banner
          if (!hideBottomAdBanner) SliverToBoxAdapter(child: bottomBanner),

          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }

  Future<void> loaderFunction(AsyncCallback fn) async {
    try {
      startPageLoading();
      startActionBarLoading();
      await fn();
    } catch (e, s) {
      error = e;
      stackTrace = s;
      logger.e(e, e, s);
    } finally {
      stopPageLoading();
      stopActionBarLoading();
    }
  }
}