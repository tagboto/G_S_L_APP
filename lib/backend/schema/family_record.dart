import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FamilyRecord extends FirestoreRecord {
  FamilyRecord._(
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
      FirebaseFirestore.instance.collection('Family');

  static Stream<FamilyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FamilyRecord.fromSnapshot(s));

  static Future<FamilyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FamilyRecord.fromSnapshot(s));

  static FamilyRecord fromSnapshot(DocumentSnapshot snapshot) => FamilyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FamilyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FamilyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FamilyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FamilyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFamilyRecordData({
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

class FamilyRecordDocumentEquality implements Equality<FamilyRecord> {
  const FamilyRecordDocumentEquality();

  @override
  bool equals(FamilyRecord? e1, FamilyRecord? e2) {
    return e1?.signName == e2?.signName && e1?.signImage == e2?.signImage;
  }

  @override
  int hash(FamilyRecord? e) =>
      const ListEquality().hash([e?.signName, e?.signImage]);

  @override
  bool isValidKey(Object? o) => o is FamilyRecord;
}
