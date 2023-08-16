String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu dirección de correo electrónico.';
  }
  if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
      .hasMatch(value)) {
    return 'Ingresa una dirección de correo electrónico válida.';
  }
  return null;
}

String? validateEmptyInput(String? value) {
  if (value == null || value.isEmpty) {
    return 'Este campo no puede estar vacio.';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, ingresa tu contraseña.';
  }
  // if (value.length < 6) {
  //   return 'La contraseña debe tener al menos 6 caracteres.';
  // }
  return null;
}
