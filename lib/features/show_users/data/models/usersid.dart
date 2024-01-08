class user_Idsmodel {
  List<String>? userIds;

  user_Idsmodel({this.userIds});

  // idusers.fromJson(Map<String, dynamic> json) {
  //   userIds = json['user_ids'].cast<String>();
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_ids'] = this.userIds;
    return data;
  }
}