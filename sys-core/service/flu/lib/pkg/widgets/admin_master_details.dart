import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:sys_core/pkg/i18n/sys_core_localizations.dart';
import 'package:sys_core/sys_core.dart';

class AdminMasterDetails<T extends GeneratedMessage> extends StatefulWidget {
  /// [routeWithIdPlaceholder] is the actual route where the
  /// master-detail-view is located at e.g. /myneeds/orgs/:id
  final String routeWithIdPlaceholder;

  /// [id] is the id parsed from the route, can be null
  final String id;

  /// [detailsBuilder] is used to build the details view
  ///[context] is the BuildContext
  ///[parentId] is the parent id of selected child id
  ///[childId] is the actual selected id
  ///[isFullScreen] defines if the details view is showed as fullscreen e.g.
  ///on mobile. With this flag we can disable the back button on master
  ///detail view, cause the master will have the back button.
  ///BUT on fullscreen it should show the back button of the details view.
  final Widget Function(
      BuildContext context, String widgetId, bool isFullScreen) detailsBuilder;

  ///[items] is the list of items which are displayed on the master view
  final List<T> items;

  ///[labelBuilder] returns the label for the current item
  final String Function(T item) labelBuilder;

  ///[imageBuilder] returns the url of the icon for the current item
  final List<int> Function(T item) imageBuilder;

  /// [noItemsSelected] is the place holder widget for the details view if
  /// nothing was selected
  final Widget noItemsSelected;

  /// [noItemsAvailable] shows up if items are empty
  final Widget noItemsAvailable;

  /// [masterAppBarTitle] is used to customize the master app bar title
  final Widget masterAppBarTitle;

  /// warning just for showcase right now, not real search implementation here
  final bool enableSearchBar;

  /// searchbar functionality here
  final Future<void> Function(String) searchFunction;

  // reset searchbar function
  final Future<void> Function() resetSearchFunction;

  ///[disableBackButtonOnNoItemSelected] if its true and id == -1 the
  ///back button of the masters app bar will be disabled
  final bool disableBackButtonOnNoItemSelected;

  final bool hasMoreItems;

  final bool isLoadingMoreItems;

  final Future<void> Function() fetchNextItems;

  const AdminMasterDetails(
      {Key key,
      @required this.detailsBuilder,
      @required this.routeWithIdPlaceholder,
      @required this.items,
      @required this.labelBuilder,
      this.noItemsAvailable,
      this.imageBuilder,
      this.masterAppBarTitle,
      this.enableSearchBar = false,
      this.noItemsSelected,
      this.disableBackButtonOnNoItemSelected = true,
      this.searchFunction,
      this.isLoadingMoreItems = false,
      this.fetchNextItems,
      this.hasMoreItems = false,
      this.resetSearchFunction,
      this.id = ''})
      : super(key: key);

  @override
  _AdminMasterDetailsState<T> createState() => _AdminMasterDetailsState<T>();
}

class _AdminMasterDetailsState<T extends GeneratedMessage>
    extends State<AdminMasterDetails<T>> {
  ScrollController _scrollController;
  TextEditingController _searchTextCtrl;

  _scrollListener() async {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      if (widget.fetchNextItems != null) {
        await widget.fetchNextItems();
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchTextCtrl = TextEditingController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchTextCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobilePhone = !isTablet(context);
    bool isItemSelected = widget.id.isNotEmpty;
    bool showMaster = isMobilePhone && !isItemSelected || !isMobilePhone;
    bool showDetails = isMobilePhone && isItemSelected || !isMobilePhone;

    return Material(
      child: Container(
        child: Row(
          children: <Widget>[
            if (showMaster)
              (isMobilePhone) // take the whole width
                  ? Expanded(
                      child: _getMasterView(context),
                    )
                  : _getMasterView(context),
            if (showDetails)
              (isItemSelected)
                  ? Expanded(
                      flex: 3,
                      child: widget.detailsBuilder(
                          context, widget.id, !showMaster),
                    )
                  : Expanded(
                      flex: 3,
                      child: Column(
                        children: <Widget>[
                          AppBar(
                            leading: Container(),
                          ),
                          Expanded(
                              child: widget.noItemsSelected ??
                                  Center(child: Text("No items selected."))),
                        ],
                      ),
                    ),
          ],
        ),
      ),
    );
  }

  Widget _getMasterView(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AppBar(
                  //disable back button if no item is selected...
                  automaticallyImplyLeading:
                      !(widget.disableBackButtonOnNoItemSelected &&
                          widget.id.isEmpty),
                  title: widget.masterAppBarTitle ?? Container(),
                ),
                if (widget.enableSearchBar)
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _searchTextCtrl,
                          decoration: InputDecoration.collapsed(
                            hintText: sysCoreTranslate('search'),
                          ),
                          onChanged: (text) async {
                            if (text.isNotEmpty && text.length > 2) {
                              await widget.searchFunction(text);
                            } else if (text.isEmpty) {
                              await widget.resetSearchFunction();
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                if (widget.items != null)
                  for (var item in widget.items)
                    InkWell(
                      child: Container(
                        height: 56,
                        child: Row(
                          children: <Widget>[
                            widget.imageBuilder != null
                                ? CircleAvatar(
                                    radius: 20,
                                    backgroundImage: MemoryImage(
                                      Uint8List.fromList(
                                          widget.imageBuilder(item)),
                                    ),
                                  )
                                : Container(),
                            Expanded(
                              child: Text(
                                widget.labelBuilder(item),
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .merge(TextStyle(
                                      color: widget.items[widget.items
                                                      .indexOf(item)]
                                                  .getField(1)
                                                  .toString() !=
                                              widget.id
                                          ? Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .color
                                          : Theme.of(context).accentColor,
                                    )),
                              ),
                            ),
                            // SizedBox(width: 30),
                          ],
                        ),
                      ),
                      onTap: () {
                        _pushParentDetailsRoute(item.getField(1).toString(), context);
                      },
                    ),
                if (widget.hasMoreItems || widget.isLoadingMoreItems)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (widget.items != null && widget.items.isEmpty)
                  (widget.noItemsAvailable == null)
                      ? Center(
                          child: Text(sysCoreTranslate('noItemsAvailable')))
                      : widget.noItemsAvailable
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pushParentDetailsRoute<T>(String newParentId, BuildContext context) {
    bool withTransition = !isTablet(context);
    var routeSettings = RouteSettings(
      name: widget.routeWithIdPlaceholder.replaceAll(":id", "$newParentId"),
    );
    var newMasterDetailView = AdminMasterDetails(
      items: widget.items,
      labelBuilder: widget.labelBuilder,
      noItemsSelected: widget.noItemsSelected,
      detailsBuilder: widget.detailsBuilder,
      id: newParentId,
      routeWithIdPlaceholder: widget.routeWithIdPlaceholder,
      enableSearchBar: widget.enableSearchBar,
      masterAppBarTitle: widget.masterAppBarTitle,
      disableBackButtonOnNoItemSelected:
          widget.disableBackButtonOnNoItemSelected,
      noItemsAvailable: widget.noItemsAvailable,
      imageBuilder: widget.imageBuilder,
      searchFunction: widget.searchFunction,
      resetSearchFunction: widget.resetSearchFunction,
    );
    Navigator.of(context).push(
      (withTransition)
          ? MaterialPageRoute(
              builder: (context) {
                return newMasterDetailView;
              },
              settings: routeSettings)
          : PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  newMasterDetailView,
              settings: routeSettings),
    );
  }
}
