import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class RelationshipsRecord extends FirestoreRecord {
  RelationshipsRecord._(
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
      FirebaseFirestore.instance.collection('Relationships');

  static Stream<RelationshipsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RelationshipsRecord.fromSnapshot(s));

  static Future<RelationshipsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RelationshipsRecord.fromSnapshot(s));

  static RelationshipsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RelationshipsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RelationshipsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RelationshipsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RelationshipsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RelationshipsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRelationshipsRecordData({
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

class RelationshipsRecordDocumentEquality
    implements Equality<RelationshipsRecord> {
  const RelationshipsRecordDocumentEquality();

  @override
  bool equals(RelationshipsRecord? e1, RelationshipsRecord? e2) {
    return e1?.signName == e2?.signName && e1?.signImage == e2?.signImage;
  }

  @override
  int hash(RelationshipsRecord? e) =>
      const ListEquality().hash([e?.signName, e?.signImage]);

  @override
  bool isValidKey(Object? o) => o is RelationshipsRecord;
}
