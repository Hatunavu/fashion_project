import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:intl/intl.dart';
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
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  CollectionModel collectionData;
  NewModel newData;
  ScrollController scrollController;
  int _selectedIndex = 0;
  bool isScroll = false;
  String _alarmTimeString;
  DateTime _alarmTime;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    var initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  scrollListener() {
    // debugger();
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

  popupAlarm() {
    showDialog(
        context: (context),
        builder: (context) {
          return AlertDialog(
            title: Text('Đặt lịch mua hàng'),
            content: Text('Bạn có muốn đặt thông báo mua hàng không?'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Hủy')),
              FlatButton(
                  onPressed: () {
                    toSetAlarm();
                  },
                  child: Text('Đồng ý'))
            ],
          );
        });
  }

  toSetAlarm() {
    _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
    showModalBottomSheet(
        isDismissible: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModelState) {
            return Container(
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () async {
                        var selectedTime = await showTimePicker(
                            context: context, initialTime: TimeOfDay.now());
                        if (selectedTime != null) {
                          final now = DateTime.now();
                          var selectedDateTime = DateTime(now.year, now.month,
                              now.day, selectedTime.hour, selectedTime.minute);
                          _alarmTime = selectedDateTime;
                          setModelState(() {
                            _alarmTimeString =
                                DateFormat('HH:mm').format(selectedDateTime);
                          });
                        }
                      },
                      child: Text(
                        _alarmTimeString,
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.w300),
                      )),
                  SizedBox(
                    height: 50,
                  ),
                  FloatingActionButton.extended(
                      backgroundColor: Colors.black,
                      onPressed: () {
                        onSaveAlarm();
                        Navigator.pop(context);
                      },
                      label: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            );
          });
        });
  }

  Future schaduleAlarm(DateTime schaduleNotificationDateTime) async {
    var androidNotificationDetails = AndroidNotificationDetails(
        'channelID', 'channelName', 'channelDescription',
        importance: Importance.max, priority: Priority.high);
    var iOSNotificationDetails = IOSNotificationDetails();
    var notificationDetails = NotificationDetails(
        android: androidNotificationDetails, iOS: iOSNotificationDetails);
    await flutterLocalNotificationsPlugin.schedule(
      0,
      'Thông báo',
      'Bạn có lịch mua hàng ngay bây giờ',
      schaduleNotificationDateTime,
      notificationDetails,
    );
  }

  void onSaveAlarm() {
    DateTime schaduleAlarmDateTime;
    if (_alarmTime.isAfter(DateTime.now())) {
      schaduleAlarmDateTime = _alarmTime;
      schaduleAlarm(schaduleAlarmDateTime);
    } else {
      schaduleAlarmDateTime = _alarmTime.add(Duration(days: 1));
    }

    Navigator.pop(context);
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
                  InkWell(
                    onTap: () {
                      popupAlarm();
                    },
                    child: Icon(
                      Icons.alarm,
                      size: 30,
                      color: isScroll ? Colors.black45 : Colors.white,
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
                  'https://suplo-fashion.myharavan.com/collections/all?view=smb.json'),
                  
        ]))
      ],
    );
  }
}
