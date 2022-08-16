class newPerson {
  late String _name;
  late int _age;

  void initialize(){    // Constructor of class
    _name = '';
    _age = 0;
  }
}

extension on String {
  bool get hasZero => contains('0');
  void addTextAndPrint(String text) {
    print('$this $text');
  }
}

class MovieModel{
  List<String> imageUrl;
  List<String> title;

  MovieModel(this.imageUrl, this.title);
}

extension on Map<String, dynamic> {
  MovieModel toMovieModel() {
    return MovieModel(
        imageUrl: this['imageUrl'],
        title: this['title']
    );
  }
}
