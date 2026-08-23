abstract class AuthStates{}

class AuthInitial extends AuthStates{}


class LoginLoading extends AuthStates{}
class LoginSuccess extends AuthStates{}
class LoginError extends AuthStates{
  final String message;
  LoginError(this.message);
}

class RegisterLoading extends AuthStates{}
class RegisterSuccess extends AuthStates{}
class RegisterError extends AuthStates{
  final String message;
  RegisterError(this.message);
}

class LogoutLoading extends AuthStates{}
class LogoutSuccess extends AuthStates{}
class LogoutError extends AuthStates{
  final String message;
  LogoutError(this.message);
}

class IsLoggedIn extends AuthStates{}
class NotLoggedIn extends AuthStates{}