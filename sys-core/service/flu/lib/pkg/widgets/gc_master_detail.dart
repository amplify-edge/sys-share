import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:sys_core/pkg/i18n/sys_core_localizations.dart';
import 'package:sys_core/sys_core.dart';

class NewGetCourageMasterDetail<T extends GeneratedMessage,
    U extends GeneratedMessage> extends StatefulWidget {
  /// [routeWithIdPlaceholder] is the actual route where the
  /// master-detail-view is located at e.g. /myneeds/orgs/:id
  final String routeWithIdPlaceholder;

  /// [parentId] is the id parsed from the route, can be null
  final String parentId;

  /// [childId] is the childId parsed from the route, can be null
  final String childId;

  /// [detailsBuilder] is used to build the details view
  ///[context] is the BuildContext
  ///[parentId] is the parent id of selected child id
  ///[childId] is the actual selected id
  ///[isFullScreen] defines if the details view is showed as fullscreen e.g.
  ///on mobile. With this flag we can disable the back button on master
  ///detail view, cause the master will have the back button.
  ///BUT on fullscreen it should show the back button of the details view.
  final Widget Function(BuildContext context, String parentId, String childId,
      bool isFullScreen) detailsBuilder;

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

  final List<U> Function(T item) itemChildren;

  final List<Widget> Function(U itemChild, String id) childBuilder;

  const NewGetCourageMasterDetail(
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
      @required this.itemChildren,
      @required this.childBuilder,
      this.searchFunction,
      this.isLoadingMoreItems = false,
      this.fetchNextItems,
      this.hasMoreItems = false,
      this.resetSearchFunction,
      this.childId = '',
      this.parentId = ''})
      : super(key: key);

  @override
  _NewGetCourageMasterDetailState<T, U> createState() =>
      _NewGetCourageMasterDetailState<T, U>();
}

class _NewGetCourageMasterDetailState<T extends GeneratedMessage,
    U extends GeneratedMessage> extends State<NewGetCourageMasterDetail<T, U>> {
  ScrollController _scrollController;
  TextEditingController _searchTextCtrl;
  String _selectedParentId;
  String _previouslySelectedParentId;

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
    _previouslySelectedParentId = widget.parentId;
    _selectedParentId = widget.parentId;
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
    bool isItemSelected =
        _selectedParentId.isNotEmpty && widget.childId.isNotEmpty;
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
                      child: _previouslySelectedParentId != _selectedParentId
                          ? widget.detailsBuilder(
                              context,
                              _previouslySelectedParentId,
                              widget.childId,
                              !showMaster)
                          : widget.detailsBuilder(context, _selectedParentId,
                              widget.childId, !showMaster),
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
                      ))
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
                          _selectedParentId.isEmpty &&
                          widget.childId.isEmpty),
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
                    ExpansionTile(
                        collapsedBackgroundColor:
                            Theme.of(context).dialogBackgroundColor,
                        maintainState: false,
                        initiallyExpanded:
                            item.getField(1).toString() == _selectedParentId
                                ? true
                                : false,
                        onExpansionChanged: (bool t) {
                          setState(() {
                            _selectedParentId = item.getField(1).toString();
                          });
                        },
                        leading: widget.imageBuilder != null
                            ? CircleAvatar(
                                radius: 20,
                                backgroundImage: MemoryImage(
                                  Uint8List.fromList(widget.imageBuilder(item)),
                                ),
                              )
                            : Container(),
                        title: Container(
                          height: 56,
                          child: Row(
                            children: <Widget>[
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
                                                _selectedParentId
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
                        children: [
                          for (var itemChild in widget.itemChildren(item))
                            InkWell(
                              child: Container(
                                height: 56,
                                child: Row(
                                  children: widget.childBuilder(
                                      itemChild, widget.childId),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedParentId =
                                      item.getField(1).toString();
                                });
                                _pushDetailsRoute(
                                    widget
                                        .itemChildren(item)[widget
                                            .itemChildren(item)
                                            .indexOf(itemChild)]
                                        .getField(1)
                                        .toString(),
                                    _selectedParentId,
                                    context);
                              },
                            )
                        ]),
                if (widget.hasMoreItems || widget.isLoadingMoreItems)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                if (widget.items != null && widget.items.isEmpty)
                  (widget.noItemsAvailable == null)
                      ? Center(child: Text(sysCoreTranslate('noItemsAvailable')))
                      : widget.noItemsAvailable
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pushDetailsRoute<T, U>(
      String newChildId, String newParentId, BuildContext context) {
    bool withTransition = !isTablet(context);
    var routeSettings = RouteSettings(
      name: widget.routeWithIdPlaceholder
          .replaceAll(":id", "$newChildId")
          .replaceAll(":orgId", newParentId),
    );
    print(routeSettings.name);
    var newMasterDetailView = NewGetCourageMasterDetail(
      items: widget.items,
      labelBuilder: widget.labelBuilder,
      noItemsSelected: widget.noItemsSelected,
      detailsBuilder: widget.detailsBuilder,
      parentId: newParentId,
      childId: newChildId,
      routeWithIdPlaceholder: widget.routeWithIdPlaceholder,
      enableSearchBar: widget.enableSearchBar,
      masterAppBarTitle: widget.masterAppBarTitle,
      disableBackButtonOnNoItemSelected:
          widget.disableBackButtonOnNoItemSelected,
      noItemsAvailable: widget.noItemsAvailable,
      imageBuilder: widget.imageBuilder,
      itemChildren: widget.itemChildren,
      childBuilder: widget.childBuilder,
      searchFunction: widget.searchFunction,
      resetSearchFunction: widget.resetSearchFunction,
    );
    /*
      We are not using flutter Modular for pushing the route here
      since we need dynamic transitions. For the >tablet view
      there shouldn't be a transition, since on each selection the
      view is pushed again (to be able to change the omnibox).

      for small devices there should be a transition to look normal
    */
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
