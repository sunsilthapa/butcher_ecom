import 'package:meat_shop/features/product/domain/entity/product_entity.dart';

class ProductState {
  final bool isLoading;
  final List<ProductEntity> products;
  final bool showMessage;

  ProductState({
    required this.isLoading,
    required this.products,
    required this.showMessage
  });

  factory ProductState.initialState() {
    return ProductState(
      isLoading: false,
      products: [],
      showMessage: false
    );
  }

  ProductState copyWith({
    bool? isLoading,
    List<ProductEntity>? products,
    bool? showMessage
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      showMessage: showMessage ?? this.showMessage
    );
  }
}
