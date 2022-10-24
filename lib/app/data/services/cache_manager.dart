import 'package:get_storage/get_storage.dart';

import '../models/login.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.token.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.token.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.token.toString());
  }

  String? getCookie() {
    final box = GetStorage();
    return box.read('cookie');
  }

  Future<bool> saveLogin(Login login) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.login.toString(), login.toJson());
    return true;
  }

  Map<String, dynamic> getLogin() {
    final box = GetStorage();
    return box.read(CacheManagerKey.login.toString());
  }

  Future<void> removeLogin() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.login.toString());
  }

  // Future<bool> saveTimeline(TimelineResponse timelineResponse) async {
  //   final box = GetStorage();
  //   await box.write(
  //       CacheManagerKey.timeline.toString(), timelineResponse.toJson());
  //   return true;
  // }

  Map<String, dynamic> getTimeline() {
    final box = GetStorage();
    return box.read(CacheManagerKey.timeline.toString());
  }

  Future<void> removeTimeline() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.timeline.toString());
  }

  Future<bool> saveTheme(bool theme) async {
    final box = GetStorage();
    await box.write('ThemeMode', theme);
    return true;
  }

  bool? getTheme() {
    final box = GetStorage();
    return box.read('ThemeMode');
  }
}

enum CacheManagerKey { token, login, timeline }
