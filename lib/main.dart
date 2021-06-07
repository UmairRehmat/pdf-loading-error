import 'package:flutter/material.dart';
import 'package:pdf/clear_cache.dart';
import 'package:pdf/drawer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pdf'),
      routes: {ClearCache.id: (context) => const ClearCache()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isError = false;
  late PdfDocumentLoadFailedDetails pdfDocumentLoadFailedDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: isError
                  ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(pdfDocumentLoadFailedDetails.description)),
                  )
                  : SfPdfViewer.network(
                      'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                      onDocumentLoadFailed: (loadFailedDetails) {
                        setState(() {
                          pdfDocumentLoadFailedDetails = loadFailedDetails;
                          isError = true;
                        });
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
