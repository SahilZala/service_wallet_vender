import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';

class ActiveDeactive
{
  Future<void> activeDeactive(String mobileno,String id,String active)
  async {
    String graphQLDocument = '''
      mutation MyMutation {
        updateService(input: {id: "$id", activation: "$active"}, condition: {mobileno: {eq: "$mobileno"}}) {
          id
        }
      }
    ''';

    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
        ));


    var response = await operation.response;
    Map val = json.decode(response.data);

    print(val);


  }
}