class User {
  // Properties
  String _name = '';
  String _email = '';
  String _password = '';
  String _gender = '';
  String _birthDate = '';
  String _favorites = '';

  // Constructors
  User(this._name, this._email, this._password, this._gender, this._birthDate,
      this._favorites);

  User.empty();

  User.fromJson(Map<String, dynamic> json)
      : _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _gender = json['gender'],
        _birthDate = json['birthDate'],
        _favorites = json['favorites'];

  // Methods
  Map<String, String> toJson() => {
    'name': _name,
    'email': _email,
    'password': _password,
    'gender': _gender,
    'birthDate': _birthDate,
    'favorites': _favorites
  };

  // Getters
  get getName => _name;
  get getEmail => _email;
  get getPassword => _password;
  get getGender => _gender;
  get getBirthDate => _birthDate;
  get getFavorites => _favorites;

  //Setters
  set setName(String name) => _name = name;
  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;
  set setGender(String gender) => _gender = gender;
  set setBirthDate(String birthDate) => _birthDate = birthDate;
  set setFavorites(String favorites) => _favorites = favorites;
}
