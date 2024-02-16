// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConnectionStatusStruct extends FFFirebaseStruct {
  ConnectionStatusStruct({
    String? status,
    String? details,
    List<String>? availableHeadsets,
    DateTime? lastChecked,
    int? condition,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _details = details,
        _availableHeadsets = availableHeadsets,
        _lastChecked = lastChecked,
        _condition = condition,
        super(firestoreUtilData);

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  set details(String? val) => _details = val;
  bool hasDetails() => _details != null;

  // "availableHeadsets" field.
  List<String>? _availableHeadsets;
  List<String> get availableHeadsets => _availableHeadsets ?? const [];
  set availableHeadsets(List<String>? val) => _availableHeadsets = val;
  void updateAvailableHeadsets(Function(List<String>) updateFn) =>
      updateFn(_availableHeadsets ??= []);
  bool hasAvailableHeadsets() => _availableHeadsets != null;

  // "lastChecked" field.
  DateTime? _lastChecked;
  DateTime? get lastChecked => _lastChecked;
  set lastChecked(DateTime? val) => _lastChecked = val;
  bool hasLastChecked() => _lastChecked != null;

  // "condition" field.
  int? _condition;
  int get condition => _condition ?? 0;
  set condition(int? val) => _condition = val;
  void incrementCondition(int amount) => _condition = condition + amount;
  bool hasCondition() => _condition != null;

  static ConnectionStatusStruct fromMap(Map<String, dynamic> data) =>
      ConnectionStatusStruct(
        status: data['status'] as String?,
        details: data['details'] as String?,
        availableHeadsets: getDataList(data['availableHeadsets']),
        lastChecked: data['lastChecked'] as DateTime?,
        condition: castToType<int>(data['condition']),
      );

  static ConnectionStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? ConnectionStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'details': _details,
        'availableHeadsets': _availableHeadsets,
        'lastChecked': _lastChecked,
        'condition': _condition,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'details': serializeParam(
          _details,
          ParamType.String,
        ),
        'availableHeadsets': serializeParam(
          _availableHeadsets,
          ParamType.String,
          true,
        ),
        'lastChecked': serializeParam(
          _lastChecked,
          ParamType.DateTime,
        ),
        'condition': serializeParam(
          _condition,
          ParamType.int,
        ),
      }.withoutNulls;

  static ConnectionStatusStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ConnectionStatusStruct(
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        details: deserializeParam(
          data['details'],
          ParamType.String,
          false,
        ),
        availableHeadsets: deserializeParam<String>(
          data['availableHeadsets'],
          ParamType.String,
          true,
        ),
        lastChecked: deserializeParam(
          data['lastChecked'],
          ParamType.DateTime,
          false,
        ),
        condition: deserializeParam(
          data['condition'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ConnectionStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ConnectionStatusStruct &&
        status == other.status &&
        details == other.details &&
        listEquality.equals(availableHeadsets, other.availableHeadsets) &&
        lastChecked == other.lastChecked &&
        condition == other.condition;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([status, details, availableHeadsets, lastChecked, condition]);
}

ConnectionStatusStruct createConnectionStatusStruct({
  String? status,
  String? details,
  DateTime? lastChecked,
  int? condition,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConnectionStatusStruct(
      status: status,
      details: details,
      lastChecked: lastChecked,
      condition: condition,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConnectionStatusStruct? updateConnectionStatusStruct(
  ConnectionStatusStruct? connectionStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    connectionStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConnectionStatusStructData(
  Map<String, dynamic> firestoreData,
  ConnectionStatusStruct? connectionStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (connectionStatus == null) {
    return;
  }
  if (connectionStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && connectionStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final connectionStatusData =
      getConnectionStatusFirestoreData(connectionStatus, forFieldValue);
  final nestedData =
      connectionStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = connectionStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConnectionStatusFirestoreData(
  ConnectionStatusStruct? connectionStatus, [
  bool forFieldValue = false,
]) {
  if (connectionStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(connectionStatus.toMap());

  // Add any Firestore field values
  connectionStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConnectionStatusListFirestoreData(
  List<ConnectionStatusStruct>? connectionStatuss,
) =>
    connectionStatuss
        ?.map((e) => getConnectionStatusFirestoreData(e, true))
        .toList() ??
    [];
