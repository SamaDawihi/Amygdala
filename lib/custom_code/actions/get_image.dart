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

Future<ImageResultStruct> getImage(ImageResultStruct imageResult) async {
  // Add your function code here!
  try {
    if (imageResult.id.isEmpty) {
      return ImageResultStruct(
          result: 'ID is null. Unable to make GET request.');
    }

    // Make GET request
    var getResponse = await http.get(
      Uri.parse(
          'https://corsproxy.io/api?url=https://api.replicate.com/v1/predictions/${imageResult.id}'),
      headers: {
        'Authorization': FFAppState().imageGenerationToken,
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': 'https://amygdala.flutterflow.app',
        'Origin': 'https://amygdala.flutterflow.app',
      },
    );

    if (getResponse.statusCode == 200) {
      var getResponseBody = jsonDecode(getResponse.body);
      imageResult.getResult = getResponseBody;
      imageResult.image = getResponseBody['urls']['get'] ?? '';
      imageResult.result =
          'Image path generated. . Status code: ${getResponse.statusCode}';
      return imageResult;
    } else {
      return ImageResultStruct(
          result:
              'Failed to get Image. Status code: ${getResponse.statusCode}');
    }
  } catch (e) {
    return ImageResultStruct(result: 'Error getting Image: $e');
  }
}
