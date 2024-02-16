import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String getMaxEmotion(
  int happy,
  int sad,
  int angry,
  int relaxed,
  int natural,
) {
  int max = happy;

  if (sad > max) {
    max = sad;
  }
  if (angry > max) {
    max = angry;
  }
  if (relaxed > max) {
    max = relaxed;
  }
  if (natural > max) {
    max = natural;
  }

  if (max == happy) {
    return "Mostly Happy";
  } else if (max == sad) {
    return "Mostly Sad";
  } else if (max == angry) {
    return "Mostly Angry";
  } else if (max == relaxed) {
    return "Mostly Relaxed";
  } else if (max == natural) {
    return "Mostly Neutral";
  } else {
    return "Unknown";
  }
}

bool bci2GetIsUserLogedIn(String json) {
  // return all id {"result":[{"id":"EPOCX-E50207C0","status":"connected"},{"id":"EPOCX-E58207C0"}]}
  final Map<String, dynamic> data = jsonDecode(json);
  final List<dynamic> result = data['result'];
  return result.isNotEmpty;
}

bool bci3GetHasAccessRight(String json) {
  // return all id {"id":3,"jsonrpc":"2.0","result":{"accessGranted":true,"message":"The access right to the application has already been granted."}}
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['accessGranted'];
}

bool checkIfTextMatchRegExp(
  String text,
  String regEx,
) {
  RegExp reg = RegExp(regEx);
  return reg.hasMatch(text);
}

List<String> bci4GetAvailableHeadsetId(String json) {
  // return all id {"result":[{"id":"EPOCX-E50207C0","status":"connected"},{"id":"EPOCX-E58207C0"}]}
  final Map<String, dynamic> data = jsonDecode(json);
  final List<dynamic> result = data['result'];
  final List<String> ids = [];
  for (final item in result) {
    ids.add(item['id']);
  }
  return ids;
}

String bci5GetCortexToken(String json) {
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['cortexToken'];
}

double getEmotionPercentage(
  int happy,
  int sad,
  int angry,
  int relaxed,
  int natural,
  String wanted,
) {
  double result;
  int all = happy + sad + angry + relaxed + natural;

  if (wanted == "happy")
    result = happy / all;
  else if (wanted == "sad")
    result = sad / all;
  else if (wanted == "angry")
    result = angry / all;
  else if (wanted == "relaxed")
    result = relaxed / all;
  else if (wanted == "natural")
    result = natural / all;
  else
    result = 0;
  result = double.parse(result.toStringAsFixed(3));
  return result;
}

String getMaxEmotionImage(String maxEmotion) {
  if (maxEmotion == "Mostly Happy")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nbozqsm1b5v1/Screenshot_2023-11-30_144219.png';
  else if (maxEmotion == "Mostly sad")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/vekqc4h33egg/Screenshot_2023-11-30_143343.png';
  else if (maxEmotion == "Mostly Angry")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/y6lje11r0q50/Screenshot_2023-11-30_141625.png';
  else if (maxEmotion == "Mostly Relaxed")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/p62m1bigs05n/Screenshot_2023-11-30_143734.png';
  else if (maxEmotion == "Mostly Neutral")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/8wiwx0uj13mo/Screenshot_2023-11-30_143523.png';
  else
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nbozqsm1b5v1/Screenshot_2023-11-30_144219.png';
}

String bci6GetSessionId(String json) {
  final Map<String, dynamic> data = jsonDecode(json);
  final dynamic result = data['result'];
  return result['id'];
}

String createImageDescription(
  String emotion,
  DisabledProfileRecord? disabledProfile,
) {
  if (disabledProfile != null) {
    final gender = disabledProfile.isMale ? 'male' : 'female';
    final skinColor = 'white'; //disabledProfile.skincolor
    return 'a ${disabledProfile.age} years old ${disabledProfile.ethnicity} ${gender}, with ${skinColor} skin color, ${disabledProfile.hairColor} hair and ${disabledProfile.eyeColor} eyes, he has ${disabledProfile.facialHair} facial hair. he seems to be feeling $emotion';
  } else
    return 'a man seems to be feeling $emotion';
}

bool bci1GetEmotivIsInstalled(String json) {
  try {
    final Map<String, dynamic> data = jsonDecode(json);

    // Check if "result" key is present
    if (data.containsKey('result')) {
      final dynamic result = data['result'];

      // Check for the required keys to determine if Emotiv is installed
      if (result is Map<String, dynamic> &&
          result.containsKey('buildDate') &&
          result.containsKey('buildNumber') &&
          result.containsKey('version')) {
        print(
            'Emotiv is installed. Build Date: ${result['buildDate']}, Build Number: ${result['buildNumber']}, Version: ${result['version']}');
        return true; // Emotiv is installed
      } else {
        print('Emotiv is not installed. Missing keys in result.');
        return false; // Emotiv is not installed, keys are missing
      }
    } else {
      print('Emotiv is not installed. "result" key is missing.');
      return false; // "result" key is missing
    }
  } catch (e) {
    print('Error occurred. Emotiv is not installed.');
    return false; // Error occurred, indicating Emotiv is not installed
  }
}

String getEmotionByInterestEngagement(
  int interest,
  int engagement,
) {
  final arousal = engagement;
  final valence = interest;
  if (arousal > 4 && arousal < 6 && valence > 4 && valence < 6) {
    return "Natural";
  } else if (arousal >= 5) {
    return (valence >= 5) ? "Happy" : "Angry";
  } else {
    return (valence >= 5) ? "Relaxed" : "Sad";
  }
}
