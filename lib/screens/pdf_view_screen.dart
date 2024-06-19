import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:pdf_reader/models/pdf_model.dart';

class PdfViewScreen extends StatelessWidget {
  final PdfModel pdf;

  const PdfViewScreen({super.key, required this.pdf});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pdf.path.split('/').last),
      ),
      body: PDFView(
        filePath: pdf.path,
        enableSwipe: true,
        swipeHorizontal: true,
        autoSpacing: false,
        pageFling: false,
      ),
    );
  }
}
