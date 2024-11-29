// {
//       "title": "Harry Potter (Monster Book of Monsters Plush Journal)",
//       "link": "https://search.shopping.naver.com/book/catalog/51382082626",
//       "image": "https://shopping-phinf.pstatic.net/main_5138208/51382082626.20241113132523.jpg",
//       "author": "Insights",
//       "discount": "33230",
//       "publisher": "Insights Inc (Oz)",
//       "pubdate": "20240625",
//       "isbn": "9798886633856",
//       "description": ""
//     },
class Book {
  String title;
  String link;
  String image;
  String author;
  String discount;
  String publisher;
  String pubdate;
  String isbn;
  String description;

  Book({
    required this.title,
    required this.link,
    required this.image,
    required this.author,
    required this.discount,
    required this.publisher,
    required this.pubdate,
    required this.isbn,
    required this.description,
  });

  Book.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          link: map['link'],
          image: map['image'],
          author: map['author'],
          discount: map['discount'],
          publisher: map['publisher'],
          pubdate: map['pubdate'],
          isbn: map['isbn'],
          description: map['description'],
        );

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'image': image,
      'author': author,
      'discount': discount,
      'publisher': publisher,
      'pubdate': pubdate,
      'isbn': isbn,
      'description': description,
    };
  }
}
