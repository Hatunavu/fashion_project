import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';
import 'package:suplo_project_8_12_2020/app/theme/collection/components/collection.list.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/product.widget.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';

class CollectionWidget extends StatefulWidget {
  CollectionModel collection;
  CollectionWidget({this.collection});

  @override
  _CollectionWidgetState createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  ScrollController _scrollController = ScrollController();
  String _viewType = 'grid';
  _switchView(String view) {
    setState(() {
      _viewType = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: _buildHeader(),
      body: _viewType == 'grid'
          ? builGrid(widget.collection.products)
          : buildList(widget.collection.products),
    );
  }

  Widget _buildHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      centerTitle: true,
      titleSpacing: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Color(0xFF333333).withOpacity(.6),
        ),
      ),
      title: Container(
        height: 35,
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 243, 243, 1),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  CustomIcons.icon_search,
                  color: Colors.black45,
                  size: 18,
                ),
              ),
              Expanded(
                  child: Text(
                'Search you\'re looking for',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ))
            ],
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 10, top: 10, bottom: 10),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 1, color: Color(0xFF333333).withOpacity(.2)))),
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: FlatButton(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Icon(MdiIcons.sortAlphabeticalAscending,
                size: 18, color: Color(0xFF333333).withOpacity(.6)),
            padding: const EdgeInsets.all(0),
            onPressed: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 15, top: 10, bottom: 10),
          padding: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 1, color: Color(0xFF333333).withOpacity(.2)))),
          alignment: Alignment.center,
          width: 30,
          height: 30,
          child: IconButton(
            icon: Icon(MdiIcons.filter,
                size: 17, color: Color(0xFF333333).withOpacity(.6)),
            padding: const EdgeInsets.all(0),
            onPressed: () {},
          ),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(35),
        child: Column(
          children: [
            Container(
              child: Divider(
                height: 1,
                color: Color(0xFF333333).withOpacity(.1),
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
            ),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                      child: Container(
                    constraints: BoxConstraints(minWidth: 110),
                    height: 30,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 15),
                    child: Text('Product',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                  )),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 8, bottom: 8),
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 1,
                                      color:
                                          Color(0xFF333333).withOpacity(.2)))),
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: FlatButton(
                              color: Colors.white,
                              padding: const EdgeInsets.all(0),
                              onPressed: () {
                                _switchView('grid');
                              },
                              child: Icon(MdiIcons.viewGrid,
                                  size: 18,
                                  color: _viewType == 'grid'
                                      ? Colors.black
                                      : Colors.grey)),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15, top: 8, bottom: 8),
                          padding: EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              border: Border(
                                  left: BorderSide(
                                      width: 1,
                                      color:
                                          Color(0xFF333333).withOpacity(.2)))),
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          child: FlatButton(
                              padding: const EdgeInsets.all(0),
                              color: Colors.white,
                              onPressed: () {
                                _switchView('list');
                              },
                              child: Icon(MdiIcons.formatListBulletedSquare,
                                  size: 20,
                                  color: _viewType == 'list'
                                      ? Colors.black
                                      : Colors.grey)),
                        )
                      ])
                ]),
          ],
        ),
      ),
    );
  }

  Widget builGrid(
    List<Products> products,
    /*double widthContent*/
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15),
      child: CustomScrollView(
        controller: _scrollController,
        // shrinkWrap: true,
        scrollDirection: Axis.vertical,
        //physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.54 / 3,
              //mainAxisSpacing: 8
            ),
            delegate: SliverChildListDelegate(products
                .map((product) => InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductWidget(
                                  products: product,
                                )));
                      },
                      child: CollectionCard(
                        product: product,
                      ),
                    ))
                .toList()),
          )
        ],
      ),
    );
  }

  Widget buildList(List<Products> products) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: products.length,
        padding: EdgeInsets.only(top: 10, bottom: 30),
        // addAutomaticKeepAlives: true,
        scrollDirection: Axis.vertical,
        // physics:AlwaysScrollableScrollPhysics(),

        itemBuilder: (context, index) {
          return (index == products.length - 1)
              ? Column(
                  children: products
                      .map((e) => InkWell(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ProductWidget(
                                        products: e,
                                      )));
                            },
                            child: CollectionList(
                              products: e,
                            ),
                          ))
                      .toList()
                  // [
                  //   CollectionList(products: products[index],)
                  // ],
                  )
              : Container();
        });
  }
}
