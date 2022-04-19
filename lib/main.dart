import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_process/services/camera/camera_package.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final _pick = CameraFactory.buildCameraService();
  final List<_PickOption> _options = [_PickOption('Câmera', true), _PickOption('Galeria', false)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: const SafeArea(
        child: Center(
          child: Text('Clique no botão para adicionar uma imagem'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showOption(),
        child: const Icon(Icons.attach_file_outlined),
      ),
    );
  }

  _showOption() => showModalBottomSheet(
      context: context,
      builder: (_) => BottomSheet(
          onClosing: () {},
          builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var element in _options) ...[
                  ListTile(
                    title: Text(element.label),
                    trailing: Icon(element.isFromCamera ? Icons.camera : Icons.browse_gallery),
                    onTap: () => _pick.pickImage(element.isFromCamera),
                  ),
                ],
              ],
            );
          }));
}

class _PickOption {
  final String label;
  final bool isFromCamera;

  _PickOption(this.label, this.isFromCamera);
}
