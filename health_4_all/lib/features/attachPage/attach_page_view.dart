import 'package:flutter/material.dart';
import 'package:health_4_all/features/analysisPage/analysis_page_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_4_all/features/attachPage/attach_page_view_model.dart';
import 'package:health_4_all/features/formMedications/form_medications_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AttachPageView extends StatefulWidget {
  @override
  _AttachPageViewState createState() => _AttachPageViewState();
}

class _AttachPageViewState extends State<AttachPageView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _mobilityDifficultyController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AttachPageViewModel(),
      child: Consumer<AttachPageViewModel>(
        builder: (context, model, _) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Envio de comprovantes'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Envie um documento que comprove sua dificuldade de locomoção:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    InkWell(
                      onTap: () {
                        _attachProof(model);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.attach_file),
                          const SizedBox(width: 8.0),
                          Text('Anexar Comprovante'),
                        ],
                      ),
                    ),
                    if (model.model.loadedDocumentName != null)
                      const SizedBox(height: 16.0),
                    if (model.model.loadedDocumentName != null)
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Documento Carregado: ${model.model.loadedDocumentName}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _deleteAttachedDocument(model);
                            },
                          ),
                        ],
                      ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        Checkbox(
                          value: model.model.agreedToTerms,
                          onChanged: (value) {
                            model.updateAgreedToTerms(value ?? false);
                          },
                        ),
                        Flexible(
                          child: Text(
                            'Eu aceito os termos de segurança e privacidade',
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Navegar para a AnalysisPageView
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnalysisPageView(),
                          ),
                        );
                      },
                      child: const Text('Concluir',
                      style: TextStyle(color: Colors.green)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _attachProof(AttachPageViewModel model) async {
  // Solicitar permissões
  var permissionStatus = await Permission.photos.request();

  if (permissionStatus.isGranted) {
    // A permissão foi concedida, agora podemos usar o ImagePicker
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      model.attachProof(pickedFile.path);
      print('Imagem anexada: ${pickedFile.path}');
    }
  } else {
    print('Permissões não concedidas.');
    // Aqui você pode lidar com o caso em que a permissão não foi concedida
  }
}

  void _deleteAttachedDocument(AttachPageViewModel model) {
    model.deleteAttachedDocument();
  }

  void _submitForm(BuildContext context, AttachPageViewModel viewModel) async {
    bool dataSaved = await viewModel.saveFormData();

    if (dataSaved) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormMedicationsView()),
      );
    } else {
      _showErrorSnackBar(context, 'Erro ao salvar os dados.');
    }
  }

  void _showErrorSnackBar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AttachPageView(),
  ));
}