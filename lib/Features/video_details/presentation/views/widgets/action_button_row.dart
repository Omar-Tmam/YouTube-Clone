import 'package:flutter/material.dart';
import 'package:youtube_clone/Features/video_details/data/models/action_button_model.dart';


class ActionButtonsRow extends StatelessWidget {
  final List<ActionButtonModel> buttons;

  const ActionButtonsRow({super.key, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buttons.map((btn) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton.icon(
              onPressed: () {}, // زر شكلي بس
              icon: Icon(btn.icon, color: Colors.white, size: 20),
              label: Text(
                btn.label,
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
