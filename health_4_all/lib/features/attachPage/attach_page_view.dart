import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:health_4_all/features/attachPage/attach_page_view_model.dart';
import 'package:provider/provider.dart';

class AttachPageView extends StatefulWidget {
  @override
  _AttachPageViewState createState() => _AttachPageViewState();
}

class _AttachPageViewState extends State<AttachPageView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _mobilityDifficultyController = TextEditingController();

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
                    ElevatedButton(
                      onPressed: () {
                        _attachProof(model);
                      },
                      child: const Text('Anexar Comprovante'),
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
    )

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
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      model.attachProof(pickedFile.path);
      print('Imagem anexada: ${pickedFile.path}');
    }
  }

  void _deleteAttachedDocument(AttachPageViewModel model) {
    model.deleteAttachedDocument();
  }
}

class FormMedicationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Restante do código que foi removido da AttachPageView...
    return Container();
  }
}

void main() {
  runApp(MaterialApp(
    home: AttachPageView(),
  ));
}