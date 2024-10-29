String convertDateTimeToReadableFormat(){
  DateTime date = DateTime.now();
  var day =  date.weekday;
  var month = date.month;
  var weekDayNameList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  var monthNameList = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];

  return "${weekDayNameList[day - 1]}, ${monthNameList[month]} ${date.day}";
}