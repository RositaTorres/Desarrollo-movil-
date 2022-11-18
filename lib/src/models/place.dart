class Place {
  // Properties
  String _id = "";
  String _name = "";
  String _city = "";
  String _department = "";
  String _description = "";
  String _urlImage = "";
  int _latitude = 0;
  int _longitude = 0;

  Place.FromJson(String id, Map<String, dynamic> json) {
    _id = id;
    _name = json['Nombre'];
    _city = json['Ciudad'];

    
  }

  // Get methods
  String get getId => _id;
  String get getName => _name;
  String get getCity => _city;
  String get getDepartment => _department;
  String get getDescription => _description;
  String get getUrlImage => _urlImage;
  int get getLatitude => _latitude;
  int get getLongitude => _longitude;

  // Set methods
  set setId(String id) => _id = id;
  set setName(String name) => _name = name;
  set setCity(String city) => _city = city;
  set setDepartment(String department) => _department = department;
  set setDescription(String description) => _description = description;
  set setUrlImage(String urlImage) => _urlImage = urlImage;
  set setLatitude(int latitude) => _latitude = latitude;
  set setLongitude(int longitude) => _longitude = longitude;
}
