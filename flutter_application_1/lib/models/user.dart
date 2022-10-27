class User {
  var _name;
  var _email;
  var _password;
  var _genre;
  var _favoritesGenres;
  var _bornDate;

  User(this._name, this._email, this._password, this._genre, this._bornDate,
      this._favoritesGenres);

  User.Empty();

  User.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _bornDate = json['bornDate'],
        _favoritesGenres = json['favoritesGenres'];

  Map<String, dynamic> ToJson() => {
        'name': _name,
        'email': _email,
        'password': _password,
        'genre': _genre,
        'bornDate': _bornDate,
        'favoritesGenres': _favoritesGenres
      };

  get name => _name;

  set mane(value) {
    _name = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get favoritesGenres => _favoritesGenres;

  set favoritesGenres(value) {
    _favoritesGenres = value;
  }
}