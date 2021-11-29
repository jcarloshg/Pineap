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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'Day.dart';
import 'Person.dart';
import 'Reservation.dart';
import 'Shop.dart';

export 'Day.dart';
export 'DaysName.dart';
export 'MethodPayment.dart';
export 'Person.dart';
export 'Reservation.dart';
export 'Shop.dart';
export 'StatusReservation.dart';

class ModelProvider implements ModelProviderInterface {
  @override
  String version = "b03eb0e7c146572fe7bbc467c7212d21";
  @override
  List<ModelSchema> modelSchemas = [Day.schema, Person.schema, Reservation.schema, Shop.schema];
  static final ModelProvider _instance = ModelProvider();

  static ModelProvider get instance => _instance;
  
  ModelType getModelTypeByModelName(String modelName) {
    switch(modelName) {
    case "Day": {
    return Day.classType;
    }
    break;
    case "Person": {
    return Person.classType;
    }
    break;
    case "Reservation": {
    return Reservation.classType;
    }
    break;
    case "Shop": {
    return Shop.classType;
    }
    break;
    default: {
    throw Exception("Failed to find model in model provider for model name: " + modelName);
    }
    }
  }
}