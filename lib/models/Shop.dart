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


/** This is an auto generated class representing the Shop type in your schema. */
@immutable
class Shop extends Model {
  static const classType = const _ShopModelType();
  final String id;
  final Persondata? _Persondata;
  final String? _name;
  final String? _type;
  final String? _address;
  final String? _id_photo;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Persondata get persondata {
    try {
      return _Persondata!;
    } catch(e) {
      throw new DataStoreException(DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage, recoverySuggestion: DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion, underlyingException: e.toString());
    }
  }
  
  String get name {
    try {
      return _name!;
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
  
  String get address {
    try {
      return _address!;
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
  
  const Shop._internal({required this.id, required Persondata, required name, required type, required address, required id_photo}): _Persondata = Persondata, _name = name, _type = type, _address = address, _id_photo = id_photo;
  
  factory Shop({String? id, required Persondata Persondata, required String name, required String type, required String address, required String id_photo}) {
    return Shop._internal(
      id: id == null ? UUID.getUUID() : id,
      Persondata: Persondata,
      name: name,
      type: type,
      address: address,
      id_photo: id_photo);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Shop &&
      id == other.id &&
      _Persondata == other._Persondata &&
      _name == other._name &&
      _type == other._type &&
      _address == other._address &&
      _id_photo == other._id_photo;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Shop {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("Persondata=" + (_Persondata != null ? _Persondata!.toString() : "null") + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("type=" + "$_type" + ", ");
    buffer.write("address=" + "$_address" + ", ");
    buffer.write("id_photo=" + "$_id_photo");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Shop copyWith({String? id, Persondata? Persondata, String? name, String? type, String? address, String? id_photo}) {
    return Shop(
      id: id ?? this.id,
      Persondata: Persondata ?? persondata ,
      name: name ?? this.name,
      type: type ?? this.type,
      address: address ?? this.address,
      id_photo: id_photo ?? this.id_photo);
  }
  
  Shop.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _Persondata = json['Persondata']?['serializedData'] != null
        ? Persondata.fromJson(new Map<String, dynamic>.from(json['Persondata']['serializedData']))
        : null,
      _name = json['name'],
      _type = json['type'],
      _address = json['address'],
      _id_photo = json['id_photo'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'Persondata': _Persondata?.toJson(), 'name': _name, 'type': _type, 'address': _address, 'id_photo': _id_photo
  };

  static final QueryField ID = QueryField(fieldName: "shop.id");
  static final QueryField PERSONDATA = QueryField(
    fieldName: "Persondata",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Persondata).toString()));
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField TYPE = QueryField(fieldName: "type");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField ID_PHOTO = QueryField(fieldName: "id_photo");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Shop";
    modelSchemaDefinition.pluralName = "Shops";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Shop.PERSONDATA,
      isRequired: true,
      targetName: "PersondataID",
      ofModelName: (Persondata).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.TYPE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.ADDRESS,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Shop.ID_PHOTO,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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