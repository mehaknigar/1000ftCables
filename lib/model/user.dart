import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String user_id;
  String firstname;
  String lastname;
  String email;
  String password;
  String s_phone;
  String s_address;
  String s_city;
  String s_state;
  String s_country;
  String s_zipcode;
  
  
 
   
 
   

  User( this.user_id,this.firstname,this.lastname,this.email,this.password,this.s_phone,this.s_address,this.s_city,this.s_state,this.s_country,this.s_zipcode);
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
  @override
  String toString() {
    return '$firstname - $email';
  }
}

