import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/presentation/screens/check.dart';
import 'package:flutter_application_1/src/presentation/screens/equipments.dart';

class JobStartedScreen extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<JobStartedScreen> {
  int currentStep = 0;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? jobTypeDropDownValue = jobTypes[0];
  String? rescheduleReasonDropDownValue = rescheduleReasons[0];

  late List<Equipment> choosenEquipments;

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

  Future<void> showDocumentsDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RAMS',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                ),
                Text(
                  'Network Maps',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                ),
                Text(
                  'Permits',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                ),
                Text(
                  'Site Drawings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                ),
                Text(
                  'Floor Plan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Okay'),
              )
            ],
          );
        });
  }

  Future<void> showSurveyDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RAMS',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('document'),
                        ),
                      );
                    },
                    itemCount: 100,
                  ),
                ),
                Text(
                  'Network Maps',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('document'),
                        ),
                      );
                    },
                    itemCount: 100,
                  ),
                ),
                Text(
                  'Permits',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('document'),
                        ),
                      );
                    },
                    itemCount: 100,
                  ),
                ),
                Text(
                  'Site Drawings',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('document'),
                        ),
                      );
                    },
                    itemCount: 100,
                  ),
                ),
                Text(
                  'Floor Plan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 400,
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('document'),
                        ),
                      );
                    },
                    itemCount: 100,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Okay'),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.choosenEquipments = List.of(choosenEquipmentsData);
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
              Text('Job Type'),
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
              Text('Description of work'),
              TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Description of work',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                ),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Documents and survey'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Documents'),
                trailing: TextButton(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () async {
                    await showDocumentsDialog(context);
                  },
                ),
              ),
              ListTile(
                title: Text('Survey'),
                trailing: TextButton(
                  child: Text(
                    'View',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () async {
                    await showSurveyDialog(context);
                  },
                ),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Site'),
          content: Column(
            children: [
              ScrollableWidget(
                child: buildDataTable(),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 40),
                ),
                onPressed: () async {
                  final addedEquipment = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddEquipments(),
                    ),
                  );
                  setState(() {
                    choosenEquipments.add(addedEquipment);
                  });
                },
                child: Text('Add Equipment'),
              )
            ],
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: Text('Job Type'),
          content: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text(
                        'Complete',
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
                  SizedBox(
                    width: 12,
                  ),
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
                ],
              ),
            ],
          ),
        ),
      ];
  Widget buildDataTable() {
    final columns = ["Item", "Quantity", "Used"];
    return DataTable(
      columns: getColumns(columns),
      rows: getRows(choosenEquipments),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
  }

  List<DataRow> getRows(List<Equipment> choosenEquipments) =>
      choosenEquipments.map((Equipment equipment) {
        final cells = [equipment.item, equipment.quantity, equipment.used];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 1;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 1:
                    editQuantity(equipment);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editQuantity(Equipment editEquipment) async {
    final quanitiy = await showTextDialog(
      context,
      title: 'Change quanity',
      value: editEquipment.quantity,
    );

    setState(() => choosenEquipments = choosenEquipments.map((equipment) {
          final isEditedEquipment = equipment == editEquipment;
          return isEditedEquipment
              ? equipment.copy(quantity: quanitiy)
              : equipment;
        }).toList());
  }
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

class Equipment {
  final String item;
  final String quantity;
  final bool used;

  const Equipment({
    required this.item,
    required this.quantity,
    required this.used,
  });

  Equipment copy({
    String? item,
    String? quantity,
    bool? used,
  }) =>
      Equipment(
        item: item ?? this.item,
        quantity: quantity ?? this.quantity,
        used: used ?? this.used,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Equipment &&
          runtimeType == other.runtimeType &&
          item == other.item &&
          quantity == other.quantity &&
          used == other.used;

  @override
  int get hashCode => item.hashCode ^ quantity.hashCode ^ used.hashCode;
}

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  const ScrollableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
}

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            child: Text('Done'),
            onPressed: () => Navigator.of(context).pop(controller.text),
          )
        ],
      );
}
