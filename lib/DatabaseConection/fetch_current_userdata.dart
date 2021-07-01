import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';

class FetchUserData
{
  Future<Map> fetchData(String mobileno)
  async {
    String graphQLDocument = '''
      query MyQuery {
        listUserDatas(filter: {mobileno: {eq: "$mobileno"}}) {
          items {
            activation
            address
            city
            createdAt
            date
            id
            lat
            log
            mail
            mobileno
            name
            profile
            time
            updatedAt
            userid
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



    return val['listUserDatas']['items'][0];
  }
}
// for(int i=0;i<data.length;i++)
// {
// double distanceInMeters = Geolocator.distanceBetween(
// double.parse(data[i]["lat"]), double.parse(data[i]["log"]),
// lat, log);
//
// if (distanceInMeters < 2000) {
//
// for(int j=0;j<value.length;j++)
// {
// if(data[i]['servicename'] == value[j]['servicename'] && data[i]['cartype'] == value[j]['cartype'])
// {
// rectifiedList.add(data[i]);
// }
// }
// //
// }
// }
