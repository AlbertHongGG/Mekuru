class PaginatedResult<T> {
  final List<T> items;
  final int page;
  final bool hasNext;

  const PaginatedResult({
    required this.items,
    required this.page,
    required this.hasNext,
  });
}
