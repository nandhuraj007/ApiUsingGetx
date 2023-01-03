import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/data_controller.dart';
class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);

  final controller=Get.put(Datacontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api using GETX"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Obx((){
          return controller.loading.isTrue? Center(child: CircularProgressIndicator()): ListView.builder(
            itemCount: controller.datamodels.length,
              itemBuilder: (c,i){
              final data=controller.datamodels[i];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  color: Colors.greenAccent,
                  child: Column(
                    children: [
                      Text("ID :\n"+data.id.toString()),
                      const SizedBox(height: 10),
                      Text("Title :\n"+data.title.toString()),
                      const SizedBox(height: 10),
                      Text("Price :\n"+data.price.toString())
                    ],
                  ),
                ),
              );
              //return Center(child: Text(data.id.toString()));
              }
          );
        }),
      ),
    );
  }
}
