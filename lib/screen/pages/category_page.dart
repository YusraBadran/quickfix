import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:quickfix/controller/categories_controller.dart';
import 'package:quickfix/controller/category_item_controller.dart';
import 'package:quickfix/screen/categoriesItemScreen.dart';
import 'package:quickfix/widget/categories.dart';
import 'package:quickfix/widget/serviesType.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final CategoriesController controller = Get.find<CategoriesController>();
  final CategoryItemController controllerItem =
      Get.put(CategoryItemController());

  @override
  void dispose() {
// if subCategoryId is not null then get out of the page
    if (controller.categories![0].subCategoryId != null) {
      controller
          .onGetPreviousCategories(controller.categories![0].subCategoryId!);
    }
    // if serviceId is not null then get out of the page
    super.dispose();
  }

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
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<CategoriesController>(
            id: 'categories',
            builder: (controller) {
              return SingleChildScrollView(
                // clipBehavior: Clip.antiAlias,
                child: Wrap(
                    direction: Axis.horizontal,
                    clipBehavior: Clip.antiAlias,
                    spacing: 10,
                    runSpacing: 10,
                    children: controller.categories?.length != 0
                        ? List.generate(
                            controller.categories?.length ?? 0,
                            (index) {
                              return ServiesType(
                                label: controller.categories![index].name,
                                image: controller.categories![index].logo,
                                onPress: () {
                                  if (controller
                                          .categories![index].subCategoryId ==
                                      null) {
                                    controller.onGetNextCategories(
                                        controller.categories![index].id);
                                  }
                                  if (controller
                                          .categories![index].hasCategoryItem ==
                                      true) {
                                    controllerItem.onGetCategoriesItem(
                                        controller.categories![index].id);
                                    Get.to(CategoriesItemScreen());
                                  }
                                },
                              );
                            },
                          )
                        : [
                            Container(
                              child: Center(child: Text("No Services Found")),
                            ),
                          ]),
              );
            },
          ),
        ),
      ),
    );
  }
}
