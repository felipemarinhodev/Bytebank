import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _textoBotaoConfirmar = 'Confirmar';

const _rotuloCampoValor = 'valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoConta = 'Número da conta';
const _dicaCampoConta = '0000';

class FormularioTransferencia extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              rotulo: _rotuloCampoConta,
              dica: _dicaCampoConta
            ),
            Editor(
              controlador: _controladorCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
              icone: Icons.monetization_on
            ),
            RaisedButton(
              onPressed: () => _criarTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            ),
          ],
        ),
      ),
    );
  }

  void _criarTransferencia(BuildContext context) {
    final int _numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double _valor = double.tryParse(_controladorCampoValor.text);
    if(_numeroConta != null && _valor != null) {
      final Transferencia transferenciaCriada = Transferencia(_valor, _numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}