import 'package:flutter/material.dart';

class SearchListPage extends StatefulWidget {
  @override
  _SearchListPageState createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
  TextEditingController etSearch = TextEditingController();
  bool isSearch = true;
  String query = "";
  List<String> dataList;
  List<String> filterList;

  @override
  void initState() {
    super.initState();
    dataList = [
      "Snake",
      "Elephant",
      "cats",
      "dog",
      "orion",
      "boomerang",
      "pelican",
      "ghost",
      "eagle",
      "horse head",
      "elephant trunk",
      "butterfly"
    ];

    dataList.sort();
  }

  _SearchListPageState() {
    etSearch.addListener(() {
      if (etSearch.text.isEmpty) {
        setState(() {
          isSearch = false;
          query = "";
        });
      } else {
        setState(() {
          isSearch = true;
          query = etSearch.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Searching"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            _createSearchView(),
            isSearch ? _perfomSearch() : _createListView(),
          ],
        ),
      ),
    );
  }

  // NOTE: Form search
  Widget _createSearchView() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: TextField(
        controller: etSearch,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.brown),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // NOTE: Form
  Widget _createListView() {
    return Flexible(
      child: ListView.builder(
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 0,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Text(dataList[index].toString()),
            ),
          );
        },
      ),
    );
  }

  // NOTE: Lakukan search dengan fungsi contains
  Widget _perfomSearch() {
    filterList = new List<String>();
    for (var i = 0; i < dataList.length; i++) {
      var item = dataList[i];
      if (item.toLowerCase().contains(query.toLowerCase())) {
        filterList.add(item);
      }
    }
    return _createFilteredListView();
  }

  Widget _createFilteredListView() {
    return Flexible(
        child: ListView.builder(
      itemCount: filterList.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 0,
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(filterList[index].toString()),
          ),
        );
      },
    ));
  }
}
