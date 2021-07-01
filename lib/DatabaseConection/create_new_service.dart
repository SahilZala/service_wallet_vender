import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

class CreateNewService{
  String approvelid,aid,uid,mobileno,cartype,servicename,description,date,time,price,serviceid,activation;
  String title,discount;

  CreateNewService(
      this.approvelid,
      this.aid,
      this.uid,
      this.mobileno,
      this.cartype,
      this.servicename,
      this.description,
      this.date,
      this.time,
      this.price,
      this.activation,
      this.title,
      this.discount,
      this.serviceid
      );

  Future<Map> create_new_service()
  async {
    try{
      String graphQLDocument =
      '''mutation CreateService(\$approvelid: String, \$aid: String, \$uid: String,\$title: String, \$mobileno: String, \$cartype: String, \$servicename: String, \$description: String, \$date: String, \$time: String, \$price: String, \$discount: String, \$serviceid: String, \$activation: String) {
              createService(input: {approvelid: \$approvelid, aid: \$aid, uid: \$uid, title: \$title, mobileno: \$mobileno, cartype: \$cartype, servicename: \$servicename, description: \$description, date: \$date, time: \$time, price: \$price,discount: \$discount, serviceid: \$serviceid, activation: \$activation}) {
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
                serviceid
                activation
              }
        }''';


      var operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(document: graphQLDocument, variables: {
            'approvelid': approvelid,
            'aid': aid,
            'uid': uid,
            'title': title,
            'mobileno': mobileno,
            'cartype': cartype,
            'servicename': servicename,
            'description': description,
            'date': date,
            'time': time,
            'price': price,
            'discount': discount,
            'serviceid': serviceid,
            'activation': activation,
          }));

      var response = await operation.response;
      var data = response.data;

      print("jnhj");
      print(data);
      Map val = json.decode(response.data);
      if(response.data == null)
      {
        return val['createService'];
      }
      else{
        return val['createService'];
      }
    }
    on StorageException catch (e) {
      print(e.message);
      return null;
    }
    catch(ex)
    {
      print(ex);
    }
  }
}