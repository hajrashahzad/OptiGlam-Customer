class AuthenticationFailure {
  final String message;

  const AuthenticationFailure([this.message = 'An unknown error occured.']);

  factory AuthenticationFailure.code(String code) {
    switch(code){
      case 'weak-password': return const AuthenticationFailure('Please enter a stronger password');
      case 'invalid-email': return const AuthenticationFailure('Please enter a valid email');
      case 'email-already-in-use': return const AuthenticationFailure('An account for this email already exists');
      case 'operation-now-allowed': return const AuthenticationFailure('Operation not allowed. Please contact customer support');
      case 'user-disabled': return const AuthenticationFailure('This user has been disabled. Please contact support for help.');
      default: return const AuthenticationFailure('');
    }
  }
}