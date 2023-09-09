//const IP_ADDRESS = "http://10.250.1.75:8000/api/";
const IP_ADDRESS = "http://192.168.77.107:8000/api/";

Uri makeUrl(String url) {
  String full_url = IP_ADDRESS + url;
  return Uri.parse(full_url);
}

const requestHeaders = {};

final LOGIN_URL = makeUrl("login/");
final CHECK_ARRIVE_USER_URL = makeUrl("arriver_user");
final PRESENCE_URL = makeUrl("presences");
final LOGOUT_URL = makeUrl("logout");
