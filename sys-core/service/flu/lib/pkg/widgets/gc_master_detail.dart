import 'package:flutter/material.dart';
import 'package:sys_core/sys_core.dart';

class GetCourageMasterDetail<T> extends StatelessWidget {
  /// [routeWithIdPlaceholder] is the actual route where the
  /// master-detail-view is located at e.g. /myneeds/orgs/:id
  final String routeWithIdPlaceholder;

  /// [id] is the id parsed from the route, can be null
  final int id;

  /// [detailsBuilder] is used to build the details view
  ///[context] is the BuildContext
  ///[detailsId] is the actual selected id
  ///[isFullScreen] defines if the details view is showed as fullscreen e.g.
  ///on mobile. With this flag we can disable the back button on master
  ///detail view, cause the master will have the back button.
  ///BUT on fullscreen it should show the back button of the details view.
  final Widget Function(BuildContext context, int detailsId, bool isFullScreen) detailsBuilder;

  ///[items] is the list of items which are displayed on the master view
  final List<T> items;

  ///[labelBuilder] returns the label for the current item
  final String Function(T item) labelBuilder;

  ///[imageBuilder] returns the url of the icon for the current item
  final String Function(T item) imageBuilder;

  /// [noItemsSelected] is the place holder widget for the details view if
  /// nothing was selected
  final Widget noItemsSelected;

  /// [noItemsAvailable] shows up if items are empty
  final Widget noItemsAvailable;

  /// [masterAppBarTitle] is used to customize the master app bar title
  final Widget masterAppBarTitle;

  /// warning just for showcase right now, now real search implementation here
  final bool enableSearchBar;

  ///[disableBackButtonOnNoItemSelected] if its true and id == -1 the
  ///back button of the masters app bar will be disabled
  final bool disableBackButtonOnNoItemSelected;

  const GetCourageMasterDetail(
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
      this.id = -1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobilePhone = !isTablet(context);
    bool isItemSelected = id >= 0;
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
                      child: detailsBuilder(context, id, !showMaster),
                    )
                  : Expanded(
                      flex: 3,
                      child:
                          Column(
                            children: <Widget>[
                              AppBar(leading: Container(),),
                              Expanded(child: noItemsSelected?? Center(child: Text("No items selected."))),
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
                  automaticallyImplyLeading: !(disableBackButtonOnNoItemSelected && id == -1),
                  title: masterAppBarTitle ?? Container(),
                ),
                if (enableSearchBar)
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'Search Campaigns'),
                        ),
                      ),
                    ),
                  ),
                /*const SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    sliver: SliverFloatingBar(
                      elevation: 1.0,
                      floating: true,
                      pinned: true,
                      automaticallyImplyLeading: false,
                      title: TextField(
                        decoration:
                            InputDecoration.collapsed(hintText: 'Search Campaigns'),
                      ),
                    ),
                  ),*/
                for (var item in items)
                  InkWell(
                    child: Container(
                      height: 56,
                      child: Row(
                        children: <Widget>[
                          if (imageBuilder != null) ...[
                            SizedBox(width: 16),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: NetworkImage(
                                imageBuilder(item),
                              ),
                            ),
                          ],
                          SizedBox(width: 16),
                          //logic taken from ListTile
                          Text(
                            labelBuilder(item),
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .merge(TextStyle(
                                  color: items.indexOf(item) != id
                                      ? Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .color
                                      : Theme.of(context).accentColor,
                                )),
                          ),
                          SizedBox(width: 50),
                        ],
                      ),
                    ),
                    onTap: () {
                      _pushDetailsRoute(items.indexOf(item), context);
                    },
                  ),
                if (items.isEmpty)
                  (noItemsAvailable == null)
                      ? Center(child: Text("No items available."))
                      : noItemsAvailable
              ],
            ),
          ),
        ),
      ),
    );
  }

  _pushDetailsRoute(int newId, BuildContext context) {
    print(
        "_pushDetailsRoute newId: $newId, routeWithIdPlaceholder: ${routeWithIdPlaceholder}");
    bool withTransition = !isTablet(context);
    var routeSettings = RouteSettings(
      name: routeWithIdPlaceholder.replaceAll(":id", "$newId"),
    );
    var newMasterDetailView = GetCourageMasterDetail(
      items: items,
      labelBuilder: labelBuilder,
      noItemsSelected: noItemsSelected,
      detailsBuilder: detailsBuilder,
      id: newId,
      routeWithIdPlaceholder: routeWithIdPlaceholder,
      enableSearchBar: enableSearchBar,
      masterAppBarTitle: masterAppBarTitle,
      disableBackButtonOnNoItemSelected: disableBackButtonOnNoItemSelected,
      noItemsAvailable: noItemsAvailable,
      imageBuilder: imageBuilder
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
