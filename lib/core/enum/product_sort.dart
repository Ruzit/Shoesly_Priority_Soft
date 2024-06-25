enum ProductSort { recent, priceLowToHigh, priceHighToLow }

extension ProductSortExtension on ProductSort {
  String get value {
    switch (this) {
      case ProductSort.recent:
        return 'Most Recent';
      case ProductSort.priceLowToHigh:
        return 'Lowest Price';
      case ProductSort.priceHighToLow:
        return 'Highest Price';
    }
  }
}
