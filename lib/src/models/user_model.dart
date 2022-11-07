class User {
  // Properties
  String _uid = '';
  String _name = '';
  String _email = '';
  String _password = '';
  String _genre = '';
  String _favoritesGenres = '';
  String _bornDate = '';

  // Constructors
  User(this._uid, this._name, this._email, this._password, this._genre,
      this._bornDate, this._favoritesGenres);

  User.empty();

  User.fromJson(Map<String, dynamic> json)
      : _uid = json['uid'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _bornDate = json['bornDate'],
        _favoritesGenres = json['favoritesGenres'];

  // Methods
  Map<String, dynamic> toJson() => {
        'uid': _uid,
        'name': _name,
        'email': _email,
        'password': _password,
        'genre': _genre,
        'bornDate': _bornDate,
        'favoritesGenres': _favoritesGenres
      };

  // Getters and Setters
  get uid => _uid;
  set uid(value) => _uid = value;

  get name => _name;
  set mane(value) => _name = value;

  get email => _email;
  set email(value) => _email = value;

  get password => _password;
  set password(value) => _password = value;

  get genre => _genre;
  set genre(value) => _genre = value;

  get bornDate => _bornDate;
  set bornDate(value) => _bornDate = value;

  get favoritesGenres => _favoritesGenres;
  set favoritesGenres(value) => _favoritesGenres = value;
}
