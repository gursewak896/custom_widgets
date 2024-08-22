import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownRow extends StatelessWidget {
  const DropdownRow(
      {super.key,
      required this.label,
      required this.selectedValue,
      required this.options});
  final String label;
  final String selectedValue;
  final List<String> options;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontSize: 14),
            )),
        Container(
          width: 150, // Fixed width for the dropdown button
          height: 40, // Fixed height for the dropdown button
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedValue,
              items: options
                  .map(
                    (value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        )),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: (value) {},
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
              dropdownColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
