import 'package:flutter/material.dart';
import "package:fluttertoast/fluttertoast.dart";
import 'package:rh_presence_mobile/screen/ListeConge.dart';

class DatePickerWidget extends StatefulWidget {
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String selectedDropdownValue = 'Congé Annuel';
  TextEditingController descriptionController = TextEditingController();
  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String? selectedValue; // Default selected item.

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  void _handleSubmit() {
    // Perform actions when the Submit button is pressed.
    // You can access the selected dates and dropdown value here.
    print('Start Date: $startDate');
    print('End Date: $endDate');
    print('Selected Dropdown Value: $selectedDropdownValue');
  }

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    final differenceDate = dateRange.duration;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 6, 110, 5),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Demande congé',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(width: 20),
          ],
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.notifications), // Notification icon
                onPressed: () {
                  // Gérez l'action lorsque l'icône de notification est cliquée
                },
              ),
              Positioned(
                top: 2.0,
                right: 5.0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Center(
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: Container(
              margin: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      // Add Horizontal padding using menuItemStyleData.padding so it matches
                      // the menu padding when button's width is not specified.
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      // Add more decoration..
                    ),
                    value: selectedDropdownValue,
                    onChanged: (newValue) {
                      setState(() {
                        selectedDropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Congé Annuel',
                      'Congé sans solde',
                      'Congéde mmaladie',
                      'Congé de maternité',
                      'Congé de mariage',
                      'Congé de de décè',
                      'Congé de paternté'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Selection la periode',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: pickDateRange,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 6, 110,
                                  5), // Changer la couleur de fond en vert
                            ),
                            child: Text(
                                '${start.year}/${start.month}/${start.day}')),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: pickDateRange,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 6, 110,
                                5), // Changer la couleur de fond en vert
                          ),
                          child: Text('${end.year}/${end.month}/${end.day}'),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Total des jours:  ${differenceDate.inDays}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 10),
                        hintText: 'Description',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1))),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 6, 110, 5), // Changer la couleur de fond en vert
                    ),
                    onPressed: () {
                      Fluttertoast.showToast(
                        msg: "Demande envoyée avec succces",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black54,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ListeConge()),
                      );
                    },
                    child: const Text("Envoyer la demande"),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ListeConge()),
              );
            },
            child: const Text(
              'Historique des Congés',
              style: TextStyle(
                color: Color.fromARGB(255, 39, 152, 245),
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: dateRange,
        firstDate: DateTime(2021),
        lastDate: DateTime(2100));
    if (newDateRange == null) return;
    setState(() => dateRange = newDateRange);
  }
}
