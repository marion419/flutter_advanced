import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_book_search_app/ui/home/widgets/home_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    // textEditingController 사용 시 무조건 있어야 함
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    // TODO 홈뷰모델의 searchBooks 메서드 호출
    ref.read(homeViewModelProvider.notifier).searchBooks(text);
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
                onTap: () {
                  onSearch(textEditingController.text);
                },
                // 버튼 터치 영역은 44 디바이스 픽셀 이상
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.transparent,
                  child: Icon(Icons.search),
                )),
          ],
          title: TextField(
            maxLines: 1,
            onSubmitted: onSearch,
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: '검색어를 입력해주세요',
                border: MaterialStateOutlineInputBorder.resolveWith((states) {
                  print(states);
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black));
                  } else
                    return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey));
                })),
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: homeState.books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3 / 4,
            crossAxisSpacing: 10,
            mainAxisExtent: 10,
          ),
          itemBuilder: (context, index) {
            final book = homeState.books[index];
            return GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeBottomSheet(book);
                    });
              },
              child: Image.network(book.image),
            );
          },
        ),
      ),
    );
  }
}
