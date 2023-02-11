import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('NGO Feed'),
      // ),
      body: ListView.builder(
        itemCount: ngoPosts.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ngoPosts[index].ngoName,
                      style: Theme.of(context).textTheme.headline6),
                  // SizedBox(height: 8.0),
                  // Image.network(ngoPosts[index].imageUrl),
                  SizedBox(height: 8.0),
                  Text(ngoPosts[index].title,
                      style: Theme.of(context).textTheme.subtitle1),
                  SizedBox(height: 8.0),
                  Text(ngoPosts[index].description),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class NgoPost {
  final String ngoName;
  final String imageUrl;
  final String title;
  final String description;

  NgoPost({
    required this.ngoName,
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final List<NgoPost> ngoPosts = [
  NgoPost(
    ngoName: 'Greenpeace',
    imageUrl:
        'https://www.greenpeace.org/themes/custom/greenpeace_frontend/dist/img/gpi/header-logo.png',
    title: 'Join our campaign to protect the Amazon rainforest',
    description:
        'The Amazon rainforest is one of the most important ecosystems on the planet, providing habitat for countless species and regulating the Earth’s climate. But it is under threat from deforestation, fires, and other human activities. Join us in our campaign to protect the Amazon and all of its wonders.',
  ),
  NgoPost(
    ngoName: 'UNICEF',
    imageUrl: 'https://www.unicef.org/footer/resources/images/unicef-logo.png',
    title: 'Support our efforts to provide education for all children',
    description:
        'Every child has the right to an education. But for many children around the world, this right is not a reality. UNICEF is working to change this by providing educational opportunities for all children, no matter where they live. Support our efforts to make education a reality for every child.',
  ),
  NgoPost(
    ngoName: 'Doctors Without Borders',
    imageUrl:
        'https://www.doctorswithoutborders.org/sites/default/files/styles/header_logo/public/logo.png',
    title: 'Help us provide medical aid to those in need',
    description:
        'Every day, people around the world face life-threatening situations that leave them in need of medical assistance. Doctors Without Borders is there to help, providing medical aid to those in need, no matter where they are. Support our efforts to save lives and bring hope to those in need.',
  ),
];
