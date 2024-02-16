// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

Future<String> fAuthorize(
  String clientId,
  String clientSecret,
) async {
  // Add your function code here!
  print('fAuthorize Start');
  final wsUrl = Uri.parse('wss://localhost:6868');
  final channel = WebSocketChannel.connect(wsUrl);

  channel.sink.add(
      '{ "id": 6, "jsonrpc": "2.0", "method": "authorize", "params": { "clientId": "$clientId", "clientSecret": "$clientSecret", "debit": 3}}');

  return await channel.stream.first;
}