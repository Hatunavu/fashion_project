import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.provider.dart';
import 'package:suplo_project_8_12_2020/app/theme/cards/collection.card.dart';
import 'package:suplo_project_8_12_2020/app/theme/collection/components/collection.list.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/search/search.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/product/product.widget.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';
import 'package:http/http.dart' as http;

class CollectionWidget extends StatefulWidget {
  CollectionModel collection;
  CollectionWidget({this.collection});

  @override
  _CollectionWidgetState createState() => _CollectionWidgetState();
}

class _CollectionWidgetState extends State<CollectionWidget> {
  CollectionModel collectionModel;
  String idCollection;
  List<Products> products;

  int _pageNumber;
  bool _error;
  bool _loading;

  String url =
      'https://suplo-fashion.myharavan.com/collections/all?view=smb.json';

  List<Products> productsList;

  final List<String> sort = [
    'Mặc định',
    'Bán chạy',
    'Gía tăng dần',
    'Gía giảm dần',
    'Mới nhất',
    'Cũ nhất',
    'Từ A-Z',
    'Từ Z-A'
  ];
  ScrollController _scrollController = ScrollController();
  String _viewType = 'grid';
  _switchView(String view) {
    setState(() {
      _viewType = view;
    });
  }

  _scrollListener() {
    // debugger();
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _loading = true;
        if (_loading) {
          getCollection();
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    _pageNumber = 1;
    _error = false;
    _loading = true;
    productsList = [];
    _scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    getCollection();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  getCollection() async {
    // debugger();
    collectionModel = await CollectionProvider()
        .getModelFromApi('$url' + '&page=$_pageNumber');
    if (collectionModel.paginate.pages >= _pageNumber) {
      products = collectionModel.products;
      print(_pageNumber);
      setState(() {
        _loading = false;
        _pageNumber = _pageNumber + 1;
        productsList.addAll(products);
      });
      if (this.mounted) {
        setState(() {
          collectionModel = collectionModel;
        });
      }
    } else {
      setState(() {
        _loading = false;
      });
    }
  }

  // getCollection() async {
  //   await collectionBloc.fetchCollection(
  //       'https://suplo-fashion.myharavan.com/collections/all?view=smb.json');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 243, 243, 1),
      appBar: _buildHeader(),
      body: _viewType == 'grid'
          ? builGrid(productsList)
          : buildList(productsList),
    );
  }
  // StreamBuilder(
  //       stream: collectionBloc.allCollection,
  //       builder: (context, AsyncSnapshot<CollectionModel> snapshot) {
  //         // debugger();
  //         if (snapshot.hasData) {
  //           if (snapshot.data.products != null &&
  //               snapshot.data.products.length > 0) {
  //             collectionModel = snapshot.data;

  //             return Scaffold(
  //               backgroundColor: Color.fromRGBO(244, 243, 243, 1),
  //               appBar: _buildHeader(),
  //               body: _viewType == 'grid'
  //                   ? builGrid(widget.collection.products)
  //                   : buildList(widget.collection.products),
  //             );
  //           } else {
  //             return Scaffold(
  //               backgroundColor: Color.fromRGBO(244, 243, 243, 1),
  //               appBar: _buildHeader(),
  //               body: Container(
  //                 height: 40,
  //                 padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
  //                 margin: EdgeInsets.all(0.0),
  //                 alignment: Alignment.centerLeft,
  //                 child: Text('Chưa có sản phẩm nào',
  //                     style:
  //                         TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
  //               ),
  //             );
  //           }
  //         } else if (snapshot.hasError) {
  //           return Scaffold(
  //               backgroundColor: Color.fromRGBO(244, 243, 243, 1),
  //               appBar: _buildHeader(),
  //               body: Container(
  //                 height: 40,
  //                 padding: EdgeInsets.only(left: 15.0, bottom: 8.0),
  //                 margin: EdgeInsets.all(0.0),
  //                 alignment: Alignment.centerLeft,
  //                 child: Text('Lỗi không xác định, xin vui lòng thử lại sau',
  //                     style:
  //                         TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
  //               ));
  //         } else {
  //           return Container();
  //         }
  //       });
  // }

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
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchWidget(
                          notBack: false,
                        )));
          },
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
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return buildSort();
                  });
            },
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
  ) {
    if (products.isEmpty) {
      if (_loading) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(),
          ),
        );
      } else if (_error) {
        return Center(
          child: InkWell(
            onTap: () {
              setState(() {
                _loading = true;
                _error = false;
                getCollection();
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text("Error while loading photos, tap to try agin"),
            ),
          ),
        );
      }
    } else {
      return Stack(children: [
        Padding(
          padding:
              EdgeInsets.only(left: 15, right: 15, bottom: _loading ? 80 : 0),
          child: CustomScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
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
        ),
        _loading
            ? Positioned(
                bottom: 0,
                left: 50,
                right: 50,
                child: Center(
                  child: CircularProgressIndicator(),
                ))
            : Container()
      ]);
    }
    return Container();
  }

  Widget buildList(List<Products> products) {
    if (products.isEmpty) {
      if (_loading) {
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: CircularProgressIndicator(),
        ));
      } else if (_error) {
        return Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _loading = true;
              _error = false;
              getCollection();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Error while loading photos, tap to try agin"),
          ),
        ));
      }
    } else {
      return ListView.builder(
          controller: _scrollController,
          itemCount: products.length,
          padding: EdgeInsets.only(top: 10, bottom: 30),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return (index == products.length - 1)
                ? Column(
                    children: [
                      // SingleChildScrollView(
                      //     child:
                      Column(
                        children: products.map(
                          (e) {
                            return InkWell(
                                onTap: () async {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductWidget(
                                            products: e,
                                          )));
                                },
                                child: CollectionList(
                                  products: e,
                                ));
                          },
                        ).toList(),
                        // )
                      ),
                      _loading
                          ? Container(
                              padding: EdgeInsets.only(top: 0),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: CircularProgressIndicator(),
                              )),
                            )
                          : Container()
                    ],
                  )
                : Container();
          });
    }
    return Container();
  }

  Widget buildSort() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Sắp xếp',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                'Xong',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: CupertinoPicker(
            itemExtent: 50,
            onSelectedItemChanged: (int index) {
              // print(index);
            },
            children: sort
                .map((e) => Center(
                      child: Text(
                        e,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ))
                .toList()),
      ),
    );
  }
}
