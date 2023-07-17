class Joke {
  String? type;
  String? setup;
  String? punchline;
  int? id;

  Joke({this.type, this.setup, this.punchline, this.id});

  Joke.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    setup = json['setup'];
    punchline = json['punchline'];
    id = json['id'];

    /** Cat API **/
    // setup = json['fact'];
    // id = json['length'];
  }
}
