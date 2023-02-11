import 'package:flutter/material.dart';
import 'package:ngo_hackathon/core/pages/ngo_page.dart';

class FilterSearch extends StatefulWidget {
  const FilterSearch({super.key});

  @override
  State<FilterSearch> createState() => _FilterSearchState();
}

class _FilterSearchState extends State<FilterSearch> {
  final _searchController = TextEditingController();
  final ngoList = [' CRY (Child Rights and You)', 'Smile Foundation', 'Give India Foundation', 'Goonj'];
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
          itemCount: ngoList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 10.0,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                          // image: DecorationImage(
                          //   image: NetworkImage(ngoList[index].imageUrl),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        ngoList[index],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      // SizedBox(height: 8.0),
                      // Text(
                      //   ngoList[index].mission,
                      //   style: Theme.of(context).textTheme.subtitle1,
                      // ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            // color: Colors.green,
                            // textColor: Colors.white,
                            // padding: EdgeInsets.all(16.0),
                            onPressed: () {
                              Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return NgoProfilePage(ngoName: ngoList[index],);
                          }));
                            },
                            child: Text('Learn More'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
            // child: ListView.builder(
            //   itemCount: _ngoList.length,
            //   itemBuilder: (context, index) {
            //     return Column(
            //       children: [
            //         ListTile(
            //           title: Text(_ngoList[index]),
            //           onTap: () {
            //             setState(() {
            //               _selectedNgo = _ngoList[index];
            //             });
            //           },
            //           selected: _ngoList[index] == _selectedNgo,
            //         ),
            //         const Divider(
            //           color: Colors.lightGreenAccent,
            //         )
            //       ],
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}
