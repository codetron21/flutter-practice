import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_practice/services/jsonplaceholder_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/posts.dart';

class ConsumeScreen extends HookConsumerWidget {
  const ConsumeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = useState(<Posts>[]);

    useEffect(() {
      fetch() async {
        Future<List<Posts>> data = ref.read(jsonServiceProvider).getPosts();
        posts.value = await data;
      }

      fetch();

      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Consume API"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: posts.value.length,
        itemBuilder: (BuildContext context, int index) {
          final text = posts.value[index].title;

          return SizedBox(
            height: 50,
            child: Center(
              child: Text(
                text ?? "Empty",
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
