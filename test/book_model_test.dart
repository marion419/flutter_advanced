import 'dart:convert';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Book model test', () {
    String dummyData = """
    {
      "title": "Harry Potter (Monster Book of Monsters Plush Journal)",
      "link": "https://search.shopping.naver.com/book/catalog/51382082626",
      "image": "https://shopping-phinf.pstatic.net/main_5138208/51382082626.20241113132523.jpg",
      "author": "Insights",
      "discount": "33230",
      "publisher": "Insights Inc (Oz)",
      "pubdate": "20240625",
      "isbn": "9798886633856",
      "description": ""
    }
""";

    Map<String, dynamic> map = jsonDecode(dummyData);
    Book book = Book.fromJson(map);
    expect(book.discount, '33230');
  });
}
