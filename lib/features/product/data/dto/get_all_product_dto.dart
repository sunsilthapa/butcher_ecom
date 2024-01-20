import 'package:json_annotation/json_annotation.dart';
import 'package:meat_shop/features/product/data/model/product_api_model.dart';

part 'get_all_product_dto.g.dart';

@JsonSerializable()
class GetAllProductDTO {
  final bool success;
  final int count;
  final List<ProductAPIModel> data;

  GetAllProductDTO(
      {required this.success, required this.count, required this.data});

  factory GetAllProductDTO.fromJson(Map<String, dynamic> json) =>
      _$GetAllProductDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllProductDTOToJson(this);

  static GetAllProductDTO toEntity(GetAllProductDTO getAllProductDTO) {
    return GetAllProductDTO(
      success: getAllProductDTO.success,
      count: getAllProductDTO.count,
      data: getAllProductDTO.data,
    );
  }

  static GetAllProductDTO fromEntity(GetAllProductDTO getAllProductDTO) {
    return GetAllProductDTO(
      success: getAllProductDTO.success,
      count: getAllProductDTO.count,
      data: getAllProductDTO.data,
    );
  }
}
