import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cable/model/user.dart';

class PreferenceManager {
  static void saveDetails(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("user_id", user.user_id.toString());
    await sharedPreferences.setString("firstname", user.firstname);
    await sharedPreferences.setString("lastname", user.lastname);
    await sharedPreferences.setString("email", user.email);
    await sharedPreferences.setString("password", user.password.toString());
    await sharedPreferences.setString("s_phone", user.s_phone);
    await sharedPreferences.setString("s_address", user.s_address).toString();
    await sharedPreferences.setString("s_city", user.s_city).toString();
    await sharedPreferences.setString("s_state", user.s_state.toString());
    await sharedPreferences.setString("s_country", user.s_country).toString();
    await sharedPreferences.setString("s_zipcode", user.s_zipcode).toString();
    
  }

  static Future<User> getDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String user_id = sharedPreferences.getString("user_id") ?? null;
    String firstname = sharedPreferences.getString("firstname") ?? null;
    String lastname = sharedPreferences.getString("lastname") ?? null;
    String email = sharedPreferences.getString("email") ?? null;
    String password = sharedPreferences.getString("password") ?? null;
    String s_phone = sharedPreferences.getString("s_phone") ?? null;
    String s_address = sharedPreferences.getString("s_address") ?? null;
    String s_city = sharedPreferences.getString("s_city") ?? null;
    String s_state = sharedPreferences.getString("s_state") ?? null;
    String s_country = sharedPreferences.getString("s_country") ?? null;
    String s_zipcode = sharedPreferences.getString("s_zipcode") ?? null;
    
     

    return User(user_id,firstname, lastname, email,password,s_phone,s_address,s_city,s_state,s_country,s_zipcode);
  }

  static removeDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
