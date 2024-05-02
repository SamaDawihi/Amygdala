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

Future<String> aGetCortexInfo() async {
  // Add your function code here!
  try {
    print('aGetCortexInfo Start');
    final wsUrl = Uri.parse('wss://localhost:6868');
    final channel = WebSocketChannel.connect(wsUrl);

    // Send the request
    channel.sink.add('{"id":1,"jsonrpc":"2.0","method":"getCortexInfo"}');

    // Wait for response
    final response = await channel.stream.first;

    // Close the channel
    await channel.sink.close();

    return response;
  } catch (e) {
    // Handle connection failure
    return '{"error": "Connection failed"}';
  }
}
