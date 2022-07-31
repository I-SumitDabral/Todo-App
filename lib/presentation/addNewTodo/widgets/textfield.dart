import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  const CustomTextFieldWidget({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool _shouldShowSuffixIcon = false;
  void _hideOrShowSuffixIcon(String value) {
    if (value.split('').isEmpty) {
      _shouldShowSuffixIcon = false;
    } else {
      _shouldShowSuffixIcon = true;
    }
    setState(() {});
  }

  void _clearText() {
    widget.textEditingController.clear();
    _shouldShowSuffixIcon = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      onChanged: (value) {
        print(value);
        _hideOrShowSuffixIcon(value);
      },
      decoration: InputDecoration(
          suffixIcon: _shouldShowSuffixIcon
              ? IconButton(
                  onPressed: () {
                    _clearText();
                  },
                  icon: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade400),
                      child: Icon(
                        Icons.clear_rounded,
                        color: Colors.white,
                      )))
              : null,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
