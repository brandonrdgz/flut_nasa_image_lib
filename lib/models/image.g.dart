// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      imageGallery: (json['image_gallery'] as List<dynamic>)
          .map((e) => ImageGallery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'image_gallery': instance.imageGallery.map((e) => e.toJson()).toList(),
    };

_$_Image _$$_ImageFromJson(Map<String, dynamic> json) => _$_Image(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String,
      imageGallery: (json['image_gallery'] as List<dynamic>)
          .map((e) => ImageGallery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ImageToJson(_$_Image instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'image_gallery': instance.imageGallery,
    };
