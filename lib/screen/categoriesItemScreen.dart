import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quickfix/api/api_urls.dart';
import 'package:quickfix/controller/category_item_controller.dart';
import 'package:quickfix/controller/detail_category_item_controller.dart';
import 'package:quickfix/models/category_item_detail.dart';
import 'package:quickfix/screen/detailsScreen.dart';
import 'package:quickfix/widget/categoriesItem.dart';

class CategoriesItemScreen extends StatefulWidget {
  const CategoriesItemScreen({super.key});

  @override
  State<CategoriesItemScreen> createState() => _CategoriesItemScreenState();
}

class _CategoriesItemScreenState extends State<CategoriesItemScreen> {
  final CategoryItemController controller = Get.find<CategoryItemController>();
  final CategoryItemDetailController controllerDetail =
      Get.put(CategoryItemDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Categories Item",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 10, 112, 180),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: CupertinoSearchTextField(
              onSubmitted: (value) {
                print(value);
              },
              onChanged: (value) {
                print(value);
              },
              suffixMode: OverlayVisibilityMode.editing,
              onSuffixTap: () {
                print('Suffix Tapped');
              },
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GetBuilder<CategoryItemController>(
                id: 'categoriesItem',
                builder: (_) {
                  return SingleChildScrollView(
                    child: Wrap(
                      direction: Axis.horizontal,
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.categoryItems?.length != 0
                          ? List.generate(
                              controller.categoryItems?.length ?? 0,
                              (index) => Categoriesitem(
                                  onPressed: () {
                                    controllerDetail.onGetCategoriesItem(
                                        controller.categoryItems![index].id!);
                                    Get.to(DetailsScreen());
                                  },
                                  Uname: controller.categoryItems![index].name!,
                                  Uprice: controller.categoryItems![index].price
                                      .toString(),
                                  UassetPath:
                                      controller.categoryItems![index].logo),
                            )
                          : [
                              Container(
                                child: Center(child: Text("No Services Found")),
                              ),
                            ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
