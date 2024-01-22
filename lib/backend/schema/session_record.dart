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

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _startAt = snapshotData['startAt'] as DateTime?;
    _endAt = snapshotData['endAt'] as DateTime?;
    _duration = castToType<int>(snapshotData['duration']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Session')
          : FirebaseFirestore.instance.collectionGroup('Session');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('Session').doc();

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
  int? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'startAt': startAt,
      'endAt': endAt,
      'duration': duration,
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
        e1?.duration == e2?.duration;
  }

  @override
  int hash(SessionRecord? e) =>
      const ListEquality().hash([e?.startAt, e?.endAt, e?.duration]);

  @override
  bool isValidKey(Object? o) => o is SessionRecord;
}
