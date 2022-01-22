class InventoryList {
  final List<PlantObj> listPlanObj;

  InventoryList({
    required this.listPlanObj,
  });

  factory InventoryList.fromRTDB(Map<String, dynamic> data) {
    List<PlantObj> rawPlanObj = [];
    for (var x in data.keys) {
      final rawData = Map<String, dynamic>.from(data[x] as Map);
      rawPlanObj.add(PlantObj.fromObj(rawData));
    }
    return InventoryList(listPlanObj: rawPlanObj);
  }
}

class PlantObj {
  final String careNeeds;
  final String commonName;
  final String description;
  final String lightExposure;
  final String imageUrl;
  final String plantID;
  final int price;
  final String scientificName;
  final int stock;
  final String waterUse;

  PlantObj(
      {required this.careNeeds,
      required this.commonName,
      required this.description,
      required this.lightExposure,
      required this.imageUrl,
      required this.plantID,
      required this.price,
      required this.scientificName,
      required this.stock,
      required this.waterUse});

  factory PlantObj.fromObj(Map<String, dynamic> data) {
    return PlantObj(
      careNeeds: data['Care_Needs'] ?? "Null",
      commonName: data['Common_Name'] ?? "Null",
      description: data['Description'] ?? "Null",
      lightExposure: data['Light_Exposure'] ?? "Null",
      imageUrl: data['Photo'] ?? "Null",
      plantID: data['Plant_ID'] ?? 0,
      price: data['Price'] ?? 0,
      scientificName: data['Scientific_Name'] ?? "Null",
      stock: data['Stock'] ?? 0,
      waterUse: data['Water_Use'] ?? "Null",
    );
  }
}
