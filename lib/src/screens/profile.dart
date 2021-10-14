import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // Add the app bar and list of items as slivers in the next steps.
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Color(0xFF363636),
            // Provide a standard title.
            // title: Text("hey"),
            // Allows the user to reveal the app bar if they begin scrolling
            // back up the list of items.
            floating: true,
            // Display a placeholder widget to visualize the shrinking size.
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                '',
                style: TextStyle(
                  color: Color(0xFF0175D8),
                ),
              ),
              centerTitle: true,
            ),
            // Make the initial height of the SliverAppBar larger than normal.
            expandedHeight: 150,
            stretch: true,
            pinned: true,
          ),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //     (context, index) => ListTile(title: Text('Item #$index')),
          //     childCount: 1000,
          //   ),
          // )
        ],
      ),
    );
  }
}

class Job {
  String title;
  int amount;
  Color textColor;
  Color mainContainerColor;
  Color miniContainerColor;

  Job({
    required this.title,
    required this.amount,
    this.textColor = const Color(0xFF42413F),
    this.mainContainerColor = const Color(0xFFD0D0D0),
    this.miniContainerColor = const Color(0xFF0175D8),
  });
}

List<Job> jobs = [
  Job(
    title: 'Work Orders',
    amount: 100,
    mainContainerColor: Color(0xFFD0D0D0),
    miniContainerColor: Color(0xFF0175D8),
  ),
  Job(
    title: 'Surveys',
    amount: 5,
    textColor: Color(0xFFFAFAFA),
    mainContainerColor: Color(0xFF555555),
    miniContainerColor: Color(0xFFF90511),
  ),
  Job(
    title: 'Total Jobs',
    amount: 100,
    mainContainerColor: Color(0xFFD0D0D0),
    miniContainerColor: Color(0xFFB4B80C),
  )
];
