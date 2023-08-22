import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class PronounsRecord extends FirestoreRecord {
  PronounsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "signImage" field.
  String? _signImage;
  String get signImage => _signImage ?? '';
  bool hasSignImage() => _signImage != null;

  // "signName" field.
  String? _signName;
  String get signName => _signName ?? '';
  bool hasSignName() => _signName != null;

  void _initializeFields() {
    _signImage = snapshotData['signImage'] as String?;
    _signName = snapshotData['signName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Pronouns');

  static Stream<PronounsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PronounsRecord.fromSnapshot(s));

  static Future<PronounsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PronounsRecord.fromSnapshot(s));

  static PronounsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PronounsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PronounsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PronounsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PronounsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PronounsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPronounsRecordData({
  String? signImage,
  String? signName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'signImage': signImage,
      'signName': signName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PronounsRecordDocumentEquality implements Equality<PronounsRecord> {
  const PronounsRecordDocumentEquality();

  @override
  bool equals(PronounsRecord? e1, PronounsRecord? e2) {
    return e1?.signImage == e2?.signImage && e1?.signName == e2?.signName;
  }

  @override
  int hash(PronounsRecord? e) =>
      const ListEquality().hash([e?.signImage, e?.signName]);

  @override
  bool isValidKey(Object? o) => o is PronounsRecord;
}
