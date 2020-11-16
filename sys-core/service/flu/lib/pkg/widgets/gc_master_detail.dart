import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:protobuf/protobuf.dart';
import 'package:sys_core/sys_core.dart';

class NewGetCourageMasterDetail<T extends GeneratedMessage>
    extends StatefulWidget {
  /// [routeWithIdPlaceholder] is the actual route where the
  /// master-detail-view is located at e.g. /myneeds/orgs/:id
  final String routeWithIdPlaceholder;

  /// [id] is the id parsed from the route, can be null
  final String id;

  /// [detailsBuilder] is used to build the details view
  ///[context] is the BuildContext
  ///[detailsId] is the actual selected id
  ///[isFullScreen] defines if the details view is showed as fullscreen e.g.
  ///on mobile. With this flag we can disable the back button on master
  ///detail view, cause the master will have the back button.
  ///BUT on fullscreen it should show the back button of the details view.
  final Widget Function(
      BuildContext context, String detailsId, bool isFullScreen) detailsBuilder;

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
  final List<T> Function(String) searchFunction;

  ///[disableBackButtonOnNoItemSelected] if its true and id == -1 the
  ///back button of the masters app bar will be disabled
  final bool disableBackButtonOnNoItemSelected;

  final List<Widget> Function(T item) childrenBuilder;

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
      this.childrenBuilder,
      this.searchFunction,
      this.id = ''})
      : super(key: key);

  @override
  _NewGetCourageMasterDetailState<T> createState() =>
      _NewGetCourageMasterDetailState<T>();
}

class _NewGetCourageMasterDetailState<T extends GeneratedMessage>
    extends State<NewGetCourageMasterDetail<T>> {
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
                          decoration: InputDecoration.collapsed(
                              hintText: 'Search Project / Campaign'),
                          onChanged: this.widget.searchFunction,
                        ),
                      ),
                    ),
                  ),
                for (var item in widget.items)
                InkWell(
                  child: Container(
                    height: 56,
                    child: Row(
                      children: <Widget>[
                        if (widget.imageBuilder != null) ...[
                          SizedBox(width: 16),
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: MemoryImage(
                              Uint8List.fromList(
                                  widget.imageBuilder(item)),
                            ),
                          ),
                        ],
                        SizedBox(width: 16),
                        //logic taken from ListTile
                        Expanded(
                          child: Text(
                            widget.labelBuilder(item),
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .merge(TextStyle(
                              color: widget.items[widget.items.indexOf(item)]
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
                        SizedBox(width: 30),
                      ],
                    ),
                  ),
                  onTap: () {
                    _pushDetailsRoute(
                        widget.items[widget.items.indexOf(item)].getField(1).toString(),
                        context);
                  },
                ),
                if (widget.items.isEmpty)
                  (widget.noItemsAvailable == null)
                      ? Center(child: Text("No items available."))
                      : widget.noItemsAvailable
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pushDetailsRoute(String newId, BuildContext context) {
    // print(
    //     "_pushDetailsRoute newId: $newId, routeWithIdPlaceholder: ${routeWithIdPlaceholder}");
    bool withTransition = !isTablet(context);
    var routeSettings = RouteSettings(
      name: widget.routeWithIdPlaceholder.replaceAll(":id", "$newId"),
    );
    var newMasterDetailView = NewGetCourageMasterDetail(
      items: widget.items,
      labelBuilder: widget.labelBuilder,
      noItemsSelected: widget.noItemsSelected,
      detailsBuilder: widget.detailsBuilder,
      id: newId,
      routeWithIdPlaceholder: widget.routeWithIdPlaceholder,
      enableSearchBar: widget.enableSearchBar,
      masterAppBarTitle: widget.masterAppBarTitle,
      disableBackButtonOnNoItemSelected:
          widget.disableBackButtonOnNoItemSelected,
      noItemsAvailable: widget.noItemsAvailable,
      imageBuilder: widget.imageBuilder,
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
