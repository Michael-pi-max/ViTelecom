import 'package:flutter/material.dart';

class FrontPage extends StatefulWidget {
  @override
  _FrontPageState createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  int currentStep = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? jobTypeDropDownValue = jobTypes[0];
  String? rescheduleReasonDropDownValue = rescheduleReasons[0];

  Future<void> showRescheduleDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton(
                    isExpanded: true,
                    value: rescheduleReasonDropDownValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: rescheduleReasons.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        rescheduleReasonDropDownValue = newValue;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'If reason selected is has issue or other please describe reason',
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      return rescheduleReasonDropDownValue == "Has issue" ||
                              rescheduleReasonDropDownValue == "Other"
                          ? value!.isNotEmpty
                              ? null
                              : "Specify reason"
                          : null;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                child: Text('Okay'),
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    Navigator.of(context).pop();
                },
              )
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Color(0xFF2F302F),
          ),
        ),
        child: Stepper(
          type: StepperType.vertical,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            final isLastStep = currentStep == getSteps().length - 1;
            if (isLastStep) {
              print("Completed");
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepTapped: (step) => setState(() => currentStep = step),
          onStepCancel: currentStep == 0
              ? null
              : () {
                  setState(() {
                    currentStep -= 1;
                  });
                },
          controlsBuilder: (context, {onStepContinue, onStepCancel}) {
            final isLastStep = currentStep == getSteps().length - 1;
            return Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  if (currentStep != 0)
                    Expanded(
                      child: ElevatedButton(
                        child: Text('Back'),
                        onPressed: onStepCancel,
                      ),
                    ),
                  SizedBox(
                    width: 12,
                  ),
                  if (!isLastStep)
                    Expanded(
                      child: ElevatedButton(
                        child: Text(isLastStep ? 'Confirm' : 'Next'),
                        onPressed: onStepContinue,
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Work Order'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Work Order ID'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Estimated Job Time'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Customer'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer Name'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Business Name'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Address Line 1'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Town/City'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('County'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Post Code'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Site'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Site Contact 1'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Phone Number'),
              TextFormField(
                initialValue: 'hey',
                readOnly: true,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: Text('Job Type'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Job Type',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton(
                    value: jobTypeDropDownValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: jobTypes.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: null,
                    //  (String? newValue) {
                    //   setState(() {
                    //     jobTypeDropDownValue = newValue;
                    //   });
                    // },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Reschedule',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () async {
                        await showRescheduleDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFD4E2EE),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Start',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFC2EECA),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ];
}

class AppTextFormField extends StatelessWidget {
  final String initialValue;
  final bool readOnly;
  final Function(String)? onChanged;
  var controller;

  AppTextFormField({
    this.initialValue = '',
    this.readOnly = false,
    this.onChanged = null,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: '$initialValue',
      readOnly: readOnly,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}

List<String> jobTypes = [
  "Network Survey",
  "Broadband Survey",
  "Satellite Survey",
  "Telecoms Survey",
  "Network Installation",
  "Broadband Installation",
  "Satellite Installation",
  "Telecoms Installation",
  "Network Service",
  "Broadband Service",
  "Satellite Service",
  "Telecoms Service",
];

List<String> rescheduleReasons = [
  "Customer Requested",
  "No one Available",
  "No work Permit",
  "No Access or Access Denied",
  "Not Enough Time to Complete Work",
  "Has issue",
  "Other",
];
