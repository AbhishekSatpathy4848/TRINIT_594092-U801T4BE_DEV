import 'package:flutter/material.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({super.key});

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  final _searchController = TextEditingController();
  final _ngoList = ['NGO 1', 'NGO 2', 'NGO 3', 'NGO 4'];
  String? _selectedNgo;

  @override
  Widget build(BuildContext context) {
    // return const Center(
    //   child: Text('Search page'),
    // );
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 200,
                        child: Column(
                          children: const <Widget>[
                            ListTile(
                              leading: Icon(Icons.filter_1),
                              title: Text('Filter 1'),
                            ),
                            ListTile(
                              leading: Icon(Icons.filter_2),
                              title: Text('Filter 2'),
                            ),
                            ListTile(
                              leading: Icon(Icons.filter_3),
                              title: Text('Filter 3'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                hintText: 'Search NGO',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(28.0)),
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Expanded(
            child: ListView.builder(
              itemCount: _ngoList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(_ngoList[index]),
                      onTap: () {
                        setState(() {
                          _selectedNgo = _ngoList[index];
                        });
                      },
                      selected: _ngoList[index] == _selectedNgo,
                    ),
                    const Divider(
                      color: Colors.lightGreenAccent,
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
