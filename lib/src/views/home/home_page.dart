import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search venues...',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          _CategorySection(),
          _PopularVenuesSection(),
        ],
      );
}

class _CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const <Widget>[
            _CategoryItem('Football', Icons.sports_soccer),
            _CategoryItem('Basketball', Icons.sports_basketball),
            _CategoryItem('Tennis', Icons.sports_tennis),
            _CategoryItem('Swimming', Icons.pool),
          ],
        ),
      );
}

class _CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _CategoryItem(this.title, this.icon);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              child: Icon(icon, size: 30),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}

class _PopularVenuesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Venues',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: const Icon(Icons.place),
              title: Text('Venue ${index + 1}'),
              subtitle: const Text('Brief description of the venue'),
              trailing: ElevatedButton(
                onPressed: () {
                  // TODO: Implement booking action
                },
                child: const Text('Book'),
              ),
            ),
          ),
        ],
      );
}
