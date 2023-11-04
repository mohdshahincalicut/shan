import 'package:e_com/ApiRequest.dart';
import 'package:e_com/ApiResponce.dart';
import 'package:e_com/Constants/Constants.dart';
import 'package:e_com/Constants/UsersData.dart';

import 'package:flutter/material.dart';

class UsersPAge extends StatefulWidget {
  const UsersPAge({super.key});

  @override
  State<UsersPAge> createState() => _UsersPAgeState();
}

class _UsersPAgeState extends State<UsersPAge> {
  var userList = [];
  ApiRequest apiRequest = ApiRequest();
  late ApiResponce apiResponce;

  Future<ApiResponce> getUsersApi() async {
    return apiRequest.apiRequestGet(AppUrls.urlUser);
  }

  @override
  void initState() {
    super.initState();
    getapicall();
    print("heeeeee");
  }

  getapicall() async {
    apiResponce = await getUsersApi();
    print("test ");
    print(apiResponce.statusCode);
    if (apiResponce.statusCode == 200) {
      setState(() {
        userList = apiResponce.data['users'];
      });
      print(apiResponce.data['users'][0]["name"]);
    } else {
      print("error from api,its not 200 statuscode");
    }
  }

  List<user> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          "USERS",
          style: TextStyle(color: AppColors.backgroundColor),
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.only(bottom: 30, top: 26),
          physics: BouncingScrollPhysics(),
          itemCount: userList.length,
          itemBuilder: (countext, index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadiusDirectional.vertical(),
                  color: Colors.white),
              child: Theme(
                data: Theme.of(countext).copyWith(
                  dividerColor: AppColors.backgroundColor,
                ),
                child: ExpansionTile(
                    textColor: AppColors.backgroundColor,
                    backgroundColor: Colors.white,
                    title: Text(
                      userList[index]["name"],
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          Image.network(userList[index]['image']).image,
                      radius: 20,
                    ),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    childrenPadding:
                        EdgeInsets.only(left: 32, top: 16, bottom: 16),
                    collapsedIconColor: AppColors.backgroundColor,
                    iconColor: Colors.black,
                    children: [
                       
                      Text.rich(
                        TextSpan(
                          text: 'Id :',
                          style: TextStyle(fontWeight: FontWeight.w800),
                          children: <InlineSpan>[
                            TextSpan(
                              text: userList[index]["id"].toString(),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Email Id : ',
                          style: const TextStyle(fontWeight: FontWeight.w800),
                          children: <InlineSpan>[
                            TextSpan(
                                text: userList[index]["email"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                       Text.rich(
                        TextSpan(
                          text: 'Phone : ',
                          style: const TextStyle(fontWeight: FontWeight.w800),
                          children: <InlineSpan>[
                            TextSpan(
                                text: userList[index]["phone"].toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w100,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            "More",
                            style: TextStyle(fontWeight: FontWeight.w900),
                          )),
                    ]),
              ),
            );
          }),
    );
  }
}
