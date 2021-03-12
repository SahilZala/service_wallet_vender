/*
* Copyright 2020 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

// ignore_for_file: public_member_api_docs

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';

/** This is an auto generated class representing the VendorUserData type in your schema. */
@immutable
class VendorUserData extends Model {
  static const classType = const VendorUserDataType();
  final String id;
  final String userid;
  final String name;
  final String mail;
  final String city;
  final String address;
  final String lat;
  final String log;
  final String mobileno;
  final String time;
  final String date;
  final String activation;

  @override
  getInstanceType() => classType;

  @override
  String getId() {
    return id;
  }

  const VendorUserData._internal(
      {@required this.id,
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
      this.activation});

  factory VendorUserData(
      {String id,
      String userid,
      String name,
      String mail,
      String city,
      String address,
      String lat,
      String log,
      String mobileno,
      String time,
      String date,
      String activation}) {
    return VendorUserData._internal(
        id: id == null ? UUID.getUUID() : id,
        userid: userid,
        name: name,
        mail: mail,
        city: city,
        address: address,
        lat: lat,
        log: log,
        mobileno: mobileno,
        time: time,
        date: date,
        activation: activation);
  }

  bool equals(Object other) {
    return this == other;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VendorUserData &&
        id == other.id &&
        userid == other.userid &&
        name == other.name &&
        mail == other.mail &&
        city == other.city &&
        address == other.address &&
        lat == other.lat &&
        log == other.log &&
        mobileno == other.mobileno &&
        time == other.time &&
        date == other.date &&
        activation == other.activation;
  }

  @override
  int get hashCode => toString().hashCode;

  @override
  String toString() {
    var buffer = new StringBuffer();

    buffer.write("VendorUserData {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userid=" + "$userid" + ", ");
    buffer.write("name=" + "$name" + ", ");
    buffer.write("mail=" + "$mail" + ", ");
    buffer.write("city=" + "$city" + ", ");
    buffer.write("address=" + "$address" + ", ");
    buffer.write("lat=" + "$lat" + ", ");
    buffer.write("log=" + "$log" + ", ");
    buffer.write("mobileno=" + "$mobileno" + ", ");
    buffer.write("time=" + "$time" + ", ");
    buffer.write("date=" + "$date" + ", ");
    buffer.write("activation=" + "$activation");
    buffer.write("}");

    return buffer.toString();
  }

  VendorUserData copyWith(
      {String id,
      String userid,
      String name,
      String mail,
      String city,
      String address,
      String lat,
      String log,
      String mobileno,
      String time,
      String date,
      String activation}) {
    return VendorUserData(
        id: id ?? this.id,
        userid: userid ?? this.userid,
        name: name ?? this.name,
        mail: mail ?? this.mail,
        city: city ?? this.city,
        address: address ?? this.address,
        lat: lat ?? this.lat,
        log: log ?? this.log,
        mobileno: mobileno ?? this.mobileno,
        time: time ?? this.time,
        date: date ?? this.date,
        activation: activation ?? this.activation);
  }

  VendorUserData.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userid = json['userid'],
        name = json['name'],
        mail = json['mail'],
        city = json['city'],
        address = json['address'],
        lat = json['lat'],
        log = json['log'],
        mobileno = json['mobileno'],
        time = json['time'],
        date = json['date'],
        activation = json['activation'];

  Map<String, dynamic> toJson() => {
        'id': id,
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
        'activation': activation
      };

  static final QueryField ID = QueryField(fieldName: "vendorUserData.id");
  static final QueryField USERID = QueryField(fieldName: "userid");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField MAIL = QueryField(fieldName: "mail");
  static final QueryField CITY = QueryField(fieldName: "city");
  static final QueryField ADDRESS = QueryField(fieldName: "address");
  static final QueryField LAT = QueryField(fieldName: "lat");
  static final QueryField LOG = QueryField(fieldName: "log");
  static final QueryField MOBILENO = QueryField(fieldName: "mobileno");
  static final QueryField TIME = QueryField(fieldName: "time");
  static final QueryField DATE = QueryField(fieldName: "date");
  static final QueryField ACTIVATION = QueryField(fieldName: "activation");
  static var schema =
      Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "VendorUserData";
    modelSchemaDefinition.pluralName = "VendorUserData";

    modelSchemaDefinition.addField(ModelFieldDefinition.id());

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.USERID,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.NAME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.MAIL,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.CITY,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.ADDRESS,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.LAT,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.LOG,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.MOBILENO,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.TIME,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.DATE,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));

    modelSchemaDefinition.addField(ModelFieldDefinition.field(
        key: VendorUserData.ACTIVATION,
        isRequired: false,
        ofType: ModelFieldType(ModelFieldTypeEnum.string)));
  });
}

class VendorUserDataType extends ModelType<VendorUserData> {
  const VendorUserDataType();

  @override
  VendorUserData fromJson(Map<String, dynamic> jsonData) {
    return VendorUserData.fromJson(jsonData);
  }
}
