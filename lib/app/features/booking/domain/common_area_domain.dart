class CommonAreaDomain {
  String idArea;
  String nameArea;
  String startTime;
  String closeTime;
  String capacity;
  String qualification;
  String coast;
  String urlPhoto;
  List<String> images;

  CommonAreaDomain(
      {required this.idArea,
      required this.nameArea,
      required this.startTime,
      required this.closeTime,
      required this.capacity,
      required this.qualification,
      required this.coast,
      required this.urlPhoto,
      required this.images});
}
