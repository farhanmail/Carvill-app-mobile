class LoginRequestModel {
  String username;
  String password;
  String nama;

  LoginRequestModel({
    this.username,
    this.password,
    this.nama,
  });
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
      'nama': nama.trim(),
    };
    return map;
  }
}
