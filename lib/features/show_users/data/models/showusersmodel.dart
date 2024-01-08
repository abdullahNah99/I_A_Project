class showusersmodel {
  final int id;
  final String name;
  final String email;

  showusersmodel( {required this.name, required this.email, required this.id});

  factory showusersmodel.fromJson(Map<String, dynamic> jsonData) {
    return showusersmodel(
      id :jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email']);
    
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   return data;
  // }
}