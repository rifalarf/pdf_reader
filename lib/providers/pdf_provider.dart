import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_reader/models/pdf_model.dart';

class PdfProvider with ChangeNotifier {
  final List<PdfModel> _pdfs = [];
  List<PdfModel> get pdfs => _pdfs;

  PdfProvider() {
    _loadPdfs();
  }

  void _loadPdfs() async {
    Directory directory = await getApplicationDocumentsDirectory();
    List<FileSystemEntity> files = directory.listSync();
    for (var file in files) {
      if (file.path.endsWith('.pdf')) {
        _pdfs.add(PdfModel(path: file.path, category: 'Uncategorized'));
      }
    }
    notifyListeners();
  }

  void addPdf(PdfModel pdf) {
    _pdfs.add(pdf);
    notifyListeners();
  }

  void updateCategory(PdfModel pdf, String newCategory) {
    var targetPdf = _pdfs.firstWhere((p) => p.path == pdf.path);
    targetPdf.category = newCategory;
    notifyListeners();
  }
}
