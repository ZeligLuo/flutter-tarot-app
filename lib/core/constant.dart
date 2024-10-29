enum TarotStateStatus { initial, loading, loadingSuccess, loadingFailure }

enum RequestMethod {
  get,
  head,
  post,
  put,
  delete,
  connect,
  options,
  trace,
  patch,
}

List<String> loadingImageList = const ["animal_loading_1.json", "animal_loading_2.json", "animal_loading_3.json", "animal_loading_4.json", "animal_loading_5.json", "animal_loading_6.json"];

enum TransactionType { approved, received, reject }
