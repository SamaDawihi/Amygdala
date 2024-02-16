import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _isLightMode = true;
  bool get isLightMode => _isLightMode;
  set isLightMode(bool value) {
    _isLightMode = value;
  }

  List<String> _emotions = ['Happy', 'Angry', 'Natural', 'Sad', 'Relaxed'];
  List<String> get emotions => _emotions;
  set emotions(List<String> value) {
    _emotions = value;
  }

  void addToEmotions(String value) {
    _emotions.add(value);
  }

  void removeFromEmotions(String value) {
    _emotions.remove(value);
  }

  void removeAtIndexFromEmotions(int index) {
    _emotions.removeAt(index);
  }

  void updateEmotionsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _emotions[index] = updateFn(_emotions[index]);
  }

  void insertAtIndexInEmotions(int index, String value) {
    _emotions.insert(index, value);
  }

  String _clientId = 'CkXnClNZKVdp00AN3EsXWwXtWhocR57vkG46NEx0';
  String get clientId => _clientId;
  set clientId(String value) {
    _clientId = value;
  }

  String _clientSecret =
      'uNvvXqglXVktp3nlzN7zNjLragEktCBYRoLVQWfrF0mkC1l3c3Lbnc91gdjRpfgl6tX0VpMKVFq6Q7dknHN4McGxFLu99kLGIy9Mi61R9mGQfK4Nshqbc1M3JjwXoP3W';
  String get clientSecret => _clientSecret;
  set clientSecret(String value) {
    _clientSecret = value;
  }
}
