class Shoe {
  String brand, gender, name, sellerID, shoeColor, shoeCondition, shoeID, shoeImageUrl, shoeType, price, size;

  void parseJson(Map<dynamic, dynamic> content){
    brand = content['brand'].toString();
    gender = content['gender'].toString();
    name = content['name'].toString();
    sellerID = content['sellerID'].toString();
    shoeColor = content['shoeColor'].toString();
    shoeCondition = content['shoeCondition'].toString();
    shoeID = content['shoeID'].toString();
    shoeImageUrl = content['shoeImageUrl'].toString();
    shoeType = content['shoeType'].toString();
    price = content['price'].toString();
    size = content['size'].toString();
  }

}