import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pdf_reader/models/pdf_model.dart';
import 'package:pdf_reader/providers/pdf_provider.dart';
import 'package:pdf_reader/screens/pdf_view_screen.dart';

class PdfListItem extends StatelessWidget {
  final PdfModel pdf;

  const PdfListItem({super.key, required this.pdf});

  @override
  Widget build(BuildContext context) {
    final pdfProvider = Provider.of<PdfProvider>(context, listen: false);

    return ListTile(
      title: Text(pdf.path.split('/').last),
      subtitle: Text(pdf.category),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PdfViewScreen(pdf: pdf),
          ),
        );
      },
      trailing: PopupMenuButton<String>(
        onSelected: (value) {
          pdfProvider.updateCategory(pdf, value);
        },
        itemBuilder: (context) {
          return ['Uncategorized', 'Article', 'Ebook', 'Comic']
              .map((String category) {
            return PopupMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList();
        },
      ),
    );
  }
}
