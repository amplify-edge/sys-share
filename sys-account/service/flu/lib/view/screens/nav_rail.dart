import 'package:flutter/material.dart';

const _tabletSpacingVertical = 15.0;
const _tabletSpacingHorizontial = 10.0;

class AccountNavRail extends StatelessWidget {
  final Widget drawerHeader;
  final FloatingActionButton floatingActionButton;
  final ValueChanged<int> onPressed;
  final int currentIndex;
  final Widget body;
  final Widget title;
  final List<TabItem> tabs;
  final WidgetBuilder drawerHeaderBuilder, drawerFooterBuilder;
  final Color bottomNavigationBarColor;
  final double tabletBreakpoint, desktopBreakpoint, minHeight, drawerWidth;
  final List<Widget> actions;
  final BottomNavigationBarType bottomNavigationBarType;
  final Color bottomNavigationBarSelectedColor,
      bottomNavigationBarUnselectedColor;
  final bool isDense;

  AccountNavRail(
      {Key key,
      this.floatingActionButton,
      this.body,
      this.title,
      @required this.currentIndex,
      @required this.tabs,
      @required this.onPressed,
      this.drawerHeaderBuilder,
      this.drawerFooterBuilder,
      this.bottomNavigationBarColor,
      this.tabletBreakpoint = 768.0,
      this.desktopBreakpoint = 1400,
      this.minHeight = 400.0,
      this.drawerWidth = 304.0,
      this.actions,
      this.bottomNavigationBarType,
      this.bottomNavigationBarSelectedColor,
      this.bottomNavigationBarUnselectedColor,
      this.isDense = false,
      this.drawerHeader})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context),
      child: LayoutBuilder(builder: (context, dimens) {
        final _direction = Directionality.of(context);
        final isRtl = _direction == TextDirection.rtl;

        //DESKTOP
        if (dimens.maxWidth >= this.desktopBreakpoint &&
            dimens.maxHeight > this.minHeight) {
          return Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: <Widget>[
                _buildDrawer(context, true),
                Expanded(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned.fill(
                        child: Scaffold(body: body),
                      ),
                      if (this.floatingActionButton != null) ...[
                        Positioned(
                          top: kToolbarHeight - kToolbarHeight / 2,
                          right: isRtl ? null : kToolbarHeight / 2,
                          left: !isRtl ? null : kToolbarHeight / 2,
                          child: floatingActionButton,
                          width: 50,
                          height: 50,
                        )
                      ]
                    ],
                  ),
                )
              ],
            ),
          );
        }

        //TABLET
        if (dimens.maxWidth >= this.tabletBreakpoint &&
            dimens.maxHeight > this.minHeight) {
          return Scaffold(
            body: Row(
              children: [
                Column(
                  children: [
                    if (this.floatingActionButton != null) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: _tabletSpacingVertical,
                          horizontal: _tabletSpacingHorizontial,
                        ),
                        child: floatingActionButton,
                      )
                    ],
                    for (var tab in this.tabs) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: _tabletSpacingVertical,
                          horizontal: _tabletSpacingHorizontial,
                        ),
                        child: _buildTab(
                            selected: (currentIndex == this.tabs.indexOf(tab)),
                            context: context,
                            item: tab),
                      ),
                    ]
                  ],
                ),
                Expanded(
                  child: body,
                ),
              ],
            ),
          );
        }

        //PHONE
        return Scaffold(
          body: body,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          bottomNavigationBar: BottomAppBar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  for (var tab in this.tabs) ...[
                    InkWell(
                      onTap: () {
                        onPressed(tabs.indexOf(tab));
                        tab.onTap();
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconTheme(
                                data: IconThemeData(
                                  color: (currentIndex == tabs.indexOf(tab))
                                      ? bottomNavigationBarSelectedColor
                                      : bottomNavigationBarUnselectedColor,
                                ),
                                child: tab.icon),
                            DefaultTextStyle(
                                style: TextStyle(
                                  color: (currentIndex == tabs.indexOf(tab))
                                      ? bottomNavigationBarSelectedColor
                                      : bottomNavigationBarUnselectedColor,
                                ),
                                child: tab.title)
                          ],
                        ),
                      ),
                    )
                  ],
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDrawer(BuildContext context, bool showTabs) {
    // got the specs from here: https://material.io/components/lists#specs
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (drawerHeader != null) ...[drawerHeader],
            if (drawerHeaderBuilder != null) ...[
              drawerHeaderBuilder(context),
            ],
            if (showTabs) ...[
              for (var tab in tabs) ...[
                InkWell(
                  child: Container(
                    height: 56,
                    child: Row(
                      //selected: currentIndex == tabs.indexOf(tab),
                      children: <Widget>[
                        SizedBox(width: 16),

                        //logic taken from ListTile
                        IconTheme.merge(
                            data: IconThemeData(
                                color: (currentIndex != tabs.indexOf(tab)
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).accentColor)),
                            child: tab?.icon),
                        SizedBox(width: 16),
                        //logic taken from ListTile
                        DefaultTextStyle(
                          child: tab?.title,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .merge(TextStyle(
                                color: (currentIndex != tabs.indexOf(tab)
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).accentColor),
                              )),
                        ),
                        SizedBox(width: 50),
                      ],
                    ),
                  ),
                  onTap: () {
                    onPressed(tabs.indexOf(tab));
                    tab.onTap();
                  },
                ),
              ]
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTab({
    bool selected,
    BuildContext context,
    TabItem item,
  }) {
    final _theme = Theme.of(context);
    final _isDark = _theme.brightness == Brightness.dark;
    final _color = selected
        ? _isDark
            ? Colors.tealAccent[200]
            : _theme.primaryColor
        : Colors.grey;

    final _iconTheme = IconThemeData(
      color: _color,
      size: _theme.iconTheme.size,
      opacity: _theme.iconTheme.opacity,
    );

    final _icon = Align(
      alignment: Alignment.topCenter,
      heightFactor: 1.0,
      child: IconTheme(
        data: _iconTheme,
        child: item.icon,
      ),
    );

    if (isDense) {
      return IconButton(
        onPressed: () {
          onPressed(tabs.indexOf(item));
          item.onTap();
        },
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: _icon,
        ),
      );
    }
    return IconButton(
      iconSize: 60,
      onPressed: () {
        onPressed(tabs.indexOf(item));
        item.onTap();
      },
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _icon,
          Container(height: 4.0),
          DefaultTextStyle(
            style: TextStyle(color: _color),
            child: item?.title,
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final Text title;
  final Icon icon;
  final Function onTap;

  const TabItem({
    Key key,
    @required this.icon,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon;
  }
}
