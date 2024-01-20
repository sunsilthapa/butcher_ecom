import 'package:json_annotation/json_annotation.dart';
import 'package:meat_shop/features/product/data/model/product_api_model.dart';

part 'get_all_product_dto.g.dart';

@JsonSerializable()
class GetAllProductDTO {
  final bool success;
  final String message;
  final List<ProductAPIModel> products;

  GetAllProductDTO(
      {required this.success, required this.message, required this.products});

  factory GetAllProductDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductDTOToJson(this);

  static GetAllProductDTO toEntity(GetAllProductDTO getAllProductDTO) {
    return GetAllProductDTO(
      success: getAllProductDTO.success,
      message: getAllProductDTO.message,
      products: getAllProductDTO.products,
    );
  }

  static GetAllProductDTO fromEntity(GetAllProductDTO getAllProductDTO) {
    return GetAllProductDTO(
      success: getAllProductDTO.success,
      message: getAllProductDTO.message,
      products: getAllProductDTO.products,
    );
  }
}
