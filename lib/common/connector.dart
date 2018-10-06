import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceConnector {
  static addBooks() {
    Firestore.instance
        .collection('books')
        .document()
        .setData({'title': 'title', 'author': 'author'});
  }
}
