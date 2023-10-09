class Presence {
  int? id;
  String? date_in;
  String? date_out;
  String? created_at;
  String? updated_at;
  int? hours_per_day;

  Presence({
    this.date_in,
    this.date_out,
    this.created_at,
    this.updated_at,
    this.hours_per_day,
  });

  Presence.fromJosn(Map<String, dynamic> json)
      : date_in = json['date_in'],
        date_out = json['date_out'],
        id = json['id'] as int,
        created_at = json['created_at'],
        hours_per_day = json['hours_per_day'],
        updated_at = json['updated_at'];

  String get getCreated_at {
    return created_at!.split(" ")[0];
  }

  String get time_per_day {
    dynamic heure = 0.0;
    var minute = 0.0;
    var seconde = 0.0;
    if (hours_per_day != null) {
      var x = 3602;
      // hours_per_day!;
      heure = x / 3600;
      minute = ((x - (heure * 3600)) / 60);
      seconde = ((x - (heure * 3600)) % 60);
    }
    return "${heure.toStringAsFixed(0)} : ${minute.toStringAsFixed(0)} : ${seconde.toStringAsFixed(0)}";
  }

  String get getDate_in {
    return date_in!.split(" ")[1];
  }

  String get getDate_out {
    return date_out != null ? date_out!.split(" ")[1] : "Au Travail";
  }
}
