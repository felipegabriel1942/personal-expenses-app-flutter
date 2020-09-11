
class FirebaseException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail já existe!',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida!',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Muitas tentativas, tente novamente mais tarde!',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado!',
    'INVALID_PASSWORD': 'Senha inválida!',
    'USER_DISABLED': 'Usuário desabilitado!',
    'INVALID_EMAIL': 'E-mail inválido!'
  };

  final String key;

  const FirebaseException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return 'Ocorreu um erro na autenticação!';
    }
  }
}
