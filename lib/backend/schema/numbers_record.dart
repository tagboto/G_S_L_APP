import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
class NumbersRecord extends FirestoreRecord {
  NumbersRecord._(
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
      FirebaseFirestore.instance.collection('Numbers');

  static Stream<NumbersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NumbersRecord.fromSnapshot(s));

  static Future<NumbersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NumbersRecord.fromSnapshot(s));

  static NumbersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NumbersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NumbersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NumbersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NumbersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NumbersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNumbersRecordData({
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

class NumbersRecordDocumentEquality implements Equality<NumbersRecord> {
  const NumbersRecordDocumentEquality();

  @override
  bool equals(NumbersRecord? e1, NumbersRecord? e2) {
    return e1?.signName == e2?.signName && e1?.signImage == e2?.signImage;
  }

  @override
  int hash(NumbersRecord? e) =>
      const ListEquality().hash([e?.signName, e?.signImage]);

  @override
  bool isValidKey(Object? o) => o is NumbersRecord;
}
