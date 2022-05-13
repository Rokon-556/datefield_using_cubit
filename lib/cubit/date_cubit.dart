import 'package:bloc/bloc.dart';
import 'package:date_field_practice/model/date_model.dart';
import 'package:meta/meta.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateModel> {
  String? nextDate;
  String? curDate;
  //var nextDate=DateTime.now().add(const Duration(days: 7)).toString();
  //var currentDate=DateTime.now().toString();
  DateCubit({this.curDate, this.nextDate})
      : super(DateModel(firstDate: '', nextDate: ''));


  void getCurrentDate() {
    nextDate = nextDate ?? '';
    curDate = DateTime.now().toString();
    print('cur');
    emit(DateModel(firstDate: curDate!, nextDate: nextDate!));
    //emit(DateModel(''));
    print('currentDate:$curDate');
  }

  void getNextDate() {
    curDate = curDate ?? '';
    nextDate = DateTime.now().add(const Duration(days: 7)).toString();

    emit(DateModel(firstDate: curDate!, nextDate: nextDate!));
    //emit(DateModel(''));
    print('nextDate:$nextDate');
  }

  void clearData() {
    nextDate = null;
    curDate = null;
    emit(DateModel(firstDate: '', nextDate: ''));
  }
}
