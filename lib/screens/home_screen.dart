import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf_reader/models/pdf_model.dart';
import 'package:pdf_reader/providers/pdf_provider.dart';
import 'package:pdf_reader/widgets/pdf_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pdfProvider = Provider.of<PdfProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Reader'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform
                  .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
              if (result != null && result.files.single.path != null) {
                pdfProvider.addPdf(PdfModel(
                    path: result.files.single.path!,
                    category: 'Uncategorized'));
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: pdfProvider.pdfs.length,
        itemBuilder: (context, index) {
          var pdf = pdfProvider.pdfs[index];
          return PdfListItem(pdf: pdf);
        },
      ),
    );
  }
}
