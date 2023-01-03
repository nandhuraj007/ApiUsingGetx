import 'package:apigetx/model/data_model.dart';
import 'package:http/http.dart' as http;
class DataService{
  var url="https://fakestoreapi.com/products";
  Future<List<Datamodel>?> getService()async {
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      return datamodelFromJson(response.body);
    }
    else{
      return null;
    }
}
}