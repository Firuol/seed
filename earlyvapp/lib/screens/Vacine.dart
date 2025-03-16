import 'package:flutter/material.dart';

class vacine extends StatelessWidget {
  // Static vaccination schedule data
  final List<Map<String, String>> vaccinationSchedules = [
    {
      'Buufata': 'Waajira Qonnaa Magaala jimmaa',
      'Guyyaa': '2017-05-10',
      'Teessoo': 'Jimma, Ethiopia',
    },
    {
      'Buufata': 'Kilinika Qarsaa',
      'Guyyaa': '2017-06-15',
      'Teessoo': 'Kersa, Ethiopia',
    },
    {
      'Buufata': 'Waajira Qonnaa Agaaroo',
      'Guyyaa': '2017-07-20',
      'Teessoo': 'Agaro, Ethiopia',
    },
    {
      'Buufata': 'Qoranno Qonna Sokoru',
      'Guyyaa': '2017-07-25',
      'Teessoo': 'Sokoru, Ethiopia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sagantaa Dabaree Talaalli ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 12, 83, 17),
      ),
      body: ListView.builder(
        itemCount: vaccinationSchedules.length,
        itemBuilder: (context, index) {
          final schedule = vaccinationSchedules[index];
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 4,
            child: ListTile(
              leading: const Icon(
                Icons.date_range,
                color: Color.fromARGB(255, 12, 83, 17),
              ),
              title: Text(
                schedule['Buufata']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'Guyyaa: ${schedule['Guyyaa']}\nTeessoo: ${schedule['Teessoo']}'),
              trailing: IconButton(
                icon: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 30,
                ),
                onPressed: () {
                  // Simulate navigation to the vaccination station (map)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Navigating to ${schedule['station']}...'),
                    ),
                  );
                  // You can integrate Google Maps or navigation logic here
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
