import 'package:flutter/material.dart';

class AsyncButton extends StatefulWidget {
  const AsyncButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;

  /// butona tıklandığında, bu fonksiyon tetiklenir
  final Future<void> Function() onPressed;

  @override
  State<AsyncButton> createState() => _AsyncButtonState();
}

class _AsyncButtonState extends State<AsyncButton> {
  bool _isLoading = false;

  Future<void> runAsyncFunc() async {
    setState(() {
      _isLoading = true;
    });
    await widget.onPressed.call();
    setState(() {
      _isLoading = false;
    });
  }

  Widget get loadingIndicator => const CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : runAsyncFunc,
      child: _isLoading
          ? loadingIndicator
          : Text(
              widget.text,
            ),
    );
  }
}
