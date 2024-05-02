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

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<ImageResultStruct> postImage(String prompt) async {
  try {
    // Make POST request using AllOrigins proxy
    var postResponse = await http.post(
      Uri.parse(
          //'https://corsproxy.io/api?url=https://api.replicate.com/v1/predictions'),
          'https://api.replicate.com/v1/predictions'),
      headers: {
        'Authorization': FFAppState().imageGenerationToken,
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': 'https://amygdala.flutterflow.app',
        'Origin': 'https://amygdala.flutterflow.app',
      },
      body: jsonEncode({
        'version':
            '39ed52f2a78e934b3ba6e2a89f5b1c712de7dfea535525255b1aa35c5565e08b',
        'input': {'prompt': prompt},
      }),
    );

    if (postResponse.statusCode == 200) {
      var postResponseBody = jsonDecode(postResponse.body);
      var predictionId = postResponseBody['id'];
      print(postResponseBody);
      return ImageResultStruct(
          id: predictionId,
          postResult: postResponseBody,
          result:
              "Done POST Request. . Status code: ${postResponseBody.statusCode}");
    } else {
      return ImageResultStruct(
          result:
              'Failed to make Image POST request. Status code: ${postResponse.statusCode}');
    }
  } catch (e) {
    return ImageResultStruct(result: 'Error making Image POST request: $e');
  }
}
