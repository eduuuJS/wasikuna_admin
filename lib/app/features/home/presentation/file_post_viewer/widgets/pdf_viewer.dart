import 'package:advance_pdf_viewer2/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  bool _isLoading = true;
  bool _hasError = false;
  late PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    try {
      document = await PDFDocument.fromURL(widget.path);
    } catch (e) {
      _hasError = true;
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : !_hasError
            ? PDFViewer(document: document)
            : const Center(
                child: Text(
                'Error al cargar el archivo',
                style: TextStyle(color: Colors.red),
              ));
  }
}
