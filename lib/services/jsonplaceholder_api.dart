import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/posts.dart';
import 'dart:convert';

final dioProvider = Provider((_) => Dio());

final jsonServiceProvider = Provider((ref) {
   final dio = ref.read(dioProvider);
   return JsonPlaceHolderApi(dio);
});

class JsonPlaceHolderApi {

  final Dio dio;

  JsonPlaceHolderApi(this.dio);

  Future<List<Posts>> getPosts() async {
    final response = await dio.get("https://jsonplaceholder.typicode.com/posts");

    if(response.statusCode != 200) {
      return List.empty();
    }
    return postsFromJson(json.encode(response.data));
  }

}