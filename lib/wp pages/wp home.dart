import 'package:api/model/wp%20model.dart';
import 'package:api/services/wp%20services.dart';
import 'package:api/wp%20pages/wp%20details%20pages.dart';
import 'package:api/wp%20pages/wp%20search%20button.dart';
import 'package:api/wp%20view%20model/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class WallHome extends StatefulWidget {
  const WallHome({super.key});

  @override
  State<WallHome> createState() => _WallHomeState();
}

class _WallHomeState extends State<WallHome> {
  List<Tab> cats = [
    Tab(
      text: "NATURE",
    ),
    Tab(
      text: "ANIMAL",
    ),
    Tab(
      text: "SPORTS",
    ),
    Tab(
      text: "CARS",
    ),
    Tab(
      text: "FLOWER",
    ),
    Tab(
      text: "HOUSE",
    ),

    Tab(
      text: "FOOD",
    ),
  ];

  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";
  bool searchMode = false;

  SearchService _searchService = SearchService();

  void searchImages(String query) {
    setState(() {
      _searchQuery = query.toLowerCase();
      searchMode = true;
    });
  }

  void resetSearch() {
    setState(() {
      searchMode = false;
      _searchController.clear();
    });
  }
  // HomeViewModel ms = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: searchMode
              ? IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: resetSearch,
          )
              : null,
          title: Text(
            "Wallpics",
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: searchMode
              ? null
              : TabBar(
            tabs: cats,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.yellow),
            unselectedLabelColor: Colors.white,
            isScrollable: true,
            indicatorWeight: 1,
            dividerColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.black,
          ),
        ),
        backgroundColor: Colors.black,
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search wallpapers...",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                disabledBorder: InputBorder.none,
                suffixIcon: searchMode
                    ? IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: resetSearch, // Clear search
                )
                    : null,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              style: TextStyle(color: Colors.black),
              onSubmitted: (value) {
                searchImages(value);
              },
            ),
          ),
          Expanded(
            child: searchMode
                ? SearchResults(_searchQuery) // Show search results
                : TabBarView(
              children: cats.map((tab) => customGridView(tab)).toList(),
            ), // Show TabBar content
          ),
        ]),
      ),
    );
  }

  FutureBuilder<List<Wpmodel>> customGridView(Tab tab) {
    return FutureBuilder<List<Wpmodel>>(
      future: Wpservices().fetchWpData(tab.text!.toLowerCase()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("No Data Found"));
        } else {
          return MasonryGridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              itemCount: snapshot.data!.length,
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                final photo = snapshot.data![index];
                return InkWell(
                  onTap: () {
                    Get.to(WallDetails(
                      imgurl: photo.imgurl,
                      name: photo.photographer,
                      description: photo.description,
                    ));
                  },
                  child: Hero(
                    tag: photo.imgurl,
                    child: Container(
                      height: (index % 3 + 2) * 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(int.parse(
                              photo.avg_color.replaceAll("#", "0xff"))),
                          image: DecorationImage(
                              image: NetworkImage("${photo.imgurl}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                );
              });
        }
      },
    );
  }
}
