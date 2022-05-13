import 'package:date_field_practice/cubit/date_cubit.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'model/date_model.dart';

//import 'package:intl/intl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //initializeDateFormatting('pt', 'BR');
    return BlocProvider(
      create: (context) => DateCubit(),
      child: MaterialApp(
        title: 'Flutter DateTimePicker Demo',
        home: MyHomePage(),
        localizationsDelegates: const [
          GlobalWidgetsLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', 'US')], //, Locale('pt', 'BR')],
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final GlobalKey<FormState> _oFormKey = GlobalKey<FormState>();

  final TextEditingController _currentDateController = TextEditingController();
  final TextEditingController _nextDateController = TextEditingController();

   MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('text');
    //final bloc = BlocProvider.of<>(context);
    //final cubit = BlocProvider.of<DateCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTimePicker'),
        centerTitle: true,
      ),
      body: BlocBuilder<DateCubit, DateModel>(
        builder: (context, state) {
          _currentDateController.text = state.firstDate.toString();
          _nextDateController.text = state.nextDate.toString();
          return SingleChildScrollView(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Form(
              key: _oFormKey,
              child: Column(
                children: <Widget>[
                  DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'yyyy/MM/dd',
                    controller: _currentDateController,
                    //initialValue: _initialValue,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: const Icon(Icons.event),
                    dateLabelText: 'Current Date',
                    onChanged: (val) {
                      //FirstDateChange(val,'');

                       FirstDateChange(val);
                    },
                    // onSaved: (val) {
                    //   // FirstDateChange(val!);
                    // },
                  ),
                  DateTimePicker(
                    type: DateTimePickerType.date,
                    dateMask: 'yyyy/MM/dd',
                    controller: _nextDateController,
                    //initialValue: _initialValue, one cannot give initial value if one has controller
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: const Icon(Icons.event),
                    dateLabelText: 'Next Date',
                    onChanged: (val) {
                      // SecondDateChange(date1:'',date2: val);
                      SecondDateChange(date1: val);
                    },
                    // onSaved: (val) {
                    //   //SecondDateChange(val!);
                    // },
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<DateCubit>().clearData();
                          print('Cleared');
                        },
                        child: const Text('Reset'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            context.read<DateCubit>().getCurrentDate();
                          },
                          child: const Text('Pick Current')),
                      ElevatedButton(
                          onPressed: () {
                            context.read<DateCubit>().getNextDate();
                          },
                          child: const Text('Pick Next')),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
