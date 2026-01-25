import 'package:get/get.dart';

abstract class PaginationController<T> extends GetxController {
  int currentPage = 1;
  int lastPage = 1;
  int perPage = 4;
  int total = 0;


  int get totalRows => total;

  int get totalPages => lastPage;

  int get start =>  total == 0 ? 0 : ((currentPage - 1) * perPage) ;

  int get end => (currentPage * perPage) > total
      ? total
      : (currentPage * perPage);

  void changeCurrentPage(int page) {
    currentPage = page;
    fetchPage(page);
    update();
  }


  Future<void> fetchPage([int page = 1]);
}
