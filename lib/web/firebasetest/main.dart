import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;

void main() {
  void main() {
    initializeApp(
        apiKey: "YourApiKey",
        authDomain: "YourAuthDomain",
        databaseURL: "YourDatabaseUrl",
        projectId: "YourProjectId",
        storageBucket: "YourStorageBucket");
  }
  fs.Firestore store = firestore();
  fs.CollectionReference ref = store.collection("messages");

  ref.onSnapshot.listen((querySnapshot) {
    querySnapshot.docChanges().forEach((change) {
//      if (change.type == "added") {
      print("changed");
//      }
    });
  });
  ref.get().then((a) {
    print(a);
  });
}
