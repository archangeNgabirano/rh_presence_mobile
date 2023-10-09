import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class ListeConge extends StatefulWidget {
  const ListeConge({super.key});

  @override
  _ListeCongeState createState() => _ListeCongeState();
}

class _ListeCongeState extends State<ListeConge> {
  final List _elements = [
    {
      'typeConge': 'Congé annuel',
      'dateDebut': '01-01-2023',
      'dateFin': '03-01-2023',
      'nbrJours': '2',
      'status': 'ok',
      'group': '01-2023'
    },
    {
      'typeConge': 'Congé annuel',
      'dateDebut': '20-01-2023',
      'dateFin': '23-01-2023',
      'nbrJours': '3',
      'status': 'nok',
      'group': '01-2023'
    },
    {
      'typeConge': 'Congé annuel',
      'dateDebut': '05-04-2023',
      'dateFin': '06-04-2023',
      'nbrJours': '1',
      'status': 'nok',
      'group': '04-2023'
    },
    {
      'typeConge': 'Congé de de décè ',
      'dateDebut': '05-04-2023',
      'dateFin': '09-04-2023',
      'nbrJours': '4',
      'status': 'ok',
      'group': '04-2023'
    },
    {
      "typeConge": "Congé annuel",
      "dateDebut": "14-06-2023",
      "dateFin": "20-06-2023",
      "nbrJours": "5",
      'status': 'ok',
      "group": "06-2023"
    },
    {
      "typeConge": "Congé sans solde",
      "dateDebut": "25-09-2023",
      "dateFin": "27-09-2023",
      "nbrJours": "2",
      'status': 'ok',
      "group": "09-2023"
    },
    {
      "typeConge": "Congé sans solde",
      "dateDebut": "15-10-2023",
      "dateFin": "17-09-2023",
      "nbrJours": "2",
      'status': 'pending',
      "group": "10-2023"
    },
    {
      "typeConge": "Congé sans solde",
      "dateDebut": "25-11-2023",
      "dateFin": "27-1-2023",
      "nbrJours": "2",
      'status': 'pending',
      "group": "11-2023"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 6, 110, 5),
          title: const Text('Congés déjà pris'),
        ),
        body: GroupedListView<dynamic, String>(
            elements: _elements,
            groupBy: (element) => element['group'],
            groupComparator: (value1, value2) => value2.compareTo(value1),
            itemComparator: (item1, item2) =>
                item1['typeConge'].compareTo(item2['typeConge']),
            order: GroupedListOrder.ASC,
            // useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
            itemBuilder: (c, element) {
              return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 6.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0,
                    ),
                    //leading: Icon(Icons.account_circle),
                    title: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              element['typeConge'],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text('Date: '),
                            Text(
                              element['dateDebut'],
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('au'),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              element['dateFin'],
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('Nombres jours: '),
                            Text(
                              element['nbrJours'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    // ignore: prefer_const_constructors

                    // Autres propriétés de la tuile...
                    trailing: element['status'] == 'ok'
                        ? const Icon(
                            Icons
                                .check, // Icône de validation (peut être modifiée selon vos besoins)
                            color: Colors.blue, // Couleur de l'icône
                            size: 30.0, // Taille de l'icône
                          )
                        : element['status'] == 'nok'
                            ? const Icon(
                                Icons
                                    .warning, // Icône de triangle d'avertissement
                                color: Colors.orange, // Couleur de l'icône
                                size: 30.0, // Taille de l'icône
                              )
                            : element['status'] == 'pending'
                                ? const CircularProgressIndicator(
                                    // Icône de chargement en cours
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Color.fromARGB(255, 6, 110, 5)),
                                  )
                                : null, // Mettez null ou une autre icône par défaut si nécessaire
                  ));
            }));
  }
}
