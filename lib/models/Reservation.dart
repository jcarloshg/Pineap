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


/** This is an auto generated class representing the Reservation type in your schema. */
@immutable
class Reservation extends Model {
  static const classType = const _ReservationModelType();
  final String id;
  final TemporalTime? _hour;
  final TemporalDate? _date;
  final String? _description;
  final MethodPayment? _methodPayment;
  final StatusReservation? _status;
  final Shop? _Shop;
  final Person? _Person;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  TemporalTime? get hour {
    return _hour;
  }
  
  TemporalDate? get date {
    return _date;
  }
  
  String? get description {
    return _description;
  }
  
  MethodPayment get methodPayment {
    try {
      return _methodPayment!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  StatusReservation get status {
    try {
      return _status!;
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
  
  Person get Person {
    try {
      return _Person!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  const Reservation._internal({required this.id, hour, date, description, required methodPayment, required status, required Shop, required Person}): _hour = hour, _date = date, _description = description, _methodPayment = methodPayment, _status = status, _Shop = Shop, _Person = Person;
  
  factory Reservation({String? id, TemporalTime? hour, TemporalDate? date, String? description, required MethodPayment methodPayment, required StatusReservation status, required Shop Shop, required Person Person}) {
    return Reservation._internal(
      id: id == null ? UUID.getUUID() : id,
      hour: hour,
      date: date,
      description: description,
      methodPayment: methodPayment,
      status: status,
      Shop: Shop,
      Person: Person);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Reservation &&
      id == other.id &&
      _hour == other._hour &&
      _date == other._date &&
      _description == other._description &&
      _methodPayment == other._methodPayment &&
      _status == other._status &&
      _Shop == other._Shop &&
      _Person == other._Person;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Reservation {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("hour=" + (_hour != null ? _hour!.format() : "null") + ", ");
    buffer.write("date=" + (_date != null ? _date!.format() : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("methodPayment=" + (_methodPayment != null ? enumToString(_methodPayment)! : "null") + ", ");
    buffer.write("status=" + (_status != null ? enumToString(_status)! : "null") + ", ");
    buffer.write("Shop=" + (_Shop != null ? _Shop!.toString() : "null") + ", ");
    buffer.write("Person=" + (_Person != null ? _Person!.toString() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Reservation copyWith({String? id, TemporalTime? hour, TemporalDate? date, String? description, MethodPayment? methodPayment, StatusReservation? status, Shop? Shop, Person? Person}) {
    return Reservation(
      id: id ?? this.id,
      hour: hour ?? this.hour,
      date: date ?? this.date,
      description: description ?? this.description,
      methodPayment: methodPayment ?? this.methodPayment,
      status: status ?? this.status,
      Shop: Shop ?? this.Shop,
      Person: Person ?? this.Person);
  }
  
  Reservation.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _hour = json['hour'] != null ? TemporalTime.fromString(json['hour']) : null,
      _date = json['date'] != null ? TemporalDate.fromString(json['date']) : null,
      _description = json['description'],
      _methodPayment = enumFromString<MethodPayment>(json['methodPayment'], MethodPayment.values),
      _status = enumFromString<StatusReservation>(json['status'], StatusReservation.values),
      _Shop = json['Shop']?['serializedData'] != null
        ? Shop.fromJson(new Map<String, dynamic>.from(json['Shop']['serializedData']))
        : null,
      _Person = json['Person']?['serializedData'] != null
        ? Person.fromJson(new Map<String, dynamic>.from(json['Person']['serializedData']))
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'hour': _hour?.format(), 'date': _date?.format(), 'description': _description, 'methodPayment': enumToString(_methodPayment), 'status': enumToString(_status), 'Shop': _Shop?.toJson(), 'Person': _Person?.toJson()
  };

  static final QueryField ID = QueryField(fieldName: "reservation.id");
  static final QueryField HOUR = QueryField(fieldName: "hour");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField METHODPAYMENT = QueryField(fieldName: "methodPayment");
  static final QueryField STATUS = QueryField(fieldName: "status");
  static final QueryField SHOP = QueryField(
    fieldName: "Shop",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Shop).toString()));
  static final QueryField PERSON = QueryField(
    fieldName: "Person",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Person).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Reservation";
    modelSchemaDefinition.pluralName = "Reservations";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reservation.HOUR,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.time)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reservation.DATE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reservation.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reservation.METHODPAYMENT,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Reservation.STATUS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Reservation.SHOP,
      isRequired: true,
      targetName: "ShopID",
      ofModelName: (Shop).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Reservation.PERSON,
      isRequired: true,
      targetName: "PersonID",
      ofModelName: (Person).toString()
    ));
  });
}

class _ReservationModelType extends ModelType<Reservation> {
  const _ReservationModelType();
  
  @override
  Reservation fromJson(Map<String, dynamic> jsonData) {
    return Reservation.fromJson(jsonData);
  }
}