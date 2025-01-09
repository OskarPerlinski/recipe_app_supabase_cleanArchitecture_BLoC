import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/category/category_state.dart';
import 'package:recipe_api/domain/category/usecases/get_category.dart';
import 'package:recipe_api/service_locator.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());

  void displayCategory() async {
    var returnedData = await sl<GetCategoryUseCases>().call();
    returnedData.fold(
      (error) {
        emit(
          CategoryFailureLoaded(),
        );
      },
      (data) {
        emit(
        CategoryLoaded(category: data),
        );
      },
    );
  }
}
