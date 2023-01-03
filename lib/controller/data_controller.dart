import 'package:apigetx/model/data_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../services/data_service.dart';

class Datacontroller extends GetxController{
  var datamodels=<Datamodel>[].obs;
  var loading=true.obs;
  setData()async{
    try {
      loading.value=true;
      var data = await DataService().getService();
      if (data != null) {
        datamodels.value = data;
        loading.value=false;
      }
    }
    catch(e){
      Get.snackbar("title","$e" );
      loading.value=false;
    }
  }
  @override
  void onInit() {
    setData();
    super.onInit();
  }
}