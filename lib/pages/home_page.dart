import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:so_close_task/model/demo_data.dart';

import '../custom_widget/arrival_shoes_cart.dart';
import '../custom_widget/shoes_cart.dart';
import '../model/custom_bottom_bar.dart';
import '../utils/common_style.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  late CategoryModel selectCategory;
  int? value = 1;

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: const Color(0xFF2D3B48),
      key: _sideMenuKey,

      ///navigation Drawer
      menu: _navigationDrawer(),
      type: SideMenuType.shrikNRotate,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,

        ///app bar
        appBar: _appBarSection(),

        ///Home Page Body Content
        body: _homeContent(),

        ///custom BottomNavigationBar
        bottomNavigationBar: _bottomNavigationBarSection(),
      ),
    );
  }

  SizedBox _bottomNavigationBarSection() {
    return SizedBox(
      width: Get.width,
      height: 80,
      child: Stack(
        children: [
          ///Custom Paint drawer
          CustomPaint(
            size: Size(Get.width, 80),
            painter: BottomCustomPainter(),
          ),

          ///floating Action Button
          Center(
            heightFactor: 0.6,
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: const Color(0xFF5B9EE1),
                elevation: 0.1,
                child: SvgPicture.asset(
                  'asset/images/bag.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),

          ///Other bottom nav Options
          SizedBox(
            width: Get.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('asset/images/home.svg'),
                SvgPicture.asset('asset/images/heart.svg'),
                Container(width: Get.width * .20),
                SvgPicture.asset('asset/images/notification.svg'),
                SvgPicture.asset(
                  'asset/images/user.svg',
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBarSection() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leadingWidth: 80,
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          'asset/images/menu.svg',
          width: 44,
          height: 44,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          final state = _sideMenuKey.currentState;
          if (state!.isOpened) {
            state.closeSideMenu();
          } else {
            state.openSideMenu();
          }
        },
      ),
      actions: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 11, bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: SvgPicture.asset('asset/images/bag.svg'),
            ),
            Positioned(
              right: 20,
              top: 10,
              child: Container(
                padding: const EdgeInsets.all(5),
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        )
      ],
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Store location',
            style: GoogleFonts.robotoSlab(
              color: const Color(0xFF707B81),
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.location_on,
                color: Color(0xFFF87265),
              ),
              Text(
                'Mondolibug, Sylhet',
                style: GoogleFonts.robotoSlab(
                  color: Colors.black,
                  fontSize: 14,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  ListView _homeContent() {
    return ListView(
      children: [
        ///searching section
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              hintText: "Looking for shoes",
              helperStyle: GoogleFonts.robotoSlab(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ),

        ///Category chip section
        Container(
          height: 60,
          padding: const EdgeInsets.all(0.0),
          margin: const EdgeInsets.only(left: 8, right: 8),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              categoryList.length,
              (index) => Container(
                margin: const EdgeInsets.all(2),
                child: ChoiceChip(
                  selectedColor: Colors.blueAccent,
                  backgroundColor: Colors.white,
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            categoryList[index].icon,
                            width: 30,
                          ),
                        ),
                      ),
                      if (value == index) const SizedBox(width: 10),
                      if (value == index)
                        Text(
                          categoryList[index].name,
                          style: GoogleFonts.robotoSlab(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      if (value == index) const SizedBox(width: 5),
                    ],
                  ),
                  selected: value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      value = selected ? index : null;
                    });
                  },
                ),
              ),
            ),
          ),
        ),

        ///Popular Shoes section
        _sectionTitle(title: "Popular Shoes", subTitle: "See all"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ShoesCart(shoesModel: shoesList[0]),
            ShoesCart(shoesModel: shoesList[1])
          ],
        ),

        ///New Arrivals section
        _sectionTitle(title: "New Arrivals", subTitle: "See all"),
        ArrivalShoeCart(shoesModel: shoesList[1]),
      ],
    );
  }

  Padding _sectionTitle({required String title, required String subTitle}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.robotoSlab(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(subTitle),
          )
        ],
      ),
    );
  }

  Widget _navigationDrawer() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// user Profile Section
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: Image.asset("asset/images/profile.png"),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                'Hey, 👋',
                style: TextStyle(color: Color(0xFF707B81), fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                'Alisson becker',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1),
              ),
            ),
            const SizedBox(height: 30),

            ///drawer nav Options
            ListTile(
              leading: SvgPicture.asset('asset/images/user.svg'),
              title: Text("Profile", style: drawerTextStyle),
            ),
            ListTile(
              leading: SvgPicture.asset('asset/images/home.svg'),
              title: Text("Home Page", style: drawerTextStyle),
            ),
            ListTile(
              leading: SvgPicture.asset('asset/images/bag.svg'),
              title: Text("My Cart", style: drawerTextStyle),
            ),
            ListTile(
              leading: SvgPicture.asset('asset/images/heart.svg'),
              title: Text("Favorite", style: drawerTextStyle),
            ),
            ListTile(
              leading: SvgPicture.asset('asset/images/car.svg'),
              title: Text("Orders", style: drawerTextStyle),
            ),
            ListTile(
              leading: SvgPicture.asset('asset/images/notification.svg'),
              title: Text("Notifications", style: drawerTextStyle),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
              child: Divider(
                color: const Color(0x0ff2d3ff).withOpacity(.2),
                thickness: 2,
              ),
            ),

            ///logout btn
            ListTile(
              leading: SvgPicture.asset('asset/images/logout.svg'),
              title: Text("Sign Out", style: drawerTextStyle),
            ),
          ],
        ),
      ),
    );
  }
}
