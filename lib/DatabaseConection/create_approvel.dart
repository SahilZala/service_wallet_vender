import 'dart:convert';
import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/cupertino.dart';

class CreateApprovel
{
  String approvelid,aid,uid,mobileno,panurl,adharurl,adharbackurl,date,time,approved;


  CreateApprovel(
      this.approvelid,
      this.aid,
      this.uid,
      this.mobileno,
      this.panurl,
      this.adharurl,
      this.adharbackurl,
      this.date,
      this.time,
      this.approved);

  Future<Map> createApprovel()
  async {
    try {

      String graphQLDocument =
      '''mutation CreateApprovel(\$approvelid: String, \$aid: String, \$uid: String, \$mobileno: String, \$panurl: String, \$adharurl: String, \$adharbackurl: String, \$date: String, \$time: String, \$approved: String) {
              createApprovel(input: {approvelid: \$approvelid, aid: \$aid, uid: \$uid, mobileno: \$mobileno, panurl: \$panurl, adharurl: \$adharurl, adharbackurl: \$adharbackurl, date: \$date, time: \$time, approved: \$approved}) {
                id
                approvelid
                aid
                uid
                mobileno
                panurl
                adharurl
                adharbackurl
                date
                time
                approved
              }
        }''';

      var operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(document: graphQLDocument, variables: {
            'approvelid': approvelid,
            'aid': aid,
            'uid': uid,
            'mobileno': mobileno,
            'panurl': panurl,
            'adharurl': adharurl,
            'adharbackurl': adharbackurl,
            'date': date,
            'time': time,
            'approved': approved,
          }));

      var response = await operation.response;
      var data = response.data;

      Map val = json.decode(response.data);
      if(response.data == null)
      {
        return val['createApprovel'];
      }
      else{
        return val['createApprovel'];
      }

      print('Mutation result: ' + data.toString());
    } on ApiException catch (e) {
      print('Mutation failed: $e');
    }catch(e)
    {
      print(e);
    }
  }

  Future<Map> checkMobile(String mobileno)
  async {
    try {
      Map approvel_data = null;
      String graphQLDocument = '''query ListApprovels {
      listApprovels {
        items {
          id
          approvelid
          aid
          uid
          mobileno
          panurl
          adharurl
          adharbackurl
          date
          time
          approved
        }
        nextToken
      }
    }''';

      var operation = Amplify.API.query(
          request: GraphQLRequest<String>(
            document: graphQLDocument,
          ));

      var response = await operation.response;
      var data = response.data;

      print(data);

      if(response.data != null)
      {
        Map val = json.decode(response.data);
        List data_list = val['listApprovels']['items'];

        for(int i=0;i<data_list.length;i++){
          if(data_list[i]['mobileno'] == mobileno){
            approvel_data = data_list[i];
            break;
          }
        }

        print(approvel_data);
        if(approvel_data == null) {

          print("not found");

          return approvel_data;
        }
        else{
          print("found");
          return approvel_data;
        }
      }

      print('Query result: ' + data);
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

}

