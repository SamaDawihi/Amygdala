import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionRecord extends FirestoreRecord {
  SessionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "disabledProfile" field.
  DocumentReference? _disabledProfile;
  DocumentReference? get disabledProfile => _disabledProfile;
  bool hasDisabledProfile() => _disabledProfile != null;

  // "startAt" field.
  DateTime? _startAt;
  DateTime? get startAt => _startAt;
  bool hasStartAt() => _startAt != null;

  // "endAt" field.
  DateTime? _endAt;
  DateTime? get endAt => _endAt;
  bool hasEndAt() => _endAt != null;

  // "happy" field.
  int? _happy;
  int get happy => _happy ?? 0;
  bool hasHappy() => _happy != null;

  // "sad" field.
  int? _sad;
  int get sad => _sad ?? 0;
  bool hasSad() => _sad != null;

  // "relaxed" field.
  int? _relaxed;
  int get relaxed => _relaxed ?? 0;
  bool hasRelaxed() => _relaxed != null;

  // "angry" field.
  int? _angry;
  int get angry => _angry ?? 0;
  bool hasAngry() => _angry != null;

  // "neutral" field.
  int? _neutral;
  int get neutral => _neutral ?? 0;
  bool hasNeutral() => _neutral != null;

  void _initializeFields() {
    _disabledProfile = snapshotData['disabledProfile'] as DocumentReference?;
    _startAt = snapshotData['startAt'] as DateTime?;
    _endAt = snapshotData['endAt'] as DateTime?;
    _happy = castToType<int>(snapshotData['happy']);
    _sad = castToType<int>(snapshotData['sad']);
    _relaxed = castToType<int>(snapshotData['relaxed']);
    _angry = castToType<int>(snapshotData['angry']);
    _neutral = castToType<int>(snapshotData['neutral']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Session');

  static Stream<SessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SessionRecord.fromSnapshot(s));

  static Future<SessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SessionRecord.fromSnapshot(s));

  static SessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSessionRecordData({
  DocumentReference? disabledProfile,
  DateTime? startAt,
  DateTime? endAt,
  int? happy,
  int? sad,
  int? relaxed,
  int? angry,
  int? neutral,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'disabledProfile': disabledProfile,
      'startAt': startAt,
      'endAt': endAt,
      'happy': happy,
      'sad': sad,
      'relaxed': relaxed,
      'angry': angry,
      'neutral': neutral,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionRecordDocumentEquality implements Equality<SessionRecord> {
  const SessionRecordDocumentEquality();

  @override
  bool equals(SessionRecord? e1, SessionRecord? e2) {
    return e1?.disabledProfile == e2?.disabledProfile &&
        e1?.startAt == e2?.startAt &&
        e1?.endAt == e2?.endAt &&
        e1?.happy == e2?.happy &&
        e1?.sad == e2?.sad &&
        e1?.relaxed == e2?.relaxed &&
        e1?.angry == e2?.angry &&
        e1?.neutral == e2?.neutral;
  }

  @override
  int hash(SessionRecord? e) => const ListEquality().hash([
        e?.disabledProfile,
        e?.startAt,
        e?.endAt,
        e?.happy,
        e?.sad,
        e?.relaxed,
        e?.angry,
        e?.neutral
      ]);

  @override
  bool isValidKey(Object? o) => o is SessionRecord;
}
