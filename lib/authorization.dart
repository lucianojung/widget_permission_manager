class Authorization {
  int _id;
  String _name;
  List<String> _roles;

  int get id => _id;

  String get name => _name;

  Authorization(this._id, this._name, this._roles);

  bool validateRole(String role) {
    return _roles.where((element) => element == role).toList().isNotEmpty;
  }
}
