class AppLink{

  //http://localhost:8000/api/admin/login
  static const String linkServerName = "http://localhost:8000/api/admin";


  ///Auth
  static const String login = '$linkServerName/login';
  static const String logout = '$linkServerName/logout';
  static const String changePassword = '$linkServerName/change-password';


  ///Home-City
  static const String getCities = '$linkServerName/cities';
  static const String addCity = '$linkServerName/cities';
  static const String editCity = '$linkServerName/cities/';
  static const String deleteCity = '$linkServerName/cities/';

  ///Home-User
  static const String getUsers = '$linkServerName/admins';
















}