import 'package:ecommerce/services/firestore_service.dart';
import 'package:ecommerce/services/storage_service.dart';
import 'package:ecommerce/view/bag_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final databaseProvider = Provider<FirestoreService?>((ref) {
  final auth = ref.watch(authStateChangesProvider);

  String? uid = auth.asData?.value?.uid;
  if (uid != null) {
    return FirestoreService(uid: uid);
  }
  return null;
});

final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthProivder).authStateChanges();
});

final firebaseAuthProivder =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final storageProvider = Provider<StorageService?>((ref) {
  final auth = ref.watch(authStateChangesProvider);
  String? uid = auth.asData?.value?.uid;
  if (uid != null) {
    return StorageService(uid: uid);
  }
  return null;
});

final bagProvider = ChangeNotifierProvider<BagViewModel>((ref) {
  return BagViewModel();
});
