import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class CompletePage extends StatefulWidget {
  @override
  _CompletePageState createState() => _CompletePageState();
}

class _CompletePageState extends State<CompletePage> {
  int currentStep = 0;
  int selectedValue = 0;
  int selectedValue1 = 0;
  int selectedValue2 = 0;
  int selectedValue3 = 0;
  int selectedValue4 = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey4 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();

  File? image;

  bool? engineerSignOff = false;
  bool? customerSignOff = false;
  var locationMessage = "";

  TextEditingController customerNameController = TextEditingController();

  // void getCurrentLocation() async {
  //   var position = await Geolocator.getCurrentPosition(
  //     desiredAccuracy: LocationAccuracy.high,
  //   );
  //   setState(() {
  //     locationMessage = "${position.latitude} , ${position.longitude}";
  //   });
  //   // var lastPosition = await GeoLocator.getLastKnownPosition();
  //   // print(lastPosition);
  // }

  Future pickImage() async {
    final images = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (images == null) return;

    final imageTemporary = File(images!.path);
    setState(() => this.image = imageTemporary);
  }

  Future takeImage() async {
    final images = await ImagePicker().pickImage(source: ImageSource.camera);
    if (images == null) return;

    final imageTemporary = File(images!.path);

    setState(() => this.image = imageTemporary);
  }

  //  Future takeImage() async {
  //   final images = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if (images != null) return;

  //   final imageTemporary = images?.map((i) => File(i.path)).toList();

  //   setState(() => this.image = imageTemporary);
  // }

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
            final firstStep = currentStep == 0;
            final isLastStep = currentStep == getSteps().length - 1;
            if (firstStep && selectedValue == 2) {
              if (_formKey.currentState!.validate())
                setState(() {
                  currentStep += 1;
                });
            } else if (firstStep && selectedValue1 == 2) {
              if (_formKey2.currentState!.validate())
                setState(() {
                  currentStep += 1;
                });
            } else if (firstStep && selectedValue2 == 2) {
              if (_formKey3.currentState!.validate())
                setState(() {
                  currentStep += 1;
                });
            } else if (firstStep && selectedValue3 == 2) {
              if (_formKey4.currentState!.validate())
                setState(() {
                  currentStep += 1;
                });
            } else if (firstStep && selectedValue4 == 2) {
              if (_formKey5.currentState!.validate())
                setState(() {
                  currentStep += 1;
                });
            } else {
              if (isLastStep) {
                print("Completed");
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
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
              Text('Has the work be completed as specified?'),
              Row(
                children: [
                  Text('yes'),
                  Radio(
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) =>
                        setState(() => selectedValue = value as int),
                  ),
                  Text('No'),
                  Radio(
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (value) =>
                        setState(() => selectedValue = value as int),
                  ),
                ],
              ),
              selectedValue == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please, specify the reason you said no',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: TextFormField(
                            validator: (value) {
                              return selectedValue == 2
                                  ? value!.isNotEmpty
                                      ? null
                                      : "Specify reason"
                                  : null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Text('Has testing been completed?'),
              Row(
                children: [
                  Text('yes'),
                  Radio(
                    value: 1,
                    groupValue: selectedValue1,
                    onChanged: (value) =>
                        setState(() => selectedValue1 = value as int),
                  ),
                  Text('No'),
                  Radio(
                    value: 2,
                    groupValue: selectedValue1,
                    onChanged: (value) =>
                        setState(() => selectedValue1 = value as int),
                  ),
                ],
              ),
              selectedValue1 == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please, specify the reason you said no',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Form(
                          key: _formKey2,
                          child: TextFormField(
                            validator: (value) {
                              return selectedValue1 == 2
                                  ? value!.isNotEmpty
                                      ? null
                                      : "Specify reason"
                                  : null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Text('Have the works been shown to the customer?'),
              Row(
                children: [
                  Text('yes'),
                  Radio(
                    value: 1,
                    groupValue: selectedValue2,
                    onChanged: (value) =>
                        setState(() => selectedValue2 = value as int),
                  ),
                  Text('No'),
                  Radio(
                    value: 2,
                    groupValue: selectedValue2,
                    onChanged: (value) =>
                        setState(() => selectedValue2 = value as int),
                  ),
                ],
              ),
              selectedValue2 == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please, specify the reason you said no',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Form(
                          key: _formKey3,
                          child: TextFormField(
                            validator: (value) {
                              return selectedValue2 == 2
                                  ? value!.isNotEmpty
                                      ? null
                                      : "Specify reason"
                                  : null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Text('Has the system been demonstrated to the customer?'),
              Row(
                children: [
                  Text('yes'),
                  Radio(
                    value: 1,
                    groupValue: selectedValue3,
                    onChanged: (value) =>
                        setState(() => selectedValue3 = value as int),
                  ),
                  Text('No'),
                  Radio(
                    value: 2,
                    groupValue: selectedValue3,
                    onChanged: (value) =>
                        setState(() => selectedValue3 = value as int),
                  ),
                ],
              ),
              selectedValue3 == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please, specify the reason you said no',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Form(
                          key: _formKey4,
                          child: TextFormField(
                            validator: (value) {
                              return selectedValue3 == 2
                                  ? value!.isNotEmpty
                                      ? null
                                      : "Specify reason"
                                  : null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ],
                    )
                  : Container(),
              Text('Is the system fully operational?'),
              Row(
                children: [
                  Text('yes'),
                  Radio(
                    value: 1,
                    groupValue: selectedValue4,
                    onChanged: (value) =>
                        setState(() => selectedValue4 = value as int),
                  ),
                  Text('No'),
                  Radio(
                    value: 2,
                    groupValue: selectedValue4,
                    onChanged: (value) =>
                        setState(() => selectedValue4 = value as int),
                  ),
                ],
              ),
              selectedValue4 == 2
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Please, specify the reason you said no',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Form(
                          key: _formKey5,
                          child: TextFormField(
                            validator: (value) {
                              return selectedValue4 == 2
                                  ? value!.isNotEmpty
                                      ? null
                                      : "Specify reason"
                                  : null;
                            },
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                          ),
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Upload Pictures'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              image != null
                  ? Image.file(
                      image!,
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                      )),
              ElevatedButton(
                onPressed: () => takeImage(),
                child: Text('Take Image'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 30),
                ),
              ),
              ElevatedButton(
                onPressed: () => pickImage(),
                child: Text('Upload Image'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 30),
                ),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Note'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Notes'),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Sign off'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Engineer Sign Off'),
                  Checkbox(
                      value: engineerSignOff,
                      onChanged: (bool? value) {
                        setState(() {
                          engineerSignOff = value;
                        });
                      }),
                ],
              ),

              // TextFormField(
              //   decoration: InputDecoration(
              //     isDense: true,
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 10,
              //       vertical: 8,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black,
              //         width: 2,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black,
              //         width: 1,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Text('Customer Name'),
              TextFormField(
                controller: customerNameController,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Customer Signed'),
                  Checkbox(
                      value: customerSignOff,
                      onChanged: (bool? value) {
                        setState(() {
                          customerSignOff = value;
                        });
                      }),
                ],
              ),
              // TextFormField(
              //   decoration: InputDecoration(
              //     isDense: true,
              //     contentPadding: EdgeInsets.symmetric(
              //       horizontal: 10,
              //       vertical: 8,
              //     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black,
              //         width: 2,
              //       ),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderSide: BorderSide(
              //         color: Colors.black,
              //         width: 1,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFC6E6CE),
                  minimumSize: Size(double.infinity, 30),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            title: Text('Proceed?'),
                            content: Text('Are you sure?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  print('Date ${DateTime.now()}');
                                  print(
                                      "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                                  // getCurrentLocation();

                                  print(locationMessage);
                                  print(
                                      "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
                                },
                                child: Text('Complete'),
                              )
                            ],
                          ));
                },
                child: Text(
                  'Complete',
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ];
}
