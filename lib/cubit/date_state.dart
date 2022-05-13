part of 'date_cubit.dart';

@immutable
abstract class DateState {}

// class DateInitial extends DateState {
//   final String firstdate;
//   final String lastdate;
//   DateInitial({required this.firstdate,required this.lastdate});
// }
class DateInitial extends DateState{
  DateModel date;
  DateInitial(this.date);
}
class FirstDateChange extends DateState{
  final String date1;
  //final String date2;
  FirstDateChange(this.date1);
  //FirstDateChange(this.date1,this.date2);
}
class SecondDateChange extends DateState{
  final String date1;
  //final String date2;
  SecondDateChange({required this.date1});
   //SecondDateChange({required this.date1,required this.date2});
}
