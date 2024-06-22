class DateOperations {
  static final DateOperations instance = DateOperations();
  String calculateDaysUntil(DateTime futureDate) {
    DateTime currentDate = DateTime.now();
    Duration difference = futureDate.difference(currentDate);
    return (difference.inDays + 1).toString();
  }

  String formatDateBr(DateTime date) {
    //formatar data para br e colocar 0 no dia se for menor que 10
    String dia = date.day.toString();
    String mes = date.month.toString();
    String ano = date.year.toString();
    if (dia.length == 1) {
      dia = '0$dia';
    }
    if (mes.length == 1) {
      mes = '0$mes';
    }
    return '$dia/$mes/$ano';
  }
}
