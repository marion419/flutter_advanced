// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_book_search_app/ui/detail/detail_page.dart';

class HomeBottomSheet extends StatelessWidget {
  HomeBottomSheet(this.book);

  Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 50),
      width: double.infinity,
      height: 300,
      child: Row(
        children: [
          Image.network(
            book.image,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                book.author,
                maxLines: 2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                book.description,
                maxLines: 2,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return DetailPage(book);
                    }),
                  );
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    '자세히 보기',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
