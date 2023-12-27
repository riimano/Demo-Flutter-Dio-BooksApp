import 'package:books_app/models/book.dart';
import 'package:dio/dio.dart';

class BookService {
  final _dio = Dio(); //instancs of dio
  final _baseURL = 'https://coded-books-api-crud.eapi.joincoded.com/books';

  Future<List<Book>> getBooks() async {
    List<Book> books = [];
    try {
      final response = await _dio.get(_baseURL);
      print(response);
      books =
          (response.data as List).map((book) => Book.fromJson(book)).toList();
    } catch (e) {
      print(e);
    }
    return books;
  }
}
