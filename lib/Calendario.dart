import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Calendario extends StatefulWidget {
  const Calendario({Key key}) : super(key: key);

  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff478ca0),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.account_circle))
        ],
      ),
      body: Container(
          child: Padding(
              padding: EdgeInsets.all(10),
              child: SfCalendar(
                view: CalendarView.month,
                //cellBorderColor: Colors.transparent,
                headerHeight: 60,
                viewHeaderHeight: 60,

                headerStyle: CalendarHeaderStyle(
                  textStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 25,
                    fontWeight: FontWeight.w400
                  )
                ),

                dataSource: MeetingDataSource(getAppointments()),
              ),
            )
        ),
    );
  }
}

List<Appointment> getAppointments(){
  List<Appointment> meetings = <Appointment>[];

  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 1));

  meetings.add(Appointment(
    startTime: startTime,
    endTime: endTime,
    subject: 'Antibiótico',
    color: Colors.blue,
    //recurrenceRule: 'FREQ=DAILY;COUNT=10'
  ));

  return meetings;
}

class MeetingDataSource extends CalendarDataSource{
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
