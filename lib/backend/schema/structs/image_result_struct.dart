// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ImageResultStruct extends FFFirebaseStruct {
  ImageResultStruct({
    String? id,
    String? postResult,
    String? getResult,
    String? image,
    String? result,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _postResult = postResult,
        _getResult = getResult,
        _image = image,
        _result = result,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "postResult" field.
  String? _postResult;
  String get postResult => _postResult ?? '';
  set postResult(String? val) => _postResult = val;
  bool hasPostResult() => _postResult != null;

  // "getResult" field.
  String? _getResult;
  String get getResult => _getResult ?? '';
  set getResult(String? val) => _getResult = val;
  bool hasGetResult() => _getResult != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "result" field.
  String? _result;
  String get result => _result ?? '';
  set result(String? val) => _result = val;
  bool hasResult() => _result != null;

  static ImageResultStruct fromMap(Map<String, dynamic> data) =>
      ImageResultStruct(
        id: data['id'] as String?,
        postResult: data['postResult'] as String?,
        getResult: data['getResult'] as String?,
        image: data['image'] as String?,
        result: data['result'] as String?,
      );

  static ImageResultStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'postResult': _postResult,
        'getResult': _getResult,
        'image': _image,
        'result': _result,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'postResult': serializeParam(
          _postResult,
          ParamType.String,
        ),
        'getResult': serializeParam(
          _getResult,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'result': serializeParam(
          _result,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageResultStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        postResult: deserializeParam(
          data['postResult'],
          ParamType.String,
          false,
        ),
        getResult: deserializeParam(
          data['getResult'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        result: deserializeParam(
          data['result'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageResultStruct &&
        id == other.id &&
        postResult == other.postResult &&
        getResult == other.getResult &&
        image == other.image &&
        result == other.result;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([id, postResult, getResult, image, result]);
}

ImageResultStruct createImageResultStruct({
  String? id,
  String? postResult,
  String? getResult,
  String? image,
  String? result,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageResultStruct(
      id: id,
      postResult: postResult,
      getResult: getResult,
      image: image,
      result: result,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageResultStruct? updateImageResultStruct(
  ImageResultStruct? imageResult, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageResult
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageResultStructData(
  Map<String, dynamic> firestoreData,
  ImageResultStruct? imageResult,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageResult == null) {
    return;
  }
  if (imageResult.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageResult.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageResultData =
      getImageResultFirestoreData(imageResult, forFieldValue);
  final nestedData =
      imageResultData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageResult.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageResultFirestoreData(
  ImageResultStruct? imageResult, [
  bool forFieldValue = false,
]) {
  if (imageResult == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageResult.toMap());

  // Add any Firestore field values
  imageResult.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageResultListFirestoreData(
  List<ImageResultStruct>? imageResults,
) =>
    imageResults?.map((e) => getImageResultFirestoreData(e, true)).toList() ??
    [];
