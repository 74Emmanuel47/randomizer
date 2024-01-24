import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:randomizer/templates/Msg_Box_New_Item.dart';

class DashedButton extends StatefulWidget {
  const DashedButton({super.key, required this.txt});

  final String txt;

  @override
  State<DashedButton> createState() => _DashedButton();
}

class _DashedButton extends State<DashedButton> {
  late Color borderColor = Theme.of(context).colorScheme.primary;
  late Color backgroundColor = Theme.of(context).colorScheme.background;
  late Color textColor = Theme.of(context).colorScheme.primary;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const MsgBoxNewItem();
      },
    );
  }

  _inactiveButton() {
    setState(() {
      backgroundColor = Theme.of(context).colorScheme.background;
      textColor = Theme.of(context).colorScheme.primary;
      borderColor = Theme.of(context).colorScheme.primary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: backgroundColor,
      ),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 8.0),
      child: DottedBorder(
        color: borderColor,
        dashPattern: const [14, 14],
        borderType: BorderType.RRect,
        radius: const Radius.circular(4.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            child: Text(
              widget.txt,
              textAlign: TextAlign.center,
              style: GoogleFonts.electrolize(
                color: textColor,
              ),
            ),
          ),
          onTapDown: (details) {
            setState(() {
              borderColor = Theme.of(context).colorScheme.background;
              backgroundColor = Theme.of(context).primaryColor;
              textColor = Theme.of(context).colorScheme.background;
            });
          },
          onTapUp: (details) {
            _inactiveButton();
            _showDialog();
          },
          onVerticalDragEnd: (details) {
            _inactiveButton();
          },
          onHorizontalDragEnd: (details) {
            _inactiveButton();
          },
        ),
      ),
    );
  }
}
