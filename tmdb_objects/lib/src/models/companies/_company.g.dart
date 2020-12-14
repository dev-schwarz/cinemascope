// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    id: json['id'] as int,
    name: json['name'] as String,
    description: json['description'] as String,
    headquarters: json['headquarters'] as String,
    homepage: json['homepage'] as String,
    originCountry: json['origin_country'] as String,
    logoPath: json['logo_path'] as String,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'headquarters': instance.headquarters,
      'homepage': instance.homepage,
      'origin_country': instance.originCountry,
      'logo_path': instance.logoPath,
    };

// **************************************************************************
// ToStringGenerator
// **************************************************************************

String _$CompanyToString(Company o) {
  return """Company{
  id: ${o.id},
  name: ${o.name},
  description: ${o.description},
  headquarters: ${o.headquarters},
  homepage: ${o.homepage},
  originCountry: ${o.originCountry},
  logoPath: ${o.logoPath},
}""";
}
