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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Day type in your schema. */
@immutable
class Day extends Model {
  static const classType = const _DayModelType();
  final String id;
  final String? _hour_open;
  final String? _hour_close;
  final bool? _isOpen;
  final Shop? _shop;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get hour_open {
    try {
      return _hour_open!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get hour_close {
    try {
      return _hour_close!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  bool get isOpen {
    try {
      return _isOpen!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  Shop? get shop {
    return _shop;
  }
  
  const Day._internal({required this.id, required hour_open, required hour_close, required isOpen, shop}): _hour_open = hour_open, _hour_close = hour_close, _isOpen = isOpen, _shop = shop;
  
  factory Day({String? id, required String hour_open, required String hour_close, required bool isOpen, Shop? shop}) {
    return Day._internal(
      id: id == null ? UUID.getUUID() : id,
      hour_open: hour_open,
      hour_close: hour_close,
      isOpen: isOpen,
      shop: shop);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Day &&
      id == other.id &&
      _hour_open == other._hour_open &&
      _hour_close == other._hour_close &&
      _isOpen == other._isOpen &&
      _shop == other._shop;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Day {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hour_open=" + "$_hour_open" + ", ");
    buffer.write("hour_close=" + "$_hour_close" + ", ");
    buffer.write("isOpen=" + (_isOpen != null ? _isOpen!.toString() : "null") + ", ");
    buffer.write("shop=" + (_shop != null ? _shop!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Day copyWith({String? id, String? hour_open, String? hour_close, bool? isOpen, Shop? shop}) {
    return Day(
      id: id ?? this.id,
      hour_open: hour_open ?? this.hour_open,
      hour_close: hour_close ?? this.hour_close,
      isOpen: isOpen ?? this.isOpen,
      shop: shop ?? this.shop);
  }
  
  Day.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hour_open = json['hour_open'],
      _hour_close = json['hour_close'],
      _isOpen = json['isOpen'],
      _shop = json['shop']?['serializedData'] != null
        ? Shop.fromJson(new Map<String, dynamic>.from(json['shop']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hour_open': _hour_open, 'hour_close': _hour_close, 'isOpen': _isOpen, 'shop': _shop?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "day.id");
  static final QueryField HOUR_OPEN = QueryField(fieldName: "hour_open");
  static final QueryField HOUR_CLOSE = QueryField(fieldName: "hour_close");
  static final QueryField ISOPEN = QueryField(fieldName: "isOpen");
  static final QueryField SHOP = QueryField(
    fieldName: "shop",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Shop).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Day";
    modelSchemaDefinition.pluralName = "Days";
    
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
      key: Day.HOUR_OPEN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.HOUR_CLOSE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.ISOPEN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Day.SHOP,
      isRequired: false,
      targetName: "dayShopId",
      ofModelName: (Shop).toString()
    ));
  });
}

class _DayModelType extends ModelType<Day> {
  const _DayModelType();
  
  @override
  Day fromJson(Map<String, dynamic> jsonData) {
    return Day.fromJson(jsonData);
  }
}