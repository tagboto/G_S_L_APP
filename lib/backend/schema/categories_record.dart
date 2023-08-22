import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categoryName" field.
  String? _categoryName;
  String get categoryName => _categoryName ?? '';
  bool hasCategoryName() => _categoryName != null;

  // "newWords" field.
  int? _newWords;
  int get newWords => _newWords ?? 0;
  bool hasNewWords() => _newWords != null;

  // "wordsStudied" field.
  int? _wordsStudied;
  int get wordsStudied => _wordsStudied ?? 0;
  bool hasWordsStudied() => _wordsStudied != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _categoryName = snapshotData['categoryName'] as String?;
    _newWords = castToType<int>(snapshotData['newWords']);
    _wordsStudied = castToType<int>(snapshotData['wordsStudied']);
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? categoryName,
  int? newWords,
  int? wordsStudied,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'categoryName': categoryName,
      'newWords': newWords,
      'wordsStudied': wordsStudied,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    return e1?.categoryName == e2?.categoryName &&
        e1?.newWords == e2?.newWords &&
        e1?.wordsStudied == e2?.wordsStudied &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality()
      .hash([e?.categoryName, e?.newWords, e?.wordsStudied, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
