import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';

class CreateProfession
{

  Future<void> createNewProfession(List<String> _profession_list,Map value)
  async {


    for (int i = 0; i <
        _profession_list.length; i++) {

      print(_profession_list[i]);
      var pid = UUID.getUUID();

      try{
        String graphQLDocument =
        '''mutation CreateProfession(\$professionid: String, \$aid: String, \$uid: String, \$mobileno: String, \$profession: String) {
              createProfession(input: {professionid: \$professionid, aid: \$aid, uid: \$uid, mobileno: \$mobileno, profession: \$profession}) {
                id
                professionid
                aid
                uid
                mobileno
                profession
              }
        }''';


        var operation = Amplify.API.mutate(
            request: GraphQLRequest<String>(document: graphQLDocument, variables: {
              'professionid': pid,
              'aid': value['id'],
              'uid': value['userid'],
              'mobileno': value['mobileno'],
              'profession': _profession_list[i],
            }));

        var response = await operation.response;
        var data = response.data;

        Map val = json.decode(response.data);

        print(val);

      } on ApiException catch (e) {
        print('Mutation failed: $e');
      }catch(e)
      {
        print(e);
      }
    }
  }
}

