import 'package:flutter/material.dart';

class Vacine extends StatelessWidget {
  // Static vaccination schedule data
  final List<Map<String, String>> vaccinationSchedules = [
    {
      'Station': 'Waajira Qonnaa Magaala jimmaa Clinic',
      'Date': '2017-05-10',
      'Location': 'Jimma, Ethiopia',
    },
    {
      'Station': 'Kilinika Qarsaa Clinic',
      'Date': '2017-06-15',
      'Location': 'Kersa, Ethiopia',
    },
    {
      'Station': 'Waajira Qonnaa Agaaroo Clinic',
      'Date': '2017-07-20',
      'Location': 'Agaro, Ethiopia',
    },
    {
      'Station': 'Qoranno Qonna Sokoru Clinic',
      'Date': '2017-07-25',
      'Location': 'Sokoru, Ethiopia',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vaccination Schedule',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor:Color.fromARGB(255, 12, 83, 17),
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
                schedule['Station']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  'Date: ${schedule['Date']}\nLocation: ${schedule['Location']}'),
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
