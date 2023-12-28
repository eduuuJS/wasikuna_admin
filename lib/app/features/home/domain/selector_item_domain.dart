class SelectorItemDomain {
  String name;
  bool isActive;
  AreaTypeSelector type;

  SelectorItemDomain(
      {required this.name, required this.isActive, required this.type});

  SelectorItemDomain setState(bool value) {
    return SelectorItemDomain(name: name, isActive: value, type: type);
  }
}

enum AreaTypeSelector { news, community, documents }
