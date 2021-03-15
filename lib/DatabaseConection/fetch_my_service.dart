import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';

class FetchMyService
{
  static int count = 0;
  Future<List> getData(String userid,String mobileno)
  async {
    var graphQLDocument = '''
      query MyQuery {
      listServices(filter: {mobileno: {eq: "$mobileno"}}) {
        items {
          id
          approvelid
          aid
          uid
          mobileno
          cartype
          servicename
          description
          date
          time
          urls
          price
          activation
        }
      }
    }
    ''';



    var operation = Amplify.API.query(
        request: GraphQLRequest<String>(
          document: graphQLDocument,
        ));

    var response = await operation.response;
    Map val = json.decode(response.data);

    return val["listServices"]["items"];
  }


  Future<List> onDataChange(String userid,String mobileno)
  async {
    const onCreateMessage = '''subscription onCreateService {
      onCreateService {
        servicename
      }
    }''';

    var a = await Amplify.API.subscribe(request: GraphQLRequest(document: onCreateMessage), onData: (data){return getData(userid, mobileno).then((value) => count = value.length);}, onEstablished: (){print("establish");}, onError: (onError){print(onError);}, onDone: (){});
    print(a.hashCode);



    getData(userid, mobileno).then((value){count = value.length;});

    return getData(userid, mobileno);
  }

  int get(){
    return count;
  }
}