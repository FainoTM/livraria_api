import 'package:get/get.dart';
import 'package:livraria_app_api/model/book_model.dart';
import '../service/book_api.dart';

class BookController extends GetxController {
  var isLoading = true.obs;
  var books = <Book>[].obs;
  var listNames = <String>[].obs;
  var selectedList = ''.obs;

  final BookApi bookApi = BookApi();

  @override
  void onInit() {
    fetchLists();
    super.onInit();
  }

  void fetchLists() async {
    try {
      isLoading(true);
      listNames.value = await bookApi.getLists();
      if (listNames.isNotEmpty) {
        selectedList.value = listNames[0];
        fetchBooks(selectedList.value);
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchBooks(String listName) async {
    try {
      isLoading(true);
      books.value = await bookApi.getBooks(listName);
    } finally {
      isLoading(false);
    }
  }
}
