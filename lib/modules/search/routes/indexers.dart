import 'package:flutter/material.dart';
import 'package:lunasea/core.dart';
import '../../search.dart';

class Search extends StatefulWidget {
    static const ROUTE_NAME = '/search';

    @override
    State<Search> createState() =>  _State();
}

class _State extends State<Search> {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: Database.indexersBox.listenable(),
        builder: (context, indexerBox, widget) => Scaffold(
            key: _scaffoldKey,
            appBar: _appBar,
            drawer: _drawer,
            body: indexerBox.values.length > 0
                ? _body
                : _nothing,
        ),
    );

    Widget get _appBar => LSAppBar(title: 'Search');

    Widget get _drawer => LSDrawer(page: 'search');

    Widget get _body => LSListView(
        children: <Widget>[..._indexerList],
        padBottom: true,
    );

    List get _indexerList {
        List list = List.generate(
            Database.indexersBox.length,
            (index) => SearchIndexerTile(
                indexer: Database.indexersBox.getAt(index),
                index: index,
            ),
        );
        list.sort((a,b) => (a.indexer as IndexerHiveObject).displayName.compareTo((b.indexer as IndexerHiveObject).displayName));
        return list;
    }

    Widget get _nothing => LSNotEnabled('Search');
}
