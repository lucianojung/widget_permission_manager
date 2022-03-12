class Authorization {
  int _id;
  String _name;
  List<dynamic> _roles;

  int get id => _id;

  String get name => _name;

  Authorization(this._id, this._name, this._roles);

  bool validateRole(dynamic role) {
    /// validates that there is a role matching with this Authorization
    return _roles.where((element) => element == role).toList().isNotEmpty;
  }
}
