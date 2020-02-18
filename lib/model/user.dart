import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String firstname;
  String lastname;
  String company;
  String phone;
  String email;
  String password;
  String user_id;
   
  String b_firstname;
  String b_lastname;
  String b_phone;
  String b_address;
  String b_city;
  String b_country;
  String b_state;
  String b_zipcode;
  String s_firstname;
  String s_lastname;
  String s_phone;
  String s_address;
  String s_city;
  String s_country;
  String s_state;
  String s_zipcode;
   

  User( this.firstname, this.lastname, this.company, this.phone, this.email, this.password, this.user_id, this.b_firstname, 
  this.b_lastname, this.b_phone, this.b_address, this.b_city, this.b_country, this.b_state, this.b_zipcode,
  this.s_firstname, this.s_lastname, this.s_phone, this.s_address, this.s_city, this.s_country, 
  this.s_state, this.s_zipcode, );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  @override
  String toString() {
    return '$firstname - $email';
  }
}

