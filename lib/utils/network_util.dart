import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

class NetworkUtil{
// next three lines makes this class a Singleton

  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();


}
