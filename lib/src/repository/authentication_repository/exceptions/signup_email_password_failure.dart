

class SignUpWithEmailAndPasswordFailure{
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message="An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure('Please enter a strong password');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('An account already exists for email');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation is not allowes please contact support');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure('This user has been disabled please contact support for help');
      default: return const SignUpWithEmailAndPasswordFailure();
    }
  }
}