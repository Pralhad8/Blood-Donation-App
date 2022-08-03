import 'package:blood_donor_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomAppBar(text: 'Search'),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFe9eaec),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        cursorColor: Color(0xFF000000),
                        controller: _searchController,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                'assets/search.svg',
                                width: 10,
                                height: 10,
                              ),
                            ),
                            hintText: "Search",
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // SvgPicture.asset('assets/search.svg'),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.red,
                  ),
                ],
              ),
              SizedBox(height: 40),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Text(
                          'Fliters',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        child: ExpansionTile(
                          title: Text('Blood Type'),
                          children: [
                            Text('hello'),
                          ],
                        ),
                      ),
                       Container(
                        child: ExpansionTile(
                          title: Text('Blood Type'),
                          children: [
                            Text('hello'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
