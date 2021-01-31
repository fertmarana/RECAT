import 'package:firebase_database/firebase_database.dart';
import 'package:recat/ColetaAgendada.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference savePost(Coletas coletas){
  var id = databaseReference.child('/coletas').push();
  id.set(coletas.toJson());
  return id;
}

