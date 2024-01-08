class FileModel {
  final int id;
  final String fileName;
  final String path;
  final String createdDate;
  // final int state;
  final int groupID;

  FileModel({
    required this.id,
    required this.fileName,
    required this.path,
    required this.createdDate,
    // required this.state,
    required this.groupID,
  });

  factory FileModel.fromJson(Map<String, dynamic> jsonData) {
    return FileModel(
      id: jsonData['id'],
      fileName: jsonData['file_name'],
      path: jsonData['path'],
      createdDate: jsonData['created_at'],
      // state: jsonData['state'],
      groupID: jsonData['group_id'],
    );
  }
}
