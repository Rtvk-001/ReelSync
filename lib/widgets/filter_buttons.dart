import 'package:flutter/material.dart';

class FilterButtons extends StatefulWidget {
  final Function(String) onGenreSelected;
  final Function(String) onDateSelected;

  FilterButtons({required this.onGenreSelected, required this.onDateSelected});

  @override
  _FilterButtonsState createState() => _FilterButtonsState();
}

class _FilterButtonsState extends State<FilterButtons> {
  String selectedGenre = 'All';
  String selectedDate = 'This Week';

  final List<String> genres = [
    'All', 'Comedy', 'Thriller', 'Action', 'Drama', 'Horror', 'Romance', 'Sci-Fi'
  ];

  final List<String> dates = [
    'This Week', 'This Month', 'Custom Date'
  ];

  void _showGenrePicker() async {
    final String? genre = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Genre'),
        children: genres.map((genre) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, genre),
            child: Text(genre),
          );
        }).toList(),
      ),
    );
    if (genre != null) {
      setState(() => selectedGenre = genre);
      widget.onGenreSelected(genre);
    }
  }

  void _showDatePicker() async {
    final String? date = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Date Filter'),
        children: dates.map((date) {
          return SimpleDialogOption(
            onPressed: () => Navigator.pop(context, date),
            child: Text(date),
          );
        }).toList(),
      ),
    );
    if (date != null) {
      setState(() => selectedDate = date);
      widget.onDateSelected(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _showGenrePicker,
          child: Text('Genre: $selectedGenre'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: _showDatePicker,
          child: Text('Date: $selectedDate'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
