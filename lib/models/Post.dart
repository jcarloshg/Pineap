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


/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _last_name;
  final String? _first_name;
  final TemporalDateTime? _birthday;
  final String? _role;
  final String? _email;
  final List<Comment>? _comments;

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
  
  List<Comment>? get comments {
    return _comments;
  }
  
  const Post._internal({required this.id, required last_name, required first_name, birthday, required role, required email, comments}): _last_name = last_name, _first_name = first_name, _birthday = birthday, _role = role, _email = email, _comments = comments;
  
  factory Post({String? id, required String last_name, required String first_name, TemporalDateTime? birthday, required String role, required String email, List<Comment>? comments}) {
    return Post._internal(
      id: id == null ? UUID.getUUID() : id,
      last_name: last_name,
      first_name: first_name,
      birthday: birthday,
      role: role,
      email: email,
      comments: comments != null ? List<Comment>.unmodifiable(comments) : comments);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _last_name == other._last_name &&
      _first_name == other._first_name &&
      _birthday == other._birthday &&
      _role == other._role &&
      _email == other._email &&
      DeepCollectionEquality().equals(_comments, other._comments);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("last_name=" + "$_last_name" + ", ");
    buffer.write("first_name=" + "$_first_name" + ", ");
    buffer.write("birthday=" + (_birthday != null ? _birthday!.format() : "null") + ", ");
    buffer.write("role=" + "$_role" + ", ");
    buffer.write("email=" + "$_email");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? id, String? last_name, String? first_name, TemporalDateTime? birthday, String? role, String? email, List<Comment>? comments}) {
    return Post(
      id: id ?? this.id,
      last_name: last_name ?? this.last_name,
      first_name: first_name ?? this.first_name,
      birthday: birthday ?? this.birthday,
      role: role ?? this.role,
      email: email ?? this.email,
      comments: comments ?? this.comments);
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _last_name = json['last_name'],
      _first_name = json['first_name'],
      _birthday = json['birthday'] != null ? TemporalDateTime.fromString(json['birthday']) : null,
      _role = json['role'],
      _email = json['email'],
      _comments = json['comments'] is List
        ? (json['comments'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'last_name': _last_name, 'first_name': _first_name, 'birthday': _birthday?.format(), 'role': _role, 'email': _email, 'comments': _comments?.map((Comment? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "post.id");
  static final QueryField LAST_NAME = QueryField(fieldName: "last_name");
  static final QueryField FIRST_NAME = QueryField(fieldName: "first_name");
  static final QueryField BIRTHDAY = QueryField(fieldName: "birthday");
  static final QueryField ROLE = QueryField(fieldName: "role");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField COMMENTS = QueryField(
    fieldName: "comments",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.LAST_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.FIRST_NAME,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.BIRTHDAY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.ROLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.EMAIL,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Post.COMMENTS,
      isRequired: false,
      ofModelName: (Comment).toString(),
      associatedKey: Comment.POST
    ));
  });
}

class _PostModelType extends ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}