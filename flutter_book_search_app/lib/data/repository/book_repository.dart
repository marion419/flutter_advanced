import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Book>> searchBooks(String query) async {
    final client = Client();
    final response = await client.get(
      Uri.parse('https://openapi.naver.com/v1/search/book.json?query=$query'),
      headers: {
        'X-Naver-Client-Id': 'Yao25V63qHFUGUu3aQgK',
        'X-Naver-Client-Secret': 'be10AM0xNT',
      },
    );
    // Get 요청성공 => 200
    // 응답코드 200 -> json 데이터 처리해서 객체로 반환
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      final Iterable = items.map((e) {
        return Book.fromJson(e);
      });

      final list = Iterable.toList();
      return list;
    }
    // 200아닐때 빈 리스트 반환
    return [];
  }
}
