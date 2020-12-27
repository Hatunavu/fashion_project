import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/collections.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/end.home.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/main.slide.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/mid.prod.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/news.dart';
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
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Search',
      style: optionStyle,
    ),
    Text(
      'Index 2: Card',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];

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
    //return new Container(
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
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            leading: addLeadingIcon(),
            backgroundColor: Colors.white,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Icon(
                      CustomIcons.icon_search,
                      color: isScroll ? Colors.black54 : Colors.white,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Icon(
                      CustomIcons.icon_noti,
                      color: isScroll ? Colors.black54 : Colors.white,
                    ),
                  ],
                ),
              )
            ],
            expandedHeight: 450,
            flexibleSpace: FlexibleSpaceBar(
              background: MainSlide(),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Collections(
                link:
                    'https://suplo-fashion.myharavan.com/collections/all?view=smb.json'),
            MidProd(),
            News(
              link:
                  'https://suplo-fashion.myharavan.com/blogs/news?view=smb.json',
            ),
            EndHome(
                link:
                    'https://suplo-fashion.myharavan.com/collections/all?view=smb.json')
          ]))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.icon_home,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.icon_search),
            label: 'Tìm kiếm',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.icon_cart),
            label: 'Giỏ hàng',
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcons.icon_account),
            label: 'Tài khoản',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
