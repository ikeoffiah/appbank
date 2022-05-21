class UserModel {
  var id;
  var email;
  var name;
  var access_token;
  var refresh_token;

  UserModel(
      {this.id, this.email, this.name, this.access_token, this.refresh_token});
}
