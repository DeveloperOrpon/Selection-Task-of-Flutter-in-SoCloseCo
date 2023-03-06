import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:so_close_task/model/demo_data.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late ShoesModel shoesModel;
  int? value = 1;

  @override
  void didChangeDependencies() {
    /// received Passing Argument
    shoesModel = ModalRoute.of(context)!.settings.arguments as ShoesModel;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ///Appbar with no background
          _sliverAppBar(),

          ///Details Content
          SliverList(delegate: _sliverDelegate())
        ],
      ),

      ///Bottom Navbar
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Container _bottomNavBar() {
    return Container(
      width: Get.width,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 10,
              offset: const Offset(4, 4),
              blurRadius: 10,
            ),
          ],
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: GoogleFonts.robotoSlab(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  shoesModel.price,
                  style: GoogleFonts.robotoSlab(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 25)),
                onPressed: () {},
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, letterSpacing: 1.5),
                )),
          )
        ],
      ),
    );
  }

  SliverAppBar _sliverAppBar() {
    return SliverAppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey.shade100,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      leadingWidth: 80,
      toolbarHeight: 70,
      centerTitle: true,
      backgroundColor: Colors.grey.shade100,
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 11, bottom: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: SvgPicture.asset('asset/images/bag.svg'),
        )
      ],
      title: Text(
        'Men’s Shoes',
        style: GoogleFonts.robotoSlab(
          color: Colors.black,
          fontSize: 18,
          letterSpacing: 1.2,
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        ),
      ),
      expandedHeight: 310,
      flexibleSpace: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            Hero(
              tag: shoesModel.image,
              child: Image.asset(
                'asset/images/big_Image.png',
                width: Get.width,
                height: 300,
              ),
            ),
            Positioned(
              bottom: -10,
              left: 0,
              right: 0,
              child: Image.asset(
                'asset/images/image_bg.png',
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverChildListDelegate _sliverDelegate() {
    return SliverChildListDelegate([
      const SizedBox(height: 15),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, bottom: 10),
        child: Text(
          shoesModel.sellerType.toUpperCase(),
          style: const TextStyle(
              color: Colors.blue, fontSize: 14, letterSpacing: 2),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, bottom: 5),
        child: Text(
          shoesModel.name,
          style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.2),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 18.0),
        child: Text(
          shoesModel.price,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 15),
      const Padding(
        padding: EdgeInsets.only(left: 18.0),
        child: Text(
          "Air Jordan is an American brand of basketball\nshoes athletic, casual, and style clothing\nproduced by Nike....",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 18.0, top: 15),
        child: Text(
          "Gallery",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1.2),
        ),
      ),
      const SizedBox(height: 15),
      Row(
        children: [
          const SizedBox(width: 20),
          Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("asset/images/shoes1.png"),
          ),
          Container(
            margin: const EdgeInsets.all(5),
            height: 70,
            width: 70,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("asset/images/shoes1.png"),
          ),
          Container(
            height: 70,
            margin: const EdgeInsets.all(5),
            width: 70,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset("asset/images/big_Image.png"),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 15, right: 18),
        child: Row(
          children: const [
            Text(
              "Size",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 1.2),
            ),
            Spacer(),
            Text(
              "EU",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
            SizedBox(width: 10),
            Text(
              "US",
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
            SizedBox(width: 10),
            Text(
              "UK",
              style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 1.2),
            ),
          ],
        ),
      ),
      Container(
        height: 60,
        padding: const EdgeInsets.all(0.0),
        margin: const EdgeInsets.only(left: 8, right: 8, top: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            6,
            (index) => Container(
              margin: const EdgeInsets.all(4),
              child: ChoiceChip(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 15, bottom: 15),
                selectedColor: Colors.blueAccent,
                backgroundColor: Colors.grey.shade200,
                label: Text(
                  (index + 35).toString(),
                  style: GoogleFonts.robotoSlab(
                    color: value == index ? Colors.white : Colors.grey,
                    fontSize: 16,
                  ),
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
      const SizedBox(height: 200)
    ]);
  }
}
