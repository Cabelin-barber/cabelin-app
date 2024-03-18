class DayWeekFormatter {

  static String format(String day) {
    switch (day) {
      case "MONDAY":
        return "segunda-feira";
      case "TUESDAY":
        return "terça-feira";
      case "WEDNESDAY":
        return "quarta-feira";
      case "THURSDAY":
        return "quinta-feira";
      case "FRIDAY":
        return "sexta-feira";
      case "SATURDAY":
        return "sabádo";
      case "SUNDAY":
        return "domingo";
      default:
        return "invalid";
    }
  }
}
