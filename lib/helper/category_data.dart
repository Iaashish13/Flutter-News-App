import 'package:lets_learn/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = List<CategoryModel>.empty(growable: true);
  CategoryModel categoryModel;
  categoryModel = CategoryModel(
      categoryName: 'Business',
      imageUrl:
          'https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=702&q=80');
  category.add(categoryModel);
  categoryModel = CategoryModel(
      categoryName: 'General',
      imageUrl:
          'https://images.unsplash.com/photo-1434030216411-0b793f4b4173?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80');
  category.add(categoryModel);
  categoryModel = CategoryModel(
      categoryName: 'Entertainment',
      imageUrl:
          'https://images.unsplash.com/photo-1616469829941-c7200edec809?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80');
  category.add(categoryModel);
  categoryModel = CategoryModel(
      categoryName: 'Sports',
      imageUrl:
          'https://images.unsplash.com/photo-1542751371-adc38448a05e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80');
  category.add(categoryModel);
  categoryModel = CategoryModel(
      categoryName: 'Technology',
      imageUrl:
          'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=750&q=80');
  category.add(categoryModel);
  categoryModel = CategoryModel(
      categoryName: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=889&q=80');
  category.add(categoryModel);

  return category;
}
