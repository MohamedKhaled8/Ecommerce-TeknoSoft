import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecommerce/core/utils/error/failures.dart';

void handleError(dynamic error) {
  if (error is FirebaseAuthException) {
    throw EFirebaseAuthException(error.code).message;
  } else if (error is FirebaseException) {
    throw EFirebaseException(error.code).message;
  } else if (error is FormatException) {
    throw const TFormatException();
  } else if (error is PlatformException) {
    throw EPlatformException(error.code).message;
  } else {
    throw 'Something went wrong. Please try again.';
  }
}