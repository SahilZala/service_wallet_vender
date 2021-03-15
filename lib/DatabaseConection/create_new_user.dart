import 'dart:convert';
import 'dart:io';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:service_wallet_vender/models/ModelProvider.dart';

class CreateNewUser
{
  String userid,name,mail,city,address,lat,log,mobileno,time,date,profile,activation;


  CreateNewUser(
      this.userid,
      this.name,
      this.mail,
      this.city,
      this.address,
      this.lat,
      this.log,
      this.mobileno,
      this.time,
      this.date,
      this.profile,
      this.activation);

  Future<Map> create()
  async {
    try {

      String graphQLDocument =
      '''mutation CreateUserData(\$userid: String, \$name: String, \$mail: String, \$city: String, \$address: String, \$lat: String, \$log: String, \$mobileno: String, \$time: String, \$date: String, \$profile: String, \$activation: String) {
              createUserData(input: {userid: \$userid, name: \$name, mail: \$mail, city: \$city, address: \$address, lat: \$lat, log: \$log, mobileno: \$mobileno, time: \$time, date: \$date, profile: \$profile, activation: \$activation}) {
                id
                userid
                name
                mail
                city
                address
                lat
                log
                mobileno
                time
                date
                profile
                activation
              }
        }''';

      var operation = Amplify.API.mutate(
          request: GraphQLRequest<String>(document: graphQLDocument, variables: {
            'userid': userid,
            'name': name,
            'mail': mail,
            'city': city,
            'address': address,
            'lat': lat,
            'log': log,
            'mobileno': mobileno,
            'time': time,
            'date': date,
            'profile': profile,
            'activation': activation,
          }));

      var response = await operation.response;
      var data = response.data;

      Map val = json.decode(response.data);
      if(response.data == null)
      {
        return val['createUserData'];
      }
      else{
        return val['createUserData'];
      }

      print('Mutation result: ' + data);

//      print('Mutation result: ' + data.toString());
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
      Map userData = null;
      String graphQLDocument = '''query ListUserDatas {
      listUserDatas {
        items {
          id
          userid
          name
          mail
          city
          address
          lat
          log
          mobileno
          time
          date
          profile
          activation
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

      if(response.data != null)
      {
        Map val = json.decode(response.data);
        List data_list = val['listUserDatas']['items'];

        for(int i=0;i<data_list.length;i++){
          if(data_list[i]['mobileno'] == mobileno){
            userData = data_list[i];
            break;
          }
        }

        print(userData);
        if(userData == null) {
          return userData;
        }
        else{
          return userData;
        }
      }

      print('Query result: ' + data);
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }


  Future<List> getData()
  async {
    try {
      Map userData = null;
      String graphQLDocument = '''query ListUserDatas {
      listUserDatas {
        items {
          id
          userid
          name
          mail
          city
          address
          lat
          log
          mobileno
          time
          date
          profile
          activation
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



      print('Query result: ' + data);
      if(response.data != null)
      {
        Map val = json.decode(response.data);
        List data_list = val['listUserDatas']['items'];

        return data_list;
      }
      else {
        return null;
      }
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
  }

  Future<String> uploadProfileImage(File _image)
  async {
    final key = new DateTime.now().toString();
    Map<String, String> metadata = <String, String>{};
    metadata['name'] = 'filename';
    metadata['desc'] = 'A test file';
    S3UploadFileOptions options = S3UploadFileOptions(accessLevel: StorageAccessLevel.guest, metadata: metadata);
    try {
      UploadFileResult result = await Amplify.Storage.uploadFile(
          key: key,
          local: _image,
          options: options
      );

      GetUrlResult re = await Amplify.Storage.getUrl(key: result.key);
      print(re.url);

      if(re.url.isEmpty){
        return null;
      }
      else{
        return re.url.toString();
      }
    } on StorageException catch (e) {
      print(e.message);
      return null;
    }
  }

  String getProfile()
  {
    return profile;
  }

  void setProfile(String profile)
  {
    this.profile = profile;
  }


  void getStreamData()
  {
    const onCreateMessage = '''subscription onCreateUserData {
      onCreateUserData {
        id
      }
    }''';

    var a = Amplify.API.subscribe(request: GraphQLRequest(document: onCreateMessage), onData: (data){print(data.data);}, onEstablished: (){print("establish");}, onError: (onError){print(onError);}, onDone: (){});
    print(a.hashCode);
  }
}