class showusersmodel {
  final String name;
  final String email;

  showusersmodel({required this.name, required this.email});

  factory showusersmodel.fromJson(Map<String, dynamic> jsonData) {
    return showusersmodel(name: jsonData['name'], email: jsonData['email']);
    
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   return data;
  // }
}