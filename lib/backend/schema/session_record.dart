import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SessionRecord extends FirestoreRecord {
  SessionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

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

  // "angry" field.
  int? _angry;
  int get angry => _angry ?? 0;
  bool hasAngry() => _angry != null;

  // "bored" field.
  int? _bored;
  int get bored => _bored ?? 0;
  bool hasBored() => _bored != null;

  // "natural" field.
  int? _natural;
  int get natural => _natural ?? 0;
  bool hasNatural() => _natural != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _startAt = snapshotData['startAt'] as DateTime?;
    _endAt = snapshotData['endAt'] as DateTime?;
    _happy = castToType<int>(snapshotData['happy']);
    _sad = castToType<int>(snapshotData['sad']);
    _angry = castToType<int>(snapshotData['angry']);
    _bored = castToType<int>(snapshotData['bored']);
    _natural = castToType<int>(snapshotData['natural']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Session')
          : FirebaseFirestore.instance.collectionGroup('Session');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Session').doc(id);

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
  DateTime? startAt,
  DateTime? endAt,
  int? happy,
  int? sad,
  int? angry,
  int? bored,
  int? natural,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startAt': startAt,
      'endAt': endAt,
      'happy': happy,
      'sad': sad,
      'angry': angry,
      'bored': bored,
      'natural': natural,
    }.withoutNulls,
  );

  return firestoreData;
}

class SessionRecordDocumentEquality implements Equality<SessionRecord> {
  const SessionRecordDocumentEquality();

  @override
  bool equals(SessionRecord? e1, SessionRecord? e2) {
    return e1?.startAt == e2?.startAt &&
        e1?.endAt == e2?.endAt &&
        e1?.happy == e2?.happy &&
        e1?.sad == e2?.sad &&
        e1?.angry == e2?.angry &&
        e1?.bored == e2?.bored &&
        e1?.natural == e2?.natural;
  }

  @override
  int hash(SessionRecord? e) => const ListEquality().hash(
      [e?.startAt, e?.endAt, e?.happy, e?.sad, e?.angry, e?.bored, e?.natural]);

  @override
  bool isValidKey(Object? o) => o is SessionRecord;
}
