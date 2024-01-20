import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/features/product/presentation/view_model/product_view_model.dart';

class AllProductView extends ConsumerStatefulWidget {
  const AllProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllProductViewState();
}

class _AllProductViewState extends ConsumerState<AllProductView> {

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);
    return Container(
      child:  productState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: productState.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            productState.products[index].productName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            productState.products[index].productId ?? 'No id',
                            style: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 12,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
    );
  }
}