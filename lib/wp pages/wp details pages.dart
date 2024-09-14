import 'package:api/services/wp%20services.dart';
import 'package:api/wp%20pages/wp%20fullscreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class WallDetails extends StatelessWidget {
  String imgurl;
  String name;
  String description;
  WallDetails({Key? key, required this.imgurl,required this.name,required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Details',style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
                children:[ Container(
                  height: MediaQuery.of(context).size.height*0.6,
                  width: double.infinity,
                  decoration:BoxDecoration(
                      image: DecorationImage(image: NetworkImage(imgurl),fit: BoxFit.cover)
                  ),
                ),
                  Positioned(
                      right: 6,
                      top: 6,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(FullImage(image: imgurl,alt: description,));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.withOpacity(0.7),
                          ),
                          child: Icon(Icons.fullscreen,color: Colors.white,),
                        ),
                      )
                  )
                ]
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${description}",style: TextStyle(fontSize: 26,color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person,color: Colors.white,),
                      Gap(10),
                      Text("Photographer",style: TextStyle(color: Colors.white),),
                    ],
                  ),
                  Container(
                      height:50,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Center(child: Text("${name}",style: TextStyle(color: Colors.white,fontSize: 19),))
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.camera_alt,color: Colors.white,),
                        Gap(10),
                        Text("Photo by",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    Container(
                        height:40,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Center(child: Text("Pexel",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),))
                    ),
                  ],
                ),
            ),
            MaterialButton(
              color: Colors.white,
              onPressed: (){
                Wpservices().openUrl(imgurl);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("DOWNLOAD", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),),      Icon(Icons.download, color: Colors.black,size: 30,)
                ],  ),
            ),
          ],
        ),
      ),
    );
  }
}