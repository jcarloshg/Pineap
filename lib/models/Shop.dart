/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Shop type in your schema. */
@immutable
class Shop extends Model {
  static const classType = const _ShopModelType();
  final String id;
  final String? _name;
  final String? _id_photo;
  final String? _type;
  final List<Day>? _schedule;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get name {
    try {
      return _name!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get id_photo {
    try {
      return _id_photo!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get type {
    try {
      return _type!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<Day>? get schedule {
    return _schedule;
  }
  
  const Shop._internal({required this.id, required name, required id_photo, required type, schedule}): _name = name, _id_photo = id_photo, _type = type, _schedule = schedule;
  
  factory Shop({String? id, required String name, required String id_photo, required String type, List<Day>? schedule}) {
    return Shop._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      id_photo: id_photo,
      type: type,
      schedule: schedule != null ? List<Day>.unmodifiable(schedule) : schedule);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shop &&
      id == other.id &&
      _name == other._name &&
      _id_photo == other._id_photo &&
      _type == other._type &&
      DeepCollectionEquality().equals(_schedule, other._schedule);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Shop {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("id_photo=" + "$_id_photo" + ", ");
    buffer.write("type=" + "$_type");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Shop copyWith({String? id, String? name, String? id_photo, String? type, List<Day>? schedule}) {
    return Shop(
      id: id ?? this.id,
      name: name ?? this.name,
      id_photo: id_photo ?? this.id_photo,
      type: type ?? this.type,
      schedule: schedule ?? this.schedule);
  }
  
  Shop.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _id_photo = json['id_photo'],
      _type = json['type'],
      _schedule = json['schedule'] is List
        ? (json['schedule'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Day.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'id_photo': _id_photo, 'type': _type, 'schedule': _schedule?.map((Day? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "shop.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField ID_PHOTO = QueryField(fieldName: "id_photo");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField SCHEDULE = QueryField(
    fieldName: "schedule",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Day).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Shop";
    modelSchemaDefinition.pluralName = "Shops";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.ID_PHOTO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.TYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Shop.SCHEDULE,
      isRequired: false,
      ofModelName: (Day).toString(),
      associatedKey: Day.SHOP
    ));
  });
}

class _ShopModelType extends ModelType<Shop> {
  const _ShopModelType();
  
  @override
  Shop fromJson(Map<String, dynamic> jsonData) {
    return Shop.fromJson(jsonData);
  }
}