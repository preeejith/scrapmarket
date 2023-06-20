class ScrapModel {
  String? category;
  String? quantity;
  String? description;
  double lat;
  double lon;

  ScrapModel(
      {required this.category,
      required this.quantity,
      this.description,
      required this.lat,
      required this.lon});
}
