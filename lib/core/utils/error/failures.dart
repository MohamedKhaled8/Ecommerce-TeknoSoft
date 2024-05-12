import 'package:dartz/dartz.dart';

class SignUpWithEmailAndPasswordFailure {
  final String message;

  SignUpWithEmailAndPasswordFailure(
      [this.message = "An unknown error occurred"]);

  factory SignUpWithEmailAndPasswordFailure.withCode(String code) {
    switch (code) {
      case "weak-password":
        return SignUpWithEmailAndPasswordFailure(
            "The password provided is too weak.");
      case "email-already-in-use":
        return SignUpWithEmailAndPasswordFailure(
            "The email address is already in use.");
      case "invalid-email":
        return SignUpWithEmailAndPasswordFailure(
            "The email address is invalid.");
      case "operation-not-allowed":
        return SignUpWithEmailAndPasswordFailure(
            "Email/password accounts are not enabled.");
      case "user-not-found":
        return SignUpWithEmailAndPasswordFailure(
            "No user found for this email.");
      case "user-disabled":
        return SignUpWithEmailAndPasswordFailure(
            "The user account has been disabled.");
      case "too-many-requests":
        return SignUpWithEmailAndPasswordFailure(
            "Too many requests. Try again later.");
      case "network-request-failed":
        return SignUpWithEmailAndPasswordFailure(
            "Network error occurred. Please check your internet connection.");
      default:
        return SignUpWithEmailAndPasswordFailure("An unknown error occurred.");
    }
  }
}

class EFirebaseAuthException implements Exception {
  final String code;

  EFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      default:
        return 'An error occurred while authenticating.';
    }
  }
}

class EFirebaseException implements Exception {
  final String code;

  EFirebaseException(this.code);

  String get message {
    switch (code) {
      default:
        return 'A Firebase related error occurred.';
    }
  }
}

class TFormatException implements Exception {
  const TFormatException();

  String get message => 'Invalid input format.';
}

class EPlatformException implements Exception {
  final String code;

  EPlatformException(this.code);

  String get message {
    switch (code) {
      default:
        return 'A platform related error occurred.';
    }
  }
}
class ErrorMessages {
  static Either<String, Unit> handleError(String error) {
    switch (error) {
      case "invalid_email":
        return left("Invalid email address");
      case "invalid_password":
        return left("Invalid password");
      case "network_error":
        return left("Network error occurred");
      case "server_error":
        return left("Server error occurred");
      case "unauthorized":
        return left("Unauthorized access");
      case "timeout":
        return left("Request timeout");
      case "invalid_data":
        return left("Invalid data received");
      case "not_found":
        return left("Resource not found");
      case "access_denied":
        return left("Access denied");
      case "file_not_found":
        return left("File not found");
      case "permission_denied":
        return left("Permission denied");
      case "empty_response":
        return left("Empty response received");
      case "duplicate_entry":
        return left("Duplicate entry found");
      case "service_unavailable":
        return left("Service unavailable");
      case "bad_request":
        return left("Bad request");
      case "authentication_failed":
        return left("Authentication failed");
      case "data_corrupted":
        return left("Data corrupted");
      case "unknown_host":
        return left("Unknown host");
      case "connection_refused":
        return left("Connection refused");
      case "database_error":
        return left("Database error occurred");
      case "unexpected_error":
        return left("Unexpected error occurred");
      case "forbidden":
        return left("Forbidden");
      case "method_not_allowed":
        return left("Method not allowed");
      case "unsupported_media_type":
        return left("Unsupported media type");
      case "unprocessable_entity":
        return left("Unprocessable entity");
      case "too_many_requests":
        return left("Too many requests");
      case "server_down":
        return left("Server is down");
      default:
        return left("Unknown error occurred");
    }
  }
}
