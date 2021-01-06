import 'package:flutter/material.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/search/search.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/collections.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/end.home.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/main.slide.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/mid.prod.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/news.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/home.widget.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CollectionModel collectionData;
  NewModel newData;
  ScrollController scrollController;
  int _selectedIndex = 0;
  bool isScroll = false;
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
      children: [
        InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Icon(
            CustomIcons.icon_menu_bar,
            size: 18,
            color: isScroll ? Colors.black54 : Colors.white,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchWidget(
                                    notBack: false,
                                  )));
                    },
                    child: Icon(
                      CustomIcons.icon_search,
                      color: isScroll ? Colors.black54 : Colors.white,
                    ),
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
    );
  }
}
