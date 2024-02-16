import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DisabledProfileRecord extends FirestoreRecord {
  DisabledProfileRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "caregiverID" field.
  DocumentReference? _caregiverID;
  DocumentReference? get caregiverID => _caregiverID;
  bool hasCaregiverID() => _caregiverID != null;

  // "isMale" field.
  bool? _isMale;
  bool get isMale => _isMale ?? false;
  bool hasIsMale() => _isMale != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "ethnicity" field.
  String? _ethnicity;
  String get ethnicity => _ethnicity ?? '';
  bool hasEthnicity() => _ethnicity != null;

  // "hairColor" field.
  String? _hairColor;
  String get hairColor => _hairColor ?? '';
  bool hasHairColor() => _hairColor != null;

  // "eyeColor" field.
  String? _eyeColor;
  String get eyeColor => _eyeColor ?? '';
  bool hasEyeColor() => _eyeColor != null;

  // "skinColor" field.
  String? _skinColor;
  String get skinColor => _skinColor ?? '';
  bool hasSkinColor() => _skinColor != null;

  // "facialHair" field.
  String? _facialHair;
  String get facialHair => _facialHair ?? '';
  bool hasFacialHair() => _facialHair != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _caregiverID = snapshotData['caregiverID'] as DocumentReference?;
    _isMale = snapshotData['isMale'] as bool?;
    _age = castToType<int>(snapshotData['age']);
    _ethnicity = snapshotData['ethnicity'] as String?;
    _hairColor = snapshotData['hairColor'] as String?;
    _eyeColor = snapshotData['eyeColor'] as String?;
    _skinColor = snapshotData['skinColor'] as String?;
    _facialHair = snapshotData['facialHair'] as String?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DisabledProfile');

  static Stream<DisabledProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DisabledProfileRecord.fromSnapshot(s));

  static Future<DisabledProfileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DisabledProfileRecord.fromSnapshot(s));

  static DisabledProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DisabledProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DisabledProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DisabledProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DisabledProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DisabledProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDisabledProfileRecordData({
  DocumentReference? caregiverID,
  bool? isMale,
  int? age,
  String? ethnicity,
  String? hairColor,
  String? eyeColor,
  String? skinColor,
  String? facialHair,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'caregiverID': caregiverID,
      'isMale': isMale,
      'age': age,
      'ethnicity': ethnicity,
      'hairColor': hairColor,
      'eyeColor': eyeColor,
      'skinColor': skinColor,
      'facialHair': facialHair,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class DisabledProfileRecordDocumentEquality
    implements Equality<DisabledProfileRecord> {
  const DisabledProfileRecordDocumentEquality();

  @override
  bool equals(DisabledProfileRecord? e1, DisabledProfileRecord? e2) {
    return e1?.caregiverID == e2?.caregiverID &&
        e1?.isMale == e2?.isMale &&
        e1?.age == e2?.age &&
        e1?.ethnicity == e2?.ethnicity &&
        e1?.hairColor == e2?.hairColor &&
        e1?.eyeColor == e2?.eyeColor &&
        e1?.skinColor == e2?.skinColor &&
        e1?.facialHair == e2?.facialHair &&
        e1?.name == e2?.name;
  }

  @override
  int hash(DisabledProfileRecord? e) => const ListEquality().hash([
        e?.caregiverID,
        e?.isMale,
        e?.age,
        e?.ethnicity,
        e?.hairColor,
        e?.eyeColor,
        e?.skinColor,
        e?.facialHair,
        e?.name
      ]);

  @override
  bool isValidKey(Object? o) => o is DisabledProfileRecord;
}
