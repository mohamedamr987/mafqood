import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../widgets/general_text.dart';

class MessageTimeWidget extends StatefulWidget {
  final DateTime dateTime;
  final Color color;
  const MessageTimeWidget({Key? key, required this.dateTime, this.color = Colors.grey}) : super(key: key);

  @override
  State<MessageTimeWidget> createState() => _MessageTimeWidgetState();
}

class _MessageTimeWidgetState extends State<MessageTimeWidget> {
  late final Timer _timer;

  String get time{
    return timeago.format(widget.dateTime);
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1,), (timer) {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralText(text: time, color: widget.color, size: 12,);
  }
}
