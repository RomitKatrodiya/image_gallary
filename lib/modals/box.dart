class Box {
  final int crossAxisCellCount;
  final int mainAxisCellCount;
  final String image;
  final String category;
  final List images;

  Box({
    required this.crossAxisCellCount,
    required this.mainAxisCellCount,
    required this.image,
    required this.category,
    required this.images,
  });
  factory Box.fromJSON(Map json) {
    return Box(
      crossAxisCellCount: json["crossAxisCellCount"],
      mainAxisCellCount: json["mainAxisCellCount"],
      image: json["image"],
      category: json["category"],
      images: json["images"],
    );
  }
}
