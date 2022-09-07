import 'package:aug_prj/Utils/http_error.dart';
import 'package:aug_prj/models/loginmodel.dart';
import 'package:aug_prj/repository/login_repository.dart';
import 'package:flutter/material.dart';

class AcctList extends StatefulWidget {
  const AcctList({Key? key}) : super(key: key);

  @override
  State<AcctList> createState() => _AcctListState();
}

class _AcctListState extends State<AcctList> {
  List<LogIn> loginlist = [];
  @override
  void initState() {
    super.initState();
    fetchpost();
  }

  Future<void> fetchpost() async {
    try {
      final login = await LoginRepository().fetchposts();
      setState(() {
        loginlist = login;
      });
    } on HttpError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  Future<void> deletePost(LogIn login) async {
    final id = login.user_id;
    if (id == null) return;
    try {
      await LoginRepository.deleteAcct(id);
      setState(() {
        loginlist.removeWhere((element) => element.user_id == login.user_id);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: const [
              Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Post deleted successfully',
              ),
            ],
          ),
        ),
      );
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
        title: const Text('Account List'),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            final acct = loginlist[index];
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.purpleAccent,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${acct.user_id}',
                        style: const TextStyle(fontSize: 22),
                      ),
                      const Text(
                        'password',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          }),
          separatorBuilder: (context, index) => Container(
                height: 1,
                color: Colors.black,
              ),
          itemCount: loginlist.length),
    );
  }
}
