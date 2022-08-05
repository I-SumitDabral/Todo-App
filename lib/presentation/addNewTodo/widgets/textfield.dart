import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FocusNode focusNode;
  final VoidCallback? onTapped;
  final String? Function(String?)? validator;

  const CustomTextFieldWidget(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.onTapped,
      required this.focusNode,
      this.validator})
      : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => CustomTextFieldWidgetState();
}

class CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  TextEditingController get _controller => widget.textEditingController;
  String? Function(String?)? get _validator => widget.validator;
  String get _hint => widget.hintText;
  FocusNode get _focusNode => widget.focusNode;
  VoidCallback? get _onTapped => widget.onTapped;
  bool _shouldShowSuffixIcon = false;
  bool _isFocused = false;
  void _hideOrShowSuffixIcon(String value) {
    {
      if (_isFocused == true && value.isNotEmpty) {
        _shouldShowSuffixIcon = true;
      } else {
        _shouldShowSuffixIcon = false;
      }
    }
    setState(() {});
  }

  void _clearText() {
    _controller.clear();
    _shouldShowSuffixIcon = false;
    setState(() {});
  }

  @override
  void initState() {
    _focusNode.addListener(_onFocusChage);
    super.initState();
  }

  void _onFocusChage() {
    setState(() => _isFocused = _focusNode.hasFocus);
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    super.dispose();
  }

  final _inputBorder =
      const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white));
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: _validator,
        focusNode: _focusNode,
        onTap: _onTapped,
        readOnly: _onTapped != null,
        controller: _controller,
        cursorColor: Colors.white,
        onChanged: (value) => _hideOrShowSuffixIcon(value),
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: _hint,
          hintStyle: const TextStyle(color: Colors.white38),
          suffixIcon: _suffixIcon,
          enabledBorder: _inputBorder,
          focusedBorder: _inputBorder,
          border: _inputBorder,
        ));
  }

  Widget? get _suffixIcon {
    return _shouldShowSuffixIcon
        ? IconButton(
            onPressed: () => _clearText(),
            icon: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade400),
                child: const Icon(
                  Icons.clear_rounded,
                  color: Colors.white,
                )))
        : null;
  }
}
