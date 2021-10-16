import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF363636),
        title: Text(
          'ViTelecom',
          style: TextStyle(
            color: Color(0xFF0175D8),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10),
              child: Text(
                'Portal VT ENGINEERs',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, bottom: 10),
              child: Divider(
                height: 10,
                thickness: 2,
                color: Colors.grey,
                endIndent: 10,
              ),
            ),
            Container(
              height: 370,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 0,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  ...jobs.map(
                    (job) {
                      return Stack(
                        children: [
                          Container(
                            height: 160,
                            color: job.mainContainerColor,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 30,
                                  left: 20,
                                  child: Text(
                                    '${job.title}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: job.textColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 60,
                                  left: 20,
                                  child: Text(
                                    '${job.amount}',
                                    style: TextStyle(
                                      color: job.textColor,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  width: 120,
                                  height: 15,
                                  child: Container(
                                    color: job.miniContainerColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, bottom: 5),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Color(0xFF0175D8),
                ),
              ),
              child: Text(
                'RECENT ACTIVITY',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF0175D8),
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey,
              endIndent: 10,
              indent: 10,
            ),
            ...recentActivities.map((e) {
              return ListTile(
                title: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xFFD3E3BF),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Text('Issued line added to proposal')),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
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

List<String> recentActivities = [
  "Issued line added to proposal",
  "Issued line added to proposal",
  "Issued line added to proposal",
  "Issued line added to proposal",
  "Issued line added to proposal",
  "Issued line added to proposal",
  "Issued line added to proposal",
  "Issued line added to proposal",
];
