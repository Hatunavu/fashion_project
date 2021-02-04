import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.event.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/auth.state.dart';
import 'package:suplo_project_8_12_2020/app/blocs/authenication/simple_bloc_observer.dart';
import 'package:suplo_project_8_12_2020/app/blocs/login/login.bloc.dart';
import 'package:suplo_project_8_12_2020/app/blocs/news/new.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/collection/collection.model.dart';
import 'package:suplo_project_8_12_2020/app/blocs/user/user.repository.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/account.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/component/header.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/account/component/menu.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/cart/cart.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/search/search.widget.dart';
import 'package:suplo_project_8_12_2020/app/theme/home/components/home.dart';
import 'package:suplo_project_8_12_2020/custom_icons_icons.dart';
import 'package:suplo_project_8_12_2020/app/theme/core/login/login.widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserRepository _userRepository = UserRepository();
  CollectionModel collectionData;
  NewModel newData;
  ScrollController scrollController;
  int _selectedIndex = 0;
  bool isScroll = false;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final tabs = [Home(), SearchWidget(), CartWidget(), Account()];

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

  Widget listTitle(String title) {
    return ListTile(
        leading: Text(title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(left: 20, top: 50),
            children: [
              listTitle('Nhóm sản phẩm'),
              listTitle('Sản phẩm nổi bật'),
              listTitle('Tin tức'),
              listTitle('Chính sách'),
              listTitle('Liên hệ')
            ],
          ),
        ),
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
        extendBodyBehindAppBar: true,
        body: tabs[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 50,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
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

class Account extends StatelessWidget {
  final UserRepository _userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login with Firebase',
        home: BlocProvider(
          create: (context) =>
              AuthenticationBloc(userRepository: _userRepository)
                ..add(AuthenticationEventStarted()),
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, authenticationState) {
              if (authenticationState is AuthenticationStateSuccess) {
                return AccountWidget();
              } else if (authenticationState is AuthenticationStateFailure) {
                return BlocProvider<LoginBloc>(
                  create: (context) =>
                      LoginBloc(userRepository: _userRepository),
                  child: LoginWidget(
                    userRepository: _userRepository,
                  ),
                );
              }
              return Container();
            },
          ),
        ));
  }
}
