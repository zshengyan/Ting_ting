class BasicUserInfo {
  String username;
  String nickname;
  String token;

  BasicUserInfo(this.username, this.nickname, this.token);

  factory BasicUserInfo.fromJSON(Map<String, dynamic> json) =>
      BasicUserInfo(json["username"], json["nickname"], json["token"]);
}
