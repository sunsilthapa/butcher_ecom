import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';
import 'package:meat_shop/features/product/domain/use_case/add_product_usecase.dart';
import 'package:meat_shop/features/product/domain/use_case/delete_product_usecase.dart';
import 'package:meat_shop/features/product/domain/use_case/get_all_product_usecase.dart';
import 'package:meat_shop/features/product/presentation/state/product_state.dart';

final productViewModelProvider =
    StateNotifierProvider.autoDispose<ProductViewModel, ProductState>(
  (ref) => ProductViewModel(
    getAllProductUsecase: ref.read(getAllProductUseCaseProvider),
    addProductUseCase: ref.read(addProductUseCaseProvider), 
    deleteProductUseCase: ref.read(deleteProductUseCaseProvider),
  ),
);

class ProductViewModel extends StateNotifier<ProductState> {
  final GetAllProductUseCase getAllProductUsecase;
  final AddProductUseCase addProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;

  ProductViewModel({
    required this.getAllProductUsecase,
    required this.addProductUseCase,
    required this.deleteProductUseCase
  }) : super(ProductState.initialState()) {
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    state = state.copyWith(isLoading: true);
    final result = await getAllProductUsecase.getAllProduct();
    result.fold(
      (failure) => state = state.copyWith(isLoading: false),
      (products) => state = state.copyWith(isLoading: false, products: products),
    );
  }

  Future<void> addProduct(ProductEntity productEntity) async {
    state = state.copyWith(isLoading: true);
    final result = await addProductUseCase.call(productEntity);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false),
      (isAdded) {
        state = state.copyWith(isLoading: false);
        getAllProduct();
      },
    );
  }

  Future<void> deleteProduct(String id) async{
    state = state.copyWith(isLoading:  true);
    final result = await deleteProductUseCase.deleteProduct(id);
    result.fold(
      (failure)=> state  = state.copyWith(isLoading: false),
      (isDeleted){
        state = state.copyWith(isLoading: false, showMessage: true);
        getAllProduct();
      }
    );
  }

  
  void resetMessage(bool value) {
    state = state.copyWith(showMessage: value);
  }
}
