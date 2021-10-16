import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/presentation/screens/check.dart';
import 'package:flutter_application_1/src/presentation/screens/job_started.dart';

class AddEquipments extends StatefulWidget {
  @override
  _AddEquipmentsState createState() => _AddEquipmentsState();
}

class _AddEquipmentsState extends State<AddEquipments> {
  String text = '';

  bool containsSearchText(Equipment equipment) {
    final name = equipment.item;
    final textLower = text.toLowerCase();
    final equipmentLower = name.toLowerCase();

    return equipmentLower.contains(textLower);
  }

  @override
  Widget build(BuildContext context) {
    final allEquipmentsListed = allEquipments;
    final equipments = allEquipmentsListed.where(containsSearchText).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Equipment'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchWidget(
              text: text,
              hintText: 'Search Equipment',
              onChanged: (text) => setState(() => this.text = text)),
        ),
      ),
      body: ListView(
        children: equipments.map((equipment) {
          return EquipmentListTileWidget(
            equipment: equipment,
            isSelected: false,
            onSelectedEquipment: (Equipment equipment) {
              Navigator.pop(context, equipment);
            },
          );
        }).toList(),
      ),
    );
  }
}

class EquipmentListTileWidget extends StatelessWidget {
  final Equipment equipment;
  final bool isSelected;
  final ValueChanged<Equipment> onSelectedEquipment;

  const EquipmentListTileWidget({
    Key? key,
    required this.equipment,
    required this.isSelected,
    required this.onSelectedEquipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Colors.blueAccent;
    final style = isSelected
        ? TextStyle(
            fontSize: 16, color: selectedColor, fontWeight: FontWeight.bold)
        : TextStyle(fontSize: 16);
    return InkWell(
      onTap: () => onSelectedEquipment(equipment),
      child: ListTile(
        title: Text(
          equipment.item,
          style: style,
        ),
        trailing: isSelected
            ? Icon(
                Icons.check,
                color: selectedColor,
                size: 24,
              )
            : null,
      ),
    );
  }
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    required this.text,
    required this.onChanged,
    required this.hintText,
  });

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final styleActive = TextStyle(color: Colors.black);
    final styleHint = TextStyle(color: Colors.black54);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 40,
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
