class CalculoImc {
  static String resultadoImc(double resultado) {
    if (resultado < 18.6) {
      return 'Abaixo do peso (${resultado.toStringAsPrecision(3)})';
    } else if (resultado >= 18.6 && resultado < 24.9) {
      return 'Peso Ideal (${resultado.toStringAsPrecision(3)})';
    } else if (resultado >= 24.9 && resultado < 29.9) {
      return 'Levemente Acima do Peso (${resultado.toStringAsPrecision(3)})';
    } else if (resultado >= 29.9 && resultado < 34.9) {
      return 'Obesidade Grau I (${resultado.toStringAsPrecision(3)})';
    } else if (resultado >= 34.9 && resultado < 39.9) {
      return 'Obesidade Grau II (${resultado.toStringAsPrecision(3)})';
    } else {
      return 'Obesidade Grau III (${resultado.toStringAsPrecision(3)})';
    }
  }
}
