import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/drawer.dart';

class ClearCache extends StatefulWidget {
  const ClearCache({Key? key}) : super(key: key);
  static String id = "/clear_cache";
  @override
  _ClearCacheState createState() => _ClearCacheState();
}

class _ClearCacheState extends State<ClearCache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerNavigation(),
      appBar: AppBar(
        title: const Text("Clear Cache"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  _deleteCacheDir();
                },
                child:const Text("Clear Cache"),
              ),
            ),
          )
        ],
      ),
    );
  }
  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();
    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }
}
