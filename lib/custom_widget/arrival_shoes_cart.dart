import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:so_close_task/model/demo_data.dart';

class ArrivalShoeCart extends StatelessWidget {
  final ShoesModel shoesModel;
  const ArrivalShoeCart({Key? key, required this.shoesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
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
                          fontSize: 20,
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
          ),
          Expanded(
            child: RotationTransition(
              turns: const AlwaysStoppedAnimation(10 / 360),
              child: Image.asset(
                shoesModel.image,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
