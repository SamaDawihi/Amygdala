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
  int neutral,
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
  if (neutral > max) {
    max = neutral;
  }

  if (max == happy) {
    return "Happy";
  } else if (max == sad) {
    return "Sad";
  } else if (max == angry) {
    return "Angry";
  } else if (max == relaxed) {
    return "Relaxed";
  } else if (max == neutral) {
    return "Neutral";
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
  int neutral,
  String wanted,
) {
  double result;
  int all = happy + sad + angry + relaxed + neutral;

  if (all == 0) return 0;

  if (wanted == "happy")
    result = happy / all;
  else if (wanted == "sad")
    result = sad / all;
  else if (wanted == "angry")
    result = angry / all;
  else if (wanted == "relaxed")
    result = relaxed / all;
  else if (wanted == "neutral")
    result = neutral / all;
  else
    result = 0;
  result = double.parse(result.toStringAsFixed(3));
  return result;
}

String getMaxEmotionImage(String maxEmotion) {
  if (maxEmotion == "Happy")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/nbozqsm1b5v1/Screenshot_2023-11-30_144219.png';
  else if (maxEmotion == "Sad")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/vekqc4h33egg/Screenshot_2023-11-30_143343.png';
  else if (maxEmotion == "Angry")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/y6lje11r0q50/Screenshot_2023-11-30_141625.png';
  else if (maxEmotion == "Relaxed")
    return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/amygdala-c3do0w/assets/p62m1bigs05n/Screenshot_2023-11-30_143734.png';
  else if (maxEmotion == "Neutral")
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
  String emotion_des;
  switch (emotion) {
    case 'happy':
      emotion_des =
          'genuine happiness, with eyes appearing bright and a smile with slightly parted lips';
      break;
    case 'sad':
      emotion_des =
          'genuine sadness, with eyes appearing downturned and lips slightly downturned at the corners';
      break;
    case 'angry':
      emotion_des =
          'genuine anger, with furrowed brows and lips pressed firmly together';
      break;
    case 'relaxed':
      emotion_des = 'a relaxed expression, with calm eyes and a slight smile';
      break;
    case 'neutral':
      emotion_des =
          'a neutral expression, with relaxed features, a linear lip line, and a neutral gaze';
      break;
    default:
      emotion_des = 'undefined';
  }
  if (disabledProfile != null) {
    final gender = disabledProfile.isMale ? 'male' : 'female';
    final now = DateTime.now();
    final birthDate = disabledProfile.birthday!;
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return 'a $age years old ${disabledProfile.ethnicity} ${gender}, with ${disabledProfile.skinColor} skin color, ${disabledProfile.hairLength} ${disabledProfile.hairColor} hair and ${disabledProfile.eyesColor} eyes, has ${disabledProfile.facialHair} facial hair And seems to be feeling $emotion_des';
  } else
    return 'a man seems to be feeling $emotion_des';
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
