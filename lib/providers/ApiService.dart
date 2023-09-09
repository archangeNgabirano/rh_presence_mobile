import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:rh_presence_mobile/model/presence.dart';
import 'package:rh_presence_mobile/routes/api_url.dart';
import 'package:rh_presence_mobile/shared_preference/shared_preference_data.dart';

class ApiService {
  Future<List<Presence>> getListePresence() async {
    try {
      String token = UserSimplePeference.getToken();
      final response = await http.get(PRESENCE_URL, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        List<Presence> list_result =
            result.map((e) => Presence.fromJosn(e)).toList();
        return list_result;
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

final serviceProvider = Provider<ApiService>((ref) => ApiService());
