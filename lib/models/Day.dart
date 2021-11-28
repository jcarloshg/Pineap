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
  final TemporalTime? _hour_open;
  final TemporalTime? _hour_close;
  final String? _dayName;
  final DaysName? _day;
  final bool? _isOpen;
  final Shop? _Shop;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalTime? get hour_open {
    return _hour_open;
  }
  
  TemporalTime? get hour_close {
    return _hour_close;
  }
  
  String get dayName {
    try {
      return _dayName!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  DaysName get day {
    try {
      return _day!;
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
  
  Shop get Shop {
    try {
      return _Shop!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Day._internal({required this.id, hour_open, hour_close, required dayName, required day, required isOpen, required Shop}): _hour_open = hour_open, _hour_close = hour_close, _dayName = dayName, _day = day, _isOpen = isOpen, _Shop = Shop;
  
  factory Day({String? id, TemporalTime? hour_open, TemporalTime? hour_close, required String dayName, required DaysName day, required bool isOpen, required Shop Shop}) {
    return Day._internal(
      id: id == null ? UUID.getUUID() : id,
      hour_open: hour_open,
      hour_close: hour_close,
      dayName: dayName,
      day: day,
      isOpen: isOpen,
      Shop: Shop);
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
      _dayName == other._dayName &&
      _day == other._day &&
      _isOpen == other._isOpen &&
      _Shop == other._Shop;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Day {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hour_open=" + (_hour_open != null ? _hour_open!.format() : "null") + ", ");
    buffer.write("hour_close=" + (_hour_close != null ? _hour_close!.format() : "null") + ", ");
    buffer.write("dayName=" + "$_dayName" + ", ");
    buffer.write("day=" + (_day != null ? enumToString(_day)! : "null") + ", ");
    buffer.write("isOpen=" + (_isOpen != null ? _isOpen!.toString() : "null") + ", ");
    buffer.write("Shop=" + (_Shop != null ? _Shop!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Day copyWith({String? id, TemporalTime? hour_open, TemporalTime? hour_close, String? dayName, DaysName? day, bool? isOpen, Shop? Shop}) {
    return Day(
      id: id ?? this.id,
      hour_open: hour_open ?? this.hour_open,
      hour_close: hour_close ?? this.hour_close,
      dayName: dayName ?? this.dayName,
      day: day ?? this.day,
      isOpen: isOpen ?? this.isOpen,
      Shop: Shop ?? this.Shop);
  }
  
  Day.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hour_open = json['hour_open'] != null ? TemporalTime.fromString(json['hour_open']) : null,
      _hour_close = json['hour_close'] != null ? TemporalTime.fromString(json['hour_close']) : null,
      _dayName = json['dayName'],
      _day = enumFromString<DaysName>(json['day'], DaysName.values),
      _isOpen = json['isOpen'],
      _Shop = json['Shop']?['serializedData'] != null
        ? Shop.fromJson(new Map<String, dynamic>.from(json['Shop']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hour_open': _hour_open?.format(), 'hour_close': _hour_close?.format(), 'dayName': _dayName, 'day': enumToString(_day), 'isOpen': _isOpen, 'Shop': _Shop?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "day.id");
  static final QueryField HOUR_OPEN = QueryField(fieldName: "hour_open");
  static final QueryField HOUR_CLOSE = QueryField(fieldName: "hour_close");
  static final QueryField DAYNAME = QueryField(fieldName: "dayName");
  static final QueryField DAY = QueryField(fieldName: "day");
  static final QueryField ISOPEN = QueryField(fieldName: "isOpen");
  static final QueryField SHOP = QueryField(
    fieldName: "Shop",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Shop).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Day";
    modelSchemaDefinition.pluralName = "Days";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.HOUR_OPEN,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.HOUR_CLOSE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.DAYNAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.DAY,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Day.ISOPEN,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Day.SHOP,
      isRequired: true,
      targetName: "ShopID",
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