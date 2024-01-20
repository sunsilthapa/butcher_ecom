import 'package:meat_shop/features/product/domain/entity/product_entity.dart';

class ProductState {
  final bool isLoading;
  final List<ProductEntity> products;
  final bool hasReachedMax;
  final int page;
  final bool showMessage;

  ProductState({
    required this.isLoading,
    required this.products,
    required this.hasReachedMax,
    required this.page,
    required this.showMessage
  });

  factory ProductState.initialState() {
    return ProductState(
      isLoading: false,
      products: [],
      hasReachedMax: false,
      page: 0,
      showMessage: false
    );
  }

  ProductState copyWith({
    bool? isLoading,
    List<ProductEntity>? products,
    bool? hasReachedMax,
    int? page,
    bool? showMessage
  }) {
    return ProductState(
      isLoading: isLoading ?? this.isLoading,
      products: products ?? this.products,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      page: page ?? this.page,
      showMessage: showMessage ?? this.showMessage
    );
  }
}
