import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meat_shop/core/common/snackbar/my_snackbar.dart';
import 'package:meat_shop/features/product/domain/entity/product_entity.dart';
import 'package:meat_shop/features/product/presentation/view_model/product_view_model.dart';
import 'package:permission_handler/permission_handler.dart';

class AdminAddProduct extends ConsumerWidget {
  AdminAddProduct({super.key});

  final productNameController = TextEditingController();
  final productDescriptionController = TextEditingController();
  final productPriceController = TextEditingController();
  final gap = const SizedBox(height: 8);

 // Check for the camera permission
  checkCameraPermission() async {
    if (await Permission.camera.request().isRestricted ||
        await Permission.camera.request().isDenied) {
      await Permission.camera.request();
    }
  }

  File? _img;
  Future _browseImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        _img = File(image.path);
        // ref.read(authViewModelProvider.notifier).uploadImage(_img!);
      } else {
        return;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productViewModelProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (productState.showMessage) {
        showSnackBar(message: 'Product Added', context: context);
        ref.read(productViewModelProvider.notifier).resetMessage(false);
      }
    });
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Add Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            TextFormField(
              controller: productNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Name',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Product name';
                }
                return null;
              },
            ),
           gap,
            TextFormField(
              controller: productDescriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Description',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Product Description';
                }
                return null;
              },
            ),
           gap,
            TextFormField(
              controller: productPriceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Product Price',
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter Product Price';
                }
                return null;
              },
            ),
           gap,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ProductEntity productEntity = ProductEntity(
                     productName: productNameController.text, productPrice: int.parse(productPriceController.text), productDescription: '', productCategory: '', productImageUrl: '' ,
                  );
                  ref
                      .read(productViewModelProvider.notifier)
                      .addProduct(productEntity);
                },
                child: const Text('Add Product'),
              ),
            ),
            gap,
            InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.grey[300],
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (context) => Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  checkCameraPermission();
                                  _browseImage(ImageSource.camera);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.camera),
                                label: const Text('Camera'),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  _browseImage(ImageSource.gallery);
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Gallery'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: CircleAvatar(
                        radius: 50,
                        // backgroundImage:
                        //     AssetImage('assets/images/profile.png'),
                        backgroundImage: _img != null
                            ? FileImage(_img!)
                            : const AssetImage('assets/images/profile.png')
                                as ImageProvider,
                      ),
                    ),
                  ),gap,
            const Align(
              alignment: Alignment.center,
              child: Text(
                'List of Products',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            gap,
            productState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: productState.products.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(productState.products[index].productName),
                            subtitle:
                                Text(productState.products[index].productId!),
                            trailing: IconButton(
                              onPressed: () {
                                ref
                                    .read(productViewModelProvider.notifier)
                                    .deleteProduct(
                                        productState.products[index].productId!);
                              },
                              icon: const Icon(Icons.delete),
                            ));
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
