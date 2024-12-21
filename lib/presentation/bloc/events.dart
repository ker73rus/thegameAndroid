abstract class HomeEvent {
  const HomeEvent();
}

class HomeLoadDataEvent extends HomeEvent {
  final String? search;
  final int? pageNumber;
  final int? nextPageNumber;

  const HomeLoadDataEvent({this.search, this.pageNumber, this.nextPageNumber});
}
