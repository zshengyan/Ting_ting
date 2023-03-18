var userInfo = BasicUserInfo('', '', '','');



class BasicUserInfo {
  String username;
  String password;
  String nickname;
  String token;

  BasicUserInfo(this.username, this.nickname, this.token, this.password);

  factory BasicUserInfo.fromJSON(Map<String, dynamic> json) =>
      BasicUserInfo(json["username"], json["password"], json["nickname"], json["token"]);
}
