import 'package:json_annotation/json_annotation.dart';

part 'about.g.dart';

@JsonSerializable(explicitToJson: true)
class About {
  @JsonKey(name: '_createdAt')
  final String createdAt;

  @JsonKey(name: '_id')
  final String id;

  @JsonKey(name: '_rev')
  final String rev;

  @JsonKey(name: '_type')
  final String type;

  @JsonKey(name: '_updatedAt')
  final String updatedAt;

  final int age;
  final List<Contact> contact;
  final ImageAsset coverImage;
  final String dateOfBirth;
  final String detailDescription;
  final String firstName;
  final String gender;
  final String lastName;
  final String nationality;
  final String secondName;
  final String shortDescription;

  About({
    required this.createdAt,
    required this.id,
    required this.rev,
    required this.type,
    required this.updatedAt,
    required this.age,
    required this.contact,
    required this.coverImage,
    required this.dateOfBirth,
    required this.detailDescription,
    required this.firstName,
    required this.gender,
    required this.lastName,
    required this.nationality,
    required this.secondName,
    required this.shortDescription,
  });

  factory About.fromJson(Map<String, dynamic> json) => _$AboutFromJson(json);
  Map<String, dynamic> toJson() => _$AboutToJson(this);
}

@JsonSerializable()
class Contact {
  @JsonKey(name: '_key')
  final String key;
  final String? contactDetails;
  final ImageAsset contactIcon;
  final String contactName;
  final bool hasLink;
  final String? contactLink;

  Contact({
    required this.key,
    this.contactDetails,
    required this.contactIcon,
    required this.contactName,
    required this.hasLink,
    this.contactLink,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class ImageAsset {
  @JsonKey(name: '_type')
  final String type;
  final Asset asset;

  ImageAsset({required this.type, required this.asset});

  factory ImageAsset.fromJson(Map<String, dynamic> json) =>
      _$ImageAssetFromJson(json);
  Map<String, dynamic> toJson() => _$ImageAssetToJson(this);
}

@JsonSerializable()
class Asset {
  @JsonKey(name: '_ref')
  final String ref;
  @JsonKey(name: '_type')
  final String type;

  Asset({required this.ref, required this.type});

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);
  Map<String, dynamic> toJson() => _$AssetToJson(this);
}
