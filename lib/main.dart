import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:humoyunchik/Page1.dart';
import 'package:humoyunchik/Page10.dart';
import 'package:humoyunchik/Page12.dart';
import 'package:humoyunchik/Page13.dart';
import 'package:humoyunchik/Page14.dart';
import 'package:humoyunchik/Page15.dart';
import 'package:humoyunchik/Page2.dart';
import 'package:humoyunchik/Page3.dart';
import 'package:humoyunchik/Page4.dart';
import 'package:humoyunchik/Page5.dart';
import 'package:humoyunchik/Page6.dart';
import 'package:humoyunchik/Page7.dart';
import 'package:humoyunchik/Page8.dart';
import 'package:humoyunchik/Page9.dart';

import 'Page11.dart';
import 'Info.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: Size(360, 690),
        builder: (context, index) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _value = 0;
  bool _e = false;
  bool value = false;
  bool isOpen = false;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  final List<MyTabs> _tabs = [
    new MyTabs(title: "Plus Messenger", color: Colors.teal),
    new MyTabs(title: "Каналы", color: Colors.black),
    new MyTabs(title: "Личные чаты", color: Colors.black),
    new MyTabs(title: "Группы", color: Colors.black),
    new MyTabs(title: "Супергруппы", color: Colors.black),
    new MyTabs(title: "Боты", color: Colors.black),
  ];
  MyTabs? _myHandler;
  TabController? _controller;
  void initState() {
    super.initState();
    _controller = TabController(length: 6, vsync: this);
    _myHandler = _tabs[0];
    _controller?.addListener(_handleSelected);
  }

  void _handleSelected() {
    setState(() {
      _myHandler = _tabs[_controller!.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        bottom: TabBar(
          indicatorColor: value ? Colors.blue[700] : Colors.white,
          indicatorWeight: 6,
          indicatorPadding: EdgeInsets.only(left: 30.w, right: 20.w),
          controller: _controller,
          splashBorderRadius: BorderRadius.circular(20.r),
          tabs: [
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(bottom: 14.h),
                width: 10.w,
                height: 10.h,
                child: Icon(Icons.border_all_outlined,
                    size: 20.sp,
                    color: value ? Colors.blue[700] : Colors.grey[50]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 14.h),
              width: 10.w,
              height: 10.h,
              child: Icon(Icons.campaign_rounded,
                  size: 20.sp,
                  color: value ? Colors.blue[700] : Colors.grey[50]),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 14.h),
              width: 10.w,
              height: 10.h,
              child: Icon(Icons.person_outline,
                  size: 20.sp,
                  color: value ? Colors.blue[700] : Colors.grey[50]),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 14.h),
              width: 10.w,
              height: 10.h,
              child: Icon(Icons.people_outline,
                  size: 20.sp,
                  color: value ? Colors.blue[700] : Colors.grey[50]),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 14.h),
              width: 10.w,
              height: 10.h,
              child: Icon(Icons.people_outline,
                  size: 20.sp,
                  color: value ? Colors.blue[700] : Colors.grey[50]),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 14.h),
                width: 10.w,
                height: 10.h,
                child: Icon(Icons.adb_rounded,
                    size: 20.sp,
                    color: value ? Colors.blue[700] : Colors.grey[50])),
          ],
        ),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(
            width: 15.w,
          ),
          Icon(
            Icons.folder_open,
          ),
          SizedBox(
            width: 15.w,
          ),
          Icon(Icons.visibility_off_outlined),
          SizedBox(
            width: 5.w,
          ),
        ],
        backgroundColor: value ? Colors.blueGrey[900] : Colors.teal,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            setState(() {
              _key.currentState!.openDrawer();
            });
          },
          child: Icon(
            Icons.menu,
            size: 22.sp,
          ),
        ),
        title: Container(
          margin: EdgeInsets.only(right: 40.w),
          child: Text(_myHandler!.title,
              style: TextStyle(
                  fontWeight: value ? FontWeight.w400 : FontWeight.w700)),
        ),
      ),
      drawer: Drawer(
        backgroundColor: value ? Color.fromRGBO(49, 48, 48, 1) : Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              child: UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.w),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          value = !value;
                        });
                      },
                      icon: value
                          ? Icon(
                              Icons.mode_night_outlined,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.light_mode_rounded,
                              color: Colors.white,
                            ),
                    ),
                  )
                ],
                decoration: BoxDecoration(
                    color: value ? Colors.blueGrey[600] : Colors.teal),
                accountName: Container(
                  child: Text("Humoyun",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight:
                              value ? FontWeight.w700 : FontWeight.w400)),
                ),
                accountEmail: InkWell(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("+998 901219625",
                          style: TextStyle(
                              color:
                                  value ? Colors.grey[700] : Colors.teal[200],
                              fontSize: 12.sp)),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Icon(
                          isOpen
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage(
                      "https://img.wattpad.com/cover/282100764-176-k386769.jpg"),
                ),
              ),
            ),
            Container(
              width: double.infinity.w,
              height: (isOpen ? 120 : 0).h,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 15.r,
                      backgroundImage: NetworkImage(
                          "https://img.wattpad.com/cover/282100764-176-k386769.jpg"),
                    ),
                    title: Text("Humoyun",
                        style: TextStyle(
                            fontSize: 20.sp,
                            color: value ? Colors.white : Colors.black,
                            fontWeight:
                                value ? FontWeight.w700 : FontWeight.w400)),
                  ),
                  ListTile(
                    leading: Icon(Icons.add, size: 24.sp),
                    title: Text("Добавить аккаунт",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: value ? Colors.white : Colors.black,
                          fontWeight: value ? FontWeight.w700 : FontWeight.w400,
                        )),
                  ),
                  Divider(color: value ? Colors.black : Colors.grey),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page1()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.people_outlined,
                  size: 22.sp,
                ),
                title: Text("Создать группу",
                    style: TextStyle(
                        color: value ? Colors.white : Colors.black,
                        fontWeight: value ? FontWeight.w700 : FontWeight.w400,
                        fontSize: 14.sp)),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page2()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.lock_outline), //bedtime
                title: Text("Начать секретный чат",
                    style: TextStyle(
                        color: value ? Colors.white : Colors.black,
                        fontWeight: value ? FontWeight.w700 : FontWeight.w400,
                        fontSize: 12.sp)),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page3()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.videocam_outlined),
                title: Text("Созать канал",
                    style: TextStyle(
                      color: value ? Colors.white : Colors.black,
                      fontWeight: value ? FontWeight.w700 : FontWeight.w400,
                    )),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page4()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.person_outline), //person_add
                title: Text("Контакты",
                    style: TextStyle(
                      color: value ? Colors.white : Colors.black,
                      fontWeight: value ? FontWeight.w700 : FontWeight.w400,
                    )),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page5()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.folder_outlined),
                title: Text("Папки"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page6()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text("Люди рядом"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page7()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.bookmark_outline),
                title: Text("Избранное"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page8()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.phone_outlined),
                title: Text("Звонки"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page9()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.settings_outlined),
                title: Text("Настройки"),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page10()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.add_circle_outline_outlined),
                title: Text("Настройки Plus"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page11()));
                });
              },
              child: ListTile(
                leading: Icon(Icons.folder_open_outlined, color: Colors.grey),
                title: Text("Категории"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page12()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.palette_outlined,
                ),
                title: Text("Скачать темы"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page13()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.brush_outlined,
                ),
                title: Text("Оформление"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page14()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.people_outline,
                ),
                title: Text("Группа поддержки"),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Page15()));
                });
              },
              child: ListTile(
                leading: Icon(
                  Icons.menu,
                ),
                title: Text("Счётчик чатов"),
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              height: 60,
              width: double.infinity.w,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Plus Messenger для Android",
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("v9.0.2.0 (19410) universal armeabi-v7a",
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("armeabi", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h)
          ]),
        ),
      ),
      body: TabBarView(
        children: [
          Container(
              width: double.infinity.w,
              height: 900.h,
              child: ListView.builder(
                  itemCount: Info.title.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 234.w,
                              height: 18.h,
                              child: Text(
                                Info.title[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                                child: Text(Info.time[index],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey))),
                          ],
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(Info.Assetimage[index]),
                        backgroundColor: Color.fromARGB(255, 66, 70, 196),
                      ),
                      subtitle: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          )),
                          height: 30.h,
                          width: 500.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 262.w,
                                    child: Text(
                                      Info.subtitle[index],
                                      style: TextStyle(fontSize: 14.sp),
                                    )),
                              ])),
                    );
                  })),
          Container(
              width: double.infinity.w,
              height: 900.h,
              child: ListView.builder(
                  itemCount: Info.titlechanel.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 234.w,
                              height: 18.h,
                              child: Text(
                                Info.titlechanel[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Text(Info.chaneltime[index],
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.grey)),
                          ],
                        ),
                      ),
                      leading: (CircleAvatar(
                        radius: 25.r,
                        backgroundImage:
                            AssetImage(Info.AssetChanelImage[index]),
                        backgroundColor: Colors.blue,
                      )),
                      subtitle: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          )),
                          height: 30.h,
                          width: double.infinity.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 262.w,
                                    child: Text(Info.subchaneltitle[index])),
                              ])),
                    );
                  })),
          Container(
              width: double.infinity.w,
              height: 900.h,
              child: ListView.builder(
                  itemCount: Info.lichniysubtitle.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Info.lichniytitle[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                                child: Text(Info.lichniytime[index],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey))),
                          ],
                        ),
                      ),
                      leading: (CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(Info.lichniyasset[index]),
                        backgroundColor: Colors.blue,
                      )),
                      subtitle: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          )),
                          height: 30.h,
                          width: double.infinity.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 262.w,
                                    child: Text(
                                      Info.lichniysubtitle[index],
                                      style: TextStyle(fontSize: 14.sp),
                                    )),
                              ])),
                    );
                  })),
          Container(
              width: double.infinity.w,
              height: 900.h,
              child: ListView.builder(
                  itemCount: Info.groupsubtitle.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Info.grouptitle[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                                child: Text(Info.grouptime[index],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey))),
                          ],
                        ),
                      ),
                      leading: (CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(Info.groupasset[index]),
                        backgroundColor: Colors.blue,
                      )),
                      subtitle: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          )),
                          height: 30.h,
                          width: double.infinity.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 262.w,
                                    child: Text(
                                      Info.groupsubtitle[index],
                                      style: TextStyle(fontSize: 14.sp),
                                    )),
                              ])),
                    );
                  })),
          Container(
              width: double.infinity.w,
              height: 900.h,
              child: ListView.builder(
                  itemCount: Info.groupsubtitle.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Info.grouptitle[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                                child: Text(Info.grouptime[index],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey))),
                          ],
                        ),
                      ),
                      leading: (CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(Info.groupasset[index]),
                        backgroundColor: Colors.blue,
                      )),
                      subtitle: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          )),
                          height: 30.h,
                          width: double.infinity.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 262.w,
                                    child: Text(
                                      Info.groupsubtitle[index],
                                      style: TextStyle(fontSize: 14.sp),
                                    )),
                              ])),
                    );
                  })),
          Container(
              width: double.infinity.w,
              height: 900.h,
              child: ListView.builder(
                  itemCount: Info.Botsubtitle.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: double.infinity.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Info.Bottitle[index],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700),
                            ),
                            Container(
                                child: Text(Info.Bottime[index],
                                    style: TextStyle(
                                        fontSize: 12.sp, color: Colors.grey))),
                          ],
                        ),
                      ),
                      leading: (CircleAvatar(
                        radius: 25.r,
                        backgroundImage: AssetImage(Info.Botimage[index]),
                        backgroundColor: Colors.blue,
                      )),
                      subtitle: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(
                              style: BorderStyle.solid,
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          )),
                          height: 30.h,
                          width: 500.w,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 16.h,
                                    width: 262.w,
                                    child: Text(
                                      Info.Botsubtitle[index],
                                      style: TextStyle(fontSize: 14.sp),
                                    )),
                              ])),
                    );
                  })),
        ],
        controller: _controller,
      ),
    );
  }
}

class MyTabs {
  final String title;
  final Color color;
  MyTabs({required this.title, required this.color});
}
