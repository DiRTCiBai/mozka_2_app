class Time {
  var now = new DateTime.now();

  String GetDate() {
    return '${now.day.toString()}-${now.month.toString()}-${now.year.toString()}';
  }

  String GetYear() {
    var now = new DateTime.now();
    return now.year.toString();
  }

  String GetMonth() {
    var now = new DateTime.now();
    return now.month.toString();
  }

  String GetDay() {
    var now = new DateTime.now();
    return now.day.toString();
  }

  String GetTimeStamp() {
    return now.toString();
  }

  DateTime GetNow() {
    return now;
  }
}
