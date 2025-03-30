// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

About _$AboutFromJson(Map<String, dynamic> json) => About(
      createdAt: json['_createdAt'] as String,
      id: json['_id'] as String,
      rev: json['_rev'] as String,
      type: json['_type'] as String,
      updatedAt: json['_updatedAt'] as String,
      age: (json['age'] as num).toInt(),
      contact: (json['contact'] as List<dynamic>)
          .map((e) => Contact.fromJson(e as Map<String, dynamic>))
          .toList(),
      coverImage:
          ImageAsset.fromJson(json['coverImage'] as Map<String, dynamic>),
      dateOfBirth: json['dateOfBirth'] as String,
      detailDescription: json['detailDescription'] as String,
      firstName: json['firstName'] as String,
      gender: json['gender'] as String,
      lastName: json['lastName'] as String,
      nationality: json['nationality'] as String,
      secondName: json['secondName'] as String,
      shortDescription: json['shortDescription'] as String,
    );

Map<String, dynamic> _$AboutToJson(About instance) => <String, dynamic>{
      '_createdAt': instance.createdAt,
      '_id': instance.id,
      '_rev': instance.rev,
      '_type': instance.type,
      '_updatedAt': instance.updatedAt,
      'age': instance.age,
      'contact': instance.contact.map((e) => e.toJson()).toList(),
      'coverImage': instance.coverImage.toJson(),
      'dateOfBirth': instance.dateOfBirth,
      'detailDescription': instance.detailDescription,
      'firstName': instance.firstName,
      'gender': instance.gender,
      'lastName': instance.lastName,
      'nationality': instance.nationality,
      'secondName': instance.secondName,
      'shortDescription': instance.shortDescription,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      key: json['_key'] as String,
      contactDetails: json['contactDetails'] as String?,
      contactIcon:
          ImageAsset.fromJson(json['contactIcon'] as Map<String, dynamic>),
      contactName: json['contactName'] as String,
      hasLink: json['hasLink'] as bool,
      contactLink: json['contactLink'] as String?,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      '_key': instance.key,
      'contactDetails': instance.contactDetails,
      'contactIcon': instance.contactIcon,
      'contactName': instance.contactName,
      'hasLink': instance.hasLink,
      'contactLink': instance.contactLink,
    };

ImageAsset _$ImageAssetFromJson(Map<String, dynamic> json) => ImageAsset(
      type: json['_type'] as String,
      asset: Asset.fromJson(json['asset'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageAssetToJson(ImageAsset instance) =>
    <String, dynamic>{
      '_type': instance.type,
      'asset': instance.asset,
    };

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      ref: json['_ref'] as String,
      type: json['_type'] as String,
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      '_ref': instance.ref,
      '_type': instance.type,
    };
