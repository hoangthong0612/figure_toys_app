import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;

class HtmlToTextWidget extends StatelessWidget {
  final String htmlContent;
  final TextStyle? style;
  const HtmlToTextWidget({super.key, required this.htmlContent, this.style});

  // Function to convert HTML to plain text
  String convertHtmlToPlainText(String htmlContent) {
    dom.Document document = html_parser.parse(htmlContent);
    return document.body?.text ?? '';
  }

  @override
  Widget build(BuildContext context ) => Text(
      convertHtmlToPlainText(htmlContent),
      style: style,
    );
}