import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isPassword = false,
    this.validator,
    this.onChanged,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;
  String? _errorText;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onChanged(String value) {
    if (widget.validator != null) {
      setState(() {
        _errorText = widget.validator!(value);
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    ColorScheme colorScheme= theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Text(
            widget.label,
            style: TextStyle(
              color: _errorText != null
                  ? Colors.red
                  : isDarkMode
                      ? Colors.white
                      : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),*/
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            obscureText: widget.isPassword && !_isPasswordVisible,
            onChanged: _onChanged,
            decoration: InputDecoration(
                fillColor: Theme.of(context).appBarTheme.backgroundColor,
                prefixIcon: widget.prefixIcon != null
                    ? Icon(widget.prefixIcon,
                        color: colorScheme.onSecondary)
                    : null,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: colorScheme.onSecondary,
                        ),
                        onPressed: _togglePasswordVisibility,
                      )
                    : (_errorText != null
                        ? const Icon(Icons.warning, color: Colors.red)
                        : widget.suffixIcon != null
                            ? Icon(widget.suffixIcon,
                                color: colorScheme.onSecondary)
                            : null),
                labelText: widget.label,
                hintText: 'Enter your ${widget.label}',
                errorText: _errorText
            ),
            validator: widget.validator ??
                (value) {
                  if (value == null || value.isEmpty) {
                    return '${widget.label} field is required';
                  } else if (widget.label == 'Email' && !isValidEmail(value)) {
                    return "Please enter valid email";
                  } else if (widget.label == 'Password' &&
                      !isPasswordValid(value)) {
                    return "Please enter correct password";
                  }
                  return null;
                },
            style: TextStyle(
              color: colorScheme.onSecondary,
            ),
          ),
          //const SizedBox(height: 6),
        ],
      ),
    );
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email.trim());
  }

  bool isPasswordValid(String password) {
    return password.isNotEmpty && password.length >= 6;
  }
}
