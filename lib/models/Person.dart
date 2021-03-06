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


/** This is an auto generated class representing the Person type in your schema. */
@immutable
class Person extends Model {
  static const classType = const _PersonModelType();
  final String id;
  final String? _last_name;
  final String? _first_name;
  final TemporalDateTime? _birthday;
  final String? _role;
  final String? _email;
  final List<Shop>? _shops;
  final List<Reservation>? _reservations;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String get last_name {
    try {
      return _last_name!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get first_name {
    try {
      return _first_name!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  TemporalDateTime? get birthday {
    return _birthday;
  }
  
  String get role {
    try {
      return _role!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get email {
    try {
      return _email!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  List<Shop>? get shops {
    return _shops;
  }
  
  List<Reservation>? get reservations {
    return _reservations;
  }
  
  const Person._internal({required this.id, required last_name, required first_name, birthday, required role, required email, shops, reservations}): _last_name = last_name, _first_name = first_name, _birthday = birthday, _role = role, _email = email, _shops = shops, _reservations = reservations;
  
  factory Person({String? id, required String last_name, required String first_name, TemporalDateTime? birthday, required String role, required String email, List<Shop>? shops, List<Reservation>? reservations}) {
    return Person._internal(
      id: id == null ? UUID.getUUID() : id,
      last_name: last_name,
      first_name: first_name,
      birthday: birthday,
      role: role,
      email: email,
      shops: shops != null ? List<Shop>.unmodifiable(shops) : shops,
      reservations: reservations != null ? List<Reservation>.unmodifiable(reservations) : reservations);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Person &&
      id == other.id &&
      _last_name == other._last_name &&
      _first_name == other._first_name &&
      _birthday == other._birthday &&
      _role == other._role &&
      _email == other._email &&
      DeepCollectionEquality().equals(_shops, other._shops) &&
      DeepCollectionEquality().equals(_reservations, other._reservations);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Person {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("last_name=" + "$_last_name" + ", ");
    buffer.write("first_name=" + "$_first_name" + ", ");
    buffer.write("birthday=" + (_birthday != null ? _birthday!.format() : "null") + ", ");
    buffer.write("role=" + "$_role" + ", ");
    buffer.write("email=" + "$_email");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Person copyWith({String? id, String? last_name, String? first_name, TemporalDateTime? birthday, String? role, String? email, List<Shop>? shops, List<Reservation>? reservations}) {
    return Person(
      id: id ?? this.id,
      last_name: last_name ?? this.last_name,
      first_name: first_name ?? this.first_name,
      birthday: birthday ?? this.birthday,
      role: role ?? this.role,
      email: email ?? this.email,
      shops: shops ?? this.shops,
      reservations: reservations ?? this.reservations);
  }
  
  Person.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _last_name = json['last_name'],
      _first_name = json['first_name'],
      _birthday = json['birthday'] != null ? TemporalDateTime.fromString(json['birthday']) : null,
      _role = json['role'],
      _email = json['email'],
      _shops = json['shops'] is List
        ? (json['shops'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Shop.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _reservations = json['reservations'] is List
        ? (json['reservations'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Reservation.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'last_name': _last_name, 'first_name': _first_name, 'birthday': _birthday?.format(), 'role': _role, 'email': _email, 'shops': _shops?.map((Shop? e) => e?.toJson()).toList(), 'reservations': _reservations?.map((Reservation? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "person.id");
  static final QueryField LAST_NAME = QueryField(fieldName: "last_name");
  static final QueryField FIRST_NAME = QueryField(fieldName: "first_name");
  static final QueryField BIRTHDAY = QueryField(fieldName: "birthday");
  static final QueryField ROLE = QueryField(fieldName: "role");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField SHOPS = QueryField(
    fieldName: "shops",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Shop).toString()));
  static final QueryField RESERVATIONS = QueryField(
    fieldName: "reservations",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Reservation).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Person";
    modelSchemaDefinition.pluralName = "People";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Person.LAST_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Person.FIRST_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Person.BIRTHDAY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Person.ROLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Person.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Person.SHOPS,
      isRequired: false,
      ofModelName: (Shop).toString(),
      associatedKey: Shop.PERSON
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Person.RESERVATIONS,
      isRequired: false,
      ofModelName: (Reservation).toString(),
      associatedKey: Reservation.PERSON
    ));
  });
}

class _PersonModelType extends ModelType<Person> {
  const _PersonModelType();
  
  @override
  Person fromJson(Map<String, dynamic> jsonData) {
    return Person.fromJson(jsonData);
  }
}