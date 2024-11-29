// 뷰모델
// 1. 상태 클래스 만들기
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/data/repository/book_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeState {
  List<Book> books;
  HomeState(this.books);
}

// 2. 뷰모델 만들기 - Notifier 상속
// Notifier 상속할때는 이 뷰모델이 어떤 상태 클래스를 관리하는지 <> 안에 명시해야 함
class HomeViewModel extends Notifier<HomeState> {
  @override
  build() {
    return HomeState([]);
  }

  Future<void> searchBooks(String query) async {
    final bookRepository = BookRepository();
    final books = await bookRepository.searchBooks(query);
    state = HomeState(books);
  }
}

// 3. 뷰모델 관리자 만들기 - NotifierProvider
// 어떤 뷰모델을 관리하는지, 이 뷰모델이 어떤 state를 가지고 있는지 <>안에 명시해야 함
final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  () {
    return HomeViewModel();
  },
);
