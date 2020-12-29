import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/cart/cart.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/login.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/search/search.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/home.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionModel collectionData;
  NewModel newData;
  ScrollController scrollController;
  int _selectedIndex = 0;
  bool isScroll = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final tabs = [Home(), SearchWidget(), CartWidget(), LoginWidget()];

  void _onItemTapped(int index) {
    if (mounted)
      setState(() {
        _selectedIndex = index;
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  scrollListener() {
    if (scrollController.offset > 380) {
      setState(() {
        isScroll = true;
      });
    } else {
      setState(() {
        isScroll = false;
      });
    }
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  Widget addLeadingIcon() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        new Icon(
          CustomIcons.icon_menu_bar,
          size: 18,
          color: isScroll ? Colors.black54 : Colors.white,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        extendBodyBehindAppBar: true,
        body: tabs[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    CustomIcons.icon_home,
                    size: 15,
                  ),
                  title: Text(
                    'Trang chủ',
                    style: TextStyle(fontSize: 12),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.icon_search, size: 15),
                  title: Text('Tìm kiếm', style: TextStyle(fontSize: 12))),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.icon_cart, size: 15),
                  title: Text('Giỏ hàng', style: TextStyle(fontSize: 12))),
              BottomNavigationBarItem(
                  icon: Icon(CustomIcons.icon_account, size: 15),
                  title: Text('Tài khoản', style: TextStyle(fontSize: 12))),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ));
  }
}
