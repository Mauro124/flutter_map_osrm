// ignore_for_file: constant_identifier_names

enum ErrorCode {
  ACCOUNT_ALREADY_EXISTS('La cuenta ya existe.'),
  ACCOUNT_NOT_FOUND('La cuenta no existe.'),
  INVALID_EMAIL('El email es inválido.'),
  INVALID_PASSWORD('La contraseña es inválida.'),
  UNAUTHORIZED('No autorizado.'),
  // Generic error.
  UNEXPECTED_ERROR('Ups, algo salió mal.'),
  FORMAT_EXCEPTION('Error de formato.'),
  CACHE_ERROR('Error de caché.'),

  //Products
  PRODUCT_NOT_FOUND('El producto no existe.'),
  PRODUCT_ALREADY_EXISTS('El producto ya existe.'),
  PRODUCT_INVALID('El producto es inválido.');

  final String description;
  const ErrorCode(this.description);
}
