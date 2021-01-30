library authentication_widget;

class Authentication {
  int _id;
  String _name;
  List<String> _roles;

  int get id => _id;

  String get name => _name;

  Authentication(this._id, this._name, this._roles);

  bool validateRole(String role) {
    return _roles.where((element) => element == role).toList().isNotEmpty;
  }
}
