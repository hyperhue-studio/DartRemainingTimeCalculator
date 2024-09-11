import 'dart:io';

void main() {
  String? time24Str;
  bool validTime = false;

  while (!validTime) {
    stdout.write('Enter a time in 24-hour format (HH:mm:ss): ');
    time24Str = stdin.readLineSync();

    try {
      List<String> timeParts = time24Str!.split(':');
      int hour24 = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);
      int seconds = int.parse(timeParts[2]);

      if (hour24 >= 0 &&
          hour24 <= 23 &&
          minutes >= 0 &&
          minutes <= 59 &&
          seconds >= 0 &&
          seconds <= 59) {
        validTime = true;

        int hour12 = (hour24 > 12) ? hour24 - 12 : hour24;
        String period = (hour24 >= 12) ? 'PM' : 'AM';

        int hoursRemaining = (hour12 == 12) ? 12 - 1 : 12 - hour12 - 1;
        int minutesRemaining = 60 - minutes - 1;
        int secondsRemaining = 60 - seconds;

        print(
            'There are $hoursRemaining hours, $minutesRemaining minutes, and $secondsRemaining seconds until the entered time in 12-hour format $period.');
      } else {
        print('The entered time is not valid.');
      }
    } catch (e) {
      print('Error: Enter a valid time in format HH:mm:ss.');
    }
  }
}
