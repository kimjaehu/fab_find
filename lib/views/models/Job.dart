class Job {
  String title;
  String businessName;
  String location;
  String duration;
  DateTime startDate;
  String workDays;
  String startTime;
  String endTime;
  double hrlyWage;
  DateTime expiry;

  Job(
    this.title,
    this.businessName,
    this.location,
    this.duration,
    this.startDate,
    this.workDays,
    this.startTime,
    this.endTime,
    this.hrlyWage,
    this.expiry,
  );

  Map<String, dynamic> toJson() => {
        'title': title,
        'businessName': businessName,
        'location': location,
        'duration': duration,
        'startDate': startDate,
        'workDays': workDays,
        'scheduleStart': startTime,
        'scheduleEnd': endTime,
        'hrlyWage': hrlyWage,
        'expiry': expiry,
      };
}
