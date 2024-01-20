import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meat_shop/features/product/presentation/view_model/product_view_model.dart';

class AllProductView extends ConsumerStatefulWidget {
  const AllProductView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AllProductViewState();
}

class _AllProductViewState extends ConsumerState<AllProductView> {

  final ScrollController _scrollController = ScrollController();

   @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productState = ref.watch(productViewModelProvider);
    return NotificationListener(
      onNotification: ((notification) {
       if(notification is ScrollEndNotification){
         if(_scrollController.position.extentAfter == 0){
          ref.read(productViewModelProvider.notifier).getAllProduct();
        }
       }
       return true;
      }),
      child: Column(
        children:[ 
                  Expanded(
                      child: ListView.builder(
                        itemCount: productState.products.length,
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final product = productState.products[index];
                          return ListTile(
                            title: Text(
                              product.productName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                            ),
                            subtitle: Text(
                              product.productId ?? 'No id',
                              style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 12,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if(productState.isLoading)
                    const CircularProgressIndicator(color: Colors.red),

                    const SizedBox(height: 10,)
                    ]
      ),
    );
  }
}