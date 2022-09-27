import 'package:aug_prj/models/loginmodel.dart';
import 'package:flutter/material.dart';
import '../Utils/http_error.dart';
import '../repository/login_repository.dart';

class EditPostPage extends StatefulWidget {
  const EditPostPage({ 
    Key? key,
     this.login,
  }) : super(key: key);

  final LogIn? login;

  @override
  State<EditPostPage> createState() => _EditPostPageState();
}

class _EditPostPageState extends State<EditPostPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.login?.firstname);
    passwordController = TextEditingController(text: widget.login?.lastname);
  }

  Future<void> updatePost() async {
    final post = widget.login;
    final id = post?.id;
    if (id == null) return;

    final updatedPost = LogIn(
      firstname: usernameController.text,
      lastname: passwordController.text,
      id:id,
    );
    try {
      final result = await LoginRepository.updateList(id, updatedPost);
      print(result.toJson());
      Navigator.pop(context, result);
    } on HttpError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                maxLines: 2,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: 'firstname',
                  labelText: 'firstname',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
             const  SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                maxLines: 5,
                minLines: 1,
                decoration: const InputDecoration(
                  hintText: 'lastname',
                  labelText: 'lastname',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: updatePost,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}