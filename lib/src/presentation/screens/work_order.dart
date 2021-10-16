import 'package:flutter/material.dart';

class WorkOrderScreen extends StatelessWidget {
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
      body: Container(
        margin: EdgeInsets.only(top: 20, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'WORK ORDERS',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Divider(
              height: 10,
              thickness: 2,
              color: Colors.grey,
              endIndent: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: workOrders.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 4, left: 4, right: 4),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(workOrders[index].contactName),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Contact Number: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(workOrders[index].contactNumber),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Business Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(workOrders[index].businessName),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Address Name: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(workOrders[index].address),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Job Type: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(workOrders[index].jobType),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'WOID: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(workOrders[index].woId),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Row(
                          children: [
                            Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                print("start");
                              },
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFC2EECA),
                                minimumSize: Size(100, 40),
                              ),
                            ),
                            SizedBox(width: 4),
                            ElevatedButton(
                              onPressed: () {
                                print("Rebook");
                              },
                              child: Text(
                                'Rebook',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xFFD4E2EE),
                                minimumSize: Size(100, 40),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WorkOrder {
  String contactName;
  String contactNumber;
  String businessName;
  String address;
  String jobType;
  String woId;

  WorkOrder({
    required this.contactName,
    required this.contactNumber,
    required this.businessName,
    required this.address,
    required this.jobType,
    required this.woId,
  });
}

List<WorkOrder> workOrders = [
  WorkOrder(
    contactName: 'contactName',
    contactNumber: 'contactNumber',
    businessName: 'businessName',
    address: 'address',
    jobType: 'jobType',
    woId: 'woId',
  ),
  WorkOrder(
    contactName: 'contactName',
    contactNumber: 'contactNumber',
    businessName: 'businessName2',
    address: 'address',
    jobType: 'jobType',
    woId: 'woId',
  ),
];
