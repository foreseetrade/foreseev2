import 'package:flutter/material.dart';
import 'package:foreseev2/apis/api_endpoints/match_apis.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Matches'),
      ),
      body: FutureBuilder(
        future: apiGetAllMatches(), // Call your API function here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            print(snapshot.hasError);
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Assuming your API returns a list of matches
            print('Snapshot is $snapshot');
            print(snapshot.data);
            Map<String, dynamic>? matches = snapshot.data;

            return ListView.builder(
              itemCount: matches?.length,
              itemBuilder: (context, index) {
                // Customize this based on your API response structure
                return ListTile(
                  title: Text(matches?[index]['title']),
                  subtitle: Text(matches?[index]['date']),
                  // Add more fields as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
