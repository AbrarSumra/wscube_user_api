import 'dart:convert';
import 'package:http/http.dart' as httpClients;

import 'package:flutter/material.dart';
import 'package:wscube_user_api/models/user_model.dart';
import 'package:wscube_user_api/screens/user_detail_page.dart';
import 'package:wscube_user_api/widget_constant/row_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserDataModel? userDataModel;

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: userDataModel != null && userDataModel!.users.isNotEmpty
          ? ListView.builder(
              itemCount: userDataModel!.users.length,
              itemBuilder: (_, index) {
                var users = userDataModel!.users[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: Colors.white10,
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => UserDetailPage(
                                firstName: users.firstName,
                                lastName: users.lastName,
                                maidenName: users.maidenName,
                                age: users.age,
                                gender: users.gender,
                                email: users.email,
                                phone: users.phone,
                                username: users.username,
                                password: users.password,
                                birthDate: users.birthDate,
                                image: users.image,
                                bloodGroup: users.bloodGroup,
                                height: users.height,
                                weight: users.weight,
                                eyeColor: users.eyeColor,
                                hair: users.hair,
                                domain: users.domain,
                                ip: users.ip,
                                address: users.address,
                                macAddress: users.macAddress,
                                university: users.university,
                                bank: users.bank,
                                company: users.company,
                                ein: users.ein,
                                ssn: users.ssn,
                                userAgent: users.userAgent,
                              ),
                            ));
                      },
                      title: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${users.firstName} ${users.maidenName} ${users.lastName}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  RowText(keys: "Age: ", value: "${users.age}"),
                                  const SizedBox(width: 10),
                                  RowText(
                                      keys: "Gender: ", value: users.gender),
                                ],
                              ),
                              RowText(keys: "Email: ", value: users.email),
                              RowText(keys: "Phone no: ", value: users.phone),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 10,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Image.network(
                                  users.image,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  void getUsers() async {
    var uri = Uri.parse("https://dummyjson.com/users");
    var response = await httpClients.get(uri);

    if (response.statusCode == 200) {
      var mData = jsonDecode(response.body);
      userDataModel = UserDataModel.fromJson(mData);
      setState(() {});
    }
  }
}
