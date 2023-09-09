import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rh_presence_mobile/model/presence.dart';
import 'package:rh_presence_mobile/providers/ApiService.dart';

final serviceDataProvider = FutureProvider<List<Presence>>((ref) async {
  return ref.watch(serviceProvider).getListePresence();
});
