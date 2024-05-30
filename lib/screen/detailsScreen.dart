import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/controller/card_controller.dart';
import 'package:quickfix/controller/detail_category_item_controller.dart';
import 'package:quickfix/models/category_item.dart';
import 'package:quickfix/models/order.dart';
import 'package:quickfix/widget/button1.dart';

class DetailsScreen extends StatefulWidget {
  // const Detailsscreen({this.DassetPath, this.Dname, this.Dprice});
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // final DassetPath, Dname, Dprice;
  final CategoryItemDetailController controllerDetail =
      Get.find<CategoryItemDetailController>();
  final CardController cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Colors.white), // Change the color as needed
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          "Details Item",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 112, 180),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 25.0,
          ),
          Hero(
            tag: 'DassetPath',
            child: Image.asset(
              "assets/images/testS.png",
              height: 300.0,
              width: 300.0,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: const Divider(),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Text(
                  controllerDetail.categoryItemDetail?.name ?? 'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                controllerDetail.categoryItemDetail?.price.toString() ??
                    'Price',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              child: Text(
                controllerDetail.categoryItemDetail?.description ??
                    'Description',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[500]),
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              height: 50,
              child: Button1(
                title: "Add To Card",
                onPress: () {
                  var order = CategoryItem(
                    id: controllerDetail.categoryItemDetail?.id,
                    name: controllerDetail.categoryItemDetail?.name,
                    description:
                        controllerDetail.categoryItemDetail?.description,
                    price: controllerDetail.categoryItemDetail?.price,
                    logo: controllerDetail.categoryItemDetail?.image[0],
                    status: controllerDetail.categoryItemDetail?.status,
                    categoryId: controllerDetail.categoryItemDetail?.categoryId,
                  );
                  cardController.order?.add(order);
                  Get.snackbar(
                    "Success",
                    "Item Added to Cart",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
