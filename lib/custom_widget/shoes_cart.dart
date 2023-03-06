import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:so_close_task/model/demo_data.dart';
import 'package:so_close_task/pages/product_details_page.dart';

class ShoesCart extends StatelessWidget {
  final ShoesModel shoesModel;
  const ShoesCart({Key? key, required this.shoesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailsPage(), arguments: shoesModel);
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 210,
            width: Get.width * .42,
            decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 20,
                    offset: const Offset(5, 5),
                    spreadRadius: 10,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotationTransition(
                  turns: const AlwaysStoppedAnimation(-12 / 360),
                  child: Hero(
                    tag: shoesModel.image,
                    child: Image.asset(
                      shoesModel.image,
                      height: 75,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    shoesModel.sellerType.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.blue, fontSize: 12, letterSpacing: 2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    shoesModel.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 1.2),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    shoesModel.price,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 36,
              width: 36,
              decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
              child: Icon(
                CupertinoIcons.add,
                color: CupertinoColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
