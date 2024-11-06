import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  final Function(String, String, String) onApplyFilters;

  FilterScreen({required this.onApplyFilters});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedGenre = 'All';
  String selectedDate = 'This Week';
  String selectedType = 'Movies';

  final List<String> genres = ['All', 'Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi'];
  final List<String> dateOptions = ['This Week', 'This Month', 'Custom'];
  final List<String> typeOptions = ['Movies', 'TV Shows'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filter Movies')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              value: selectedGenre,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGenre = newValue!;
                });
              },
              items: genres.map<DropdownMenuItem<String>>((String genre) {
                return DropdownMenuItem<String>(
                  value: genre,
                  child: Text(genre),
                );
              }).toList(),
              isExpanded: true,
            ),
            DropdownButton<String>(
              value: selectedDate,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDate = newValue!;
                });
              },
              items: dateOptions.map<DropdownMenuItem<String>>((String date) {
                return DropdownMenuItem<String>(
                  value: date,
                  child: Text(date),
                );
              }).toList(),
              isExpanded: true,
            ),
            DropdownButton<String>(
              value: selectedType,
              onChanged: (String? newValue) {
                setState(() {
                  selectedType = newValue!;
                });
              },
              items: typeOptions.map<DropdownMenuItem<String>>((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              isExpanded: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onApplyFilters(selectedGenre, selectedDate, selectedType);
                Navigator.pop(context);
              },
              child: Text('Apply Filters'),
            ),
          ],
        ),
      ),
    );
  }
}
