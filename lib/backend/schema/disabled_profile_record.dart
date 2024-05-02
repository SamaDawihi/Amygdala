import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

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

  // "ethnicity" field.
  String? _ethnicity;
  String get ethnicity => _ethnicity ?? '';
  bool hasEthnicity() => _ethnicity != null;

  // "hairColor" field.
  String? _hairColor;
  String get hairColor => _hairColor ?? '';
  bool hasHairColor() => _hairColor != null;

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

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "eyesColor" field.
  String? _eyesColor;
  String get eyesColor => _eyesColor ?? '';
  bool hasEyesColor() => _eyesColor != null;

  // "hairLength" field.
  String? _hairLength;
  String get hairLength => _hairLength ?? '';
  bool hasHairLength() => _hairLength != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  void _initializeFields() {
    _caregiverID = snapshotData['caregiverID'] as DocumentReference?;
    _isMale = snapshotData['isMale'] as bool?;
    _ethnicity = snapshotData['ethnicity'] as String?;
    _hairColor = snapshotData['hairColor'] as String?;
    _skinColor = snapshotData['skinColor'] as String?;
    _facialHair = snapshotData['facialHair'] as String?;
    _name = snapshotData['name'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _eyesColor = snapshotData['eyesColor'] as String?;
    _hairLength = snapshotData['hairLength'] as String?;
    _photo = snapshotData['photo'] as String?;
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
  String? ethnicity,
  String? hairColor,
  String? skinColor,
  String? facialHair,
  String? name,
  DateTime? birthday,
  String? eyesColor,
  String? hairLength,
  String? photo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'caregiverID': caregiverID,
      'isMale': isMale,
      'ethnicity': ethnicity,
      'hairColor': hairColor,
      'skinColor': skinColor,
      'facialHair': facialHair,
      'name': name,
      'birthday': birthday,
      'eyesColor': eyesColor,
      'hairLength': hairLength,
      'photo': photo,
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
        e1?.ethnicity == e2?.ethnicity &&
        e1?.hairColor == e2?.hairColor &&
        e1?.skinColor == e2?.skinColor &&
        e1?.facialHair == e2?.facialHair &&
        e1?.name == e2?.name &&
        e1?.birthday == e2?.birthday &&
        e1?.eyesColor == e2?.eyesColor &&
        e1?.hairLength == e2?.hairLength &&
        e1?.photo == e2?.photo;
  }

  @override
  int hash(DisabledProfileRecord? e) => const ListEquality().hash([
        e?.caregiverID,
        e?.isMale,
        e?.ethnicity,
        e?.hairColor,
        e?.skinColor,
        e?.facialHair,
        e?.name,
        e?.birthday,
        e?.eyesColor,
        e?.hairLength,
        e?.photo
      ]);

  @override
  bool isValidKey(Object? o) => o is DisabledProfileRecord;
}
