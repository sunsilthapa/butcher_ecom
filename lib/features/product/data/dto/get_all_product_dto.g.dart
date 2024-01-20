// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProductDTO _$GetAllProductDTOFromJson(Map<String, dynamic> json) =>
    GetAllProductDTO(
      success: json['success'] as bool,
      count: json['count'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductAPIModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllProductDTOToJson(GetAllProductDTO instance) =>
    <String, dynamic>{
      'success': instance.success,
      'count': instance.count,
      'data': instance.data,
    };
