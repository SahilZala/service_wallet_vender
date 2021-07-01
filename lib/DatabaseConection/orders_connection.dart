import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:geolocator/geolocator.dart';
import 'package:service_wallet_vender/DatabaseConection/fetch_my_service.dart';

class OrdersConnection
{
  Future<List> getData(String userid,String mobileno)
  async {
    var graphQLDocument = '''
      query MyQuery {
      listServices(filter: {mobileno: {eq: "$mobileno"}, aid: {eq: "$userid"}, activation: {eq: "true"}}) {
        items {
          id
          approvelid
          aid
          uid
          title
          mobileno
          cartype
          servicename
          description
          date
          time
          price
          discount
          serviceid
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

    List data = val["listServices"]["items"];
    print('order');
    print(data.length);
    print(data);
    List newdata = new List();
    if(data.length > 1) {

      for (int i = 0; i < data.length - 1; i++) {
        for (int j = i + 1; j < data.length; j++) {
          if (data[i]['cartype'] != data[j]['cartype'] &&
              data[i]['servicename'] != data[j]['servicename']) {
            newdata.add(data[j]);
          }
        }
      }
    }
    else {
      newdata = data;
    }

   // showOrders();
    return newdata;
  }


  Future<List> showOrders(String userid,String mobileno,double lat,double log)
  async {
      List rectifiedList = new List();

      String graphQLDocument = '''
      query MyQuery {
      listOrderss(filter: {activation: {eq: "true"}, status: {eq: "waiting"}}) {
        items {
          activation
          address
          createdAt
          date
          id
          lat
          log
          mobileno
          ondate
          ontime
          orderid
          price
          servicename
          cartype
          status
          takenbyid
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


      List data = val['listOrderss']['items'];

      for(int i=0;i<data.length;i++)
      {
        double distanceInMeters = Geolocator.distanceBetween(
            double.parse(data[i]["lat"]), double.parse(data[i]["log"]),
            lat,log);

        if(distanceInMeters < 2000)
        {
          rectifiedList.add(data[i]);
        }
      }

      return rectifiedList;

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
