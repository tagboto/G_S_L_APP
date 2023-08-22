import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class AlphabetsRecord extends FirestoreRecord {
  AlphabetsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "signName" field.
  String? _signName;
  String get signName => _signName ?? '';
  bool hasSignName() => _signName != null;

  // "signImage" field.
  String? _signImage;
  String get signImage => _signImage ?? '';
  bool hasSignImage() => _signImage != null;

  void _initializeFields() {
    _signName = snapshotData['signName'] as String?;
    _signImage = snapshotData['signImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Alphabets');

  static Stream<AlphabetsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlphabetsRecord.fromSnapshot(s));

  static Future<AlphabetsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlphabetsRecord.fromSnapshot(s));

  static AlphabetsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AlphabetsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlphabetsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlphabetsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlphabetsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlphabetsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlphabetsRecordData({
  String? signName,
  String? signImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'signName': signName,
      'signImage': signImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlphabetsRecordDocumentEquality implements Equality<AlphabetsRecord> {
  const AlphabetsRecordDocumentEquality();

  @override
  bool equals(AlphabetsRecord? e1, AlphabetsRecord? e2) {
    return e1?.signName == e2?.signName && e1?.signImage == e2?.signImage;
  }

  @override
  int hash(AlphabetsRecord? e) =>
      const ListEquality().hash([e?.signName, e?.signImage]);

  @override
  bool isValidKey(Object? o) => o is AlphabetsRecord;
}
