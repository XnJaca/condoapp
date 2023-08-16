class TipoIdentificacionOptions {
  final int id;
  final String name;

  TipoIdentificacionOptions(this.id, this.name);
}

List<TipoIdentificacionOptions> tipoIdentificacionOptions = [
  TipoIdentificacionOptions(1, 'Cédula'),
  TipoIdentificacionOptions(2, 'Pasaporte'),
  TipoIdentificacionOptions(3, 'Residencia'),
  TipoIdentificacionOptions(4, 'Otro'),
];
