import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:pineap/models_class/person_model.dart';

class DynamoPerson {
  static Future<String> uploadPerson(PersonModel personModel) async {
    String resultado = "";
    try {
      String graphQLDocument = '''
mutation createPersonModel(\$input: CreatePersonInput) {
  createPerson(input: \$input) {
    last_name
    first_name
    birthday
    role
  }
}
          ''';

      final variable = {
        "input": {
          'last_name': personModel.lastName,
          'first_name': personModel.firstName,
          'birthday': personModel.birthday.toString(),
          // 'role': personModel.role,
        }
      };

      var operation = Amplify.API.mutate(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
          variables: variable,
        ),
      );

      var response = await operation.response;
      resultado = response.data;

      print('Mutation result: ' + resultado);
      
    } on ApiException catch (e) {
      print('Mutation failed: $e');
    }
    return resultado;
  }
}



      // mutation createPersonModel(
      //   \$last_name: String!,
      //   \$first_name: String!,
      //   \$birthday: AWSDateTime,
      //   \$role: String!
      //   ) {
      //     createPerson(input: {last_name: \$last_name, first_name: \$first_name, birthday: \$birthday, role: \$role}) {
      //       last_name
      //       first_name
      //       birthday
      //       role
      //     }
      // }