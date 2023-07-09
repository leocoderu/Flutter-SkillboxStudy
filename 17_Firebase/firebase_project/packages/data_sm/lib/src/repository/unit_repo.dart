// Packages
import 'package:cloud_firestore/cloud_firestore.dart';

// Layers
import 'package:model/model.dart';

class UnitRepo {
  late CollectionReference<Unit> _units;

  Future<List<Unit>?> getUnits() async {
    _units = await FirebaseFirestore.instance.collection('units').withConverter<Unit>(
      fromFirestore: (snapshot, _) => Unit.fromJson(snapshot.data()!),
      toFirestore: (unit, _) => unit.toJson(),
    );

    QuerySnapshot querySnapshot = await _units.get();
    return querySnapshot.docs.map<Unit>((e) => e.data() as Unit).toList();
  }
}