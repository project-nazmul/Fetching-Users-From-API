import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_api/api_service/Users.dart';
import 'package:user_api/design/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List<Users> allUser = [];


  Future<List<Users>> fetchUsers()async{
    var data;
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode==200){
      data = jsonDecode(response.body);
      for(Map i in data){
        allUser.add(Users.fromJson(i));
      }
    }else{
      if (kDebugMode) {
        print('Data loading error');
      }
    }
    return allUser;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black.withOpacity(0.7),
          title: const Text('Users Profile'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: fetchUsers(),
          builder: (context, AsyncSnapshot<List<Users>> snapshot) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: allUser.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: 5,left: 5,right: 5),
                  padding: const EdgeInsets.all(8),
                  color: Colors.black.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: 'User Info',fw: FontWeight.bold,clr: Colors.white,fs: 15,),
                      CustomText(text: snapshot.data![index].id.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].name.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].email.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].phone.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].username.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].website.toString(),fw: FontWeight.bold,),
                      const SizedBox(height: 10,),
                      const CustomText(text: 'Address',fw: FontWeight.bold,clr: Colors.white,fs: 15,),
                      CustomText(text: snapshot.data![index].address!.street.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].address!.city.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].address!.suite.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].address!.geo!.lat.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].address!.geo!.lng.toString(),fw: FontWeight.bold,),
                      const SizedBox(height: 10,),
                      const CustomText(text: 'Company',fw: FontWeight.bold,clr: Colors.white,fs: 15,),
                      CustomText(text: snapshot.data![index].company!.name.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].company!.bs.toString(),fw: FontWeight.bold,),
                      CustomText(text: snapshot.data![index].company!.catchPhrase.toString(),fw: FontWeight.bold,),

                    ],
                  ),
                );
              },
            );
          },
        )
      ),
    );
  }
}
