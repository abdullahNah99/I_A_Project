import 'dart:developer';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:i_a_project/core/widgets/custom_button.dart';
import 'package:i_a_project/features/login/data/repos/authentication_repo_impl.dart';

class TestUploadFile extends StatefulWidget {
  final String token;
  const TestUploadFile({super.key, required this.token});

  @override
  State<TestUploadFile> createState() => _TestUploadFileState();
}

class _TestUploadFileState extends State<TestUploadFile> {
  void pickFile() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['pdf', 'docx', 'doc'],
          onFileLoading: (status) {
            log(status.toString());
          });

      if (result != null) {
        // print(result.paths.length);
        // Uint8List fileBytes = result.files.single.bytes!;
        // print('Name = ${result.files[0].name}');
        // print('Bytes = ${result.files[0].bytes}');
        // print('ID = ${result.files[0].identifier}');
        // print('Stream = ${result.files[0].readStream}');
        // print('Size = ${result.files[0].size}');

        await AuthenticationRepoImpl().uploadFile(
          token: widget.token,
          file: result.files.first,
          groupID: 1,
        );
      } else {
        // User canceled the picker
      }
    } catch (ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomButton(
          text: 'Upload',
          color: Colors.green,
          onTap: () {
            pickFile();
          },
        ),
      ),
    );
  }
}
