import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterappchallenge/Core/Models/image_reference.dart';
import 'package:flutterappchallenge/Core/services/firestore_path.dart';

class FirestoreService {
  // Sets the avatar download url
  Future<void> setAvatarReference({
    @required String uid,
    @required ImageReference avatarReference,
  }) async {
    final path = FirestorePath.avatar(uid);
    final reference = Firestore.instance.document(path);
    await reference.setData(avatarReference.toMap());
  }

  // Reads the current avatar download url
  Stream<ImageReference> avatarReferenceStream({
    @required String uid,
  }) {
    final path = FirestorePath.avatar(uid);
    final reference = Firestore.instance.document(path);
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) => ImageReference.fromMap(snapshot.data));
  }
}
