import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cable/model/user.dart';

class PreferenceManager {
  static void saveDetails(User user) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("firstname", user.firstname);
    await sharedPreferences.setString("lastname", user.lastname);
    await sharedPreferences.setString("company", user.company);
    await sharedPreferences.setString("phone", user.phone);
    await sharedPreferences.setString("email", user.email);
    await sharedPreferences.setString("password", user.password);
    await sharedPreferences.setString("user_id", user.user_id);
    await sharedPreferences.setString("b_firstname", user.b_firstname);
    await sharedPreferences.setString("b_lastname", user.b_lastname);
    await sharedPreferences.setString("b_address", user.b_address);
    await sharedPreferences.setString("b_city", user.b_city);
    await sharedPreferences.setString("b_country", user.b_country);
    await sharedPreferences.setString("b_state", user.b_state);
    await sharedPreferences.setString("b_zipcode", user.b_zipcode);
    await sharedPreferences.setString("b_phone", user.b_phone);
    await sharedPreferences.setString("s_firstname", user.s_firstname);
    await sharedPreferences.setString("s_lastname", user.s_lastname);
    await sharedPreferences.setString("s_address", user.s_address);
    await sharedPreferences.setString("s_city", user.s_city);
    await sharedPreferences.setString("s_country", user.s_country);
    await sharedPreferences.setString("s_state", user.s_state);
    await sharedPreferences.setString("s_zipcode", user.s_zipcode);
    await sharedPreferences.setString("s_phone", user.s_phone);
  }

  static Future<User> getDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String firstname = sharedPreferences.getString("firstname") ?? null;
    String lastname = sharedPreferences.getString("lastname") ?? null;
    String company = sharedPreferences.getString("company") ?? null;
    String phone = sharedPreferences.getString("phone") ?? null;
    String email = sharedPreferences.getString("email") ?? null;
    String password = sharedPreferences.getString("password") ?? null;
    String user_id = sharedPreferences.getString("user_id") ?? null;
    String b_firstname = sharedPreferences.getString("b_firstname") ?? null;
    String b_lastname = sharedPreferences.getString("b_lastname") ?? null;
    String b_address = sharedPreferences.getString("b_address") ?? null;
    String b_city = sharedPreferences.getString("b_city") ?? null;
    String b_country = sharedPreferences.getString("b_country") ?? null;
    String b_state = sharedPreferences.getString("b_state") ?? null;
    String b_zipcode = sharedPreferences.getString("b_zipcode") ?? null;
    String b_phone = sharedPreferences.getString("b_phone") ?? null;
    String s_firstname = sharedPreferences.getString("s_firstname") ?? null;
    String s_lastname = sharedPreferences.getString("s_lastname") ?? null;
    String s_address = sharedPreferences.getString("s_address") ?? null;
    String s_city = sharedPreferences.getString("s_city") ?? null;
    String s_country = sharedPreferences.getString("s_country") ?? null;
    String s_state = sharedPreferences.getString("s_state") ?? null;
    String s_zipcode = sharedPreferences.getString("s_zipcode") ?? null;
    String s_phone = sharedPreferences.getString("s_phone") ?? null;
     

    return User(firstname, lastname, company, phone, email, password, user_id, b_firstname, b_lastname, b_address, b_city, b_country, b_state, b_zipcode, b_phone, s_firstname, s_lastname, s_address, s_city, s_country, s_state, s_zipcode, s_phone);
  }

  static removeDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
