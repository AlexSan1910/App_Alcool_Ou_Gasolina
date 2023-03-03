import 'package:flutter/material.dart';

class InterfaceApp extends StatefulWidget {
  const InterfaceApp({super.key});

  @override
  State<InterfaceApp> createState() => _InterfaceAppState();
}

class _InterfaceAppState extends State<InterfaceApp> {

  String _mensagem = "";
  TextEditingController _controllerAlcool = TextEditingController(); // controller para estanciar essa classe para capturar os dados que foi digitado no textfield do Acool
  TextEditingController _controllerGasolina = TextEditingController();// Controller para estanciar essa classe para capturar os dados que foi digitado no textfield da Gasolina

  void _calcular(){// criando uma função para o onpressed do calcular do botão do app

    var precoAlcool = double.tryParse( _controllerAlcool.text );// basicamente com o controller que criamos para o textfield Alcool, nos estamos capturando o que o usuario digitou lá em forma de texto e transferindo para um tipo double para asim vir como numero, com o controller Alcool e adicionando dentro dessa variavel precoAcool que acabamos de criar.
    var precoGasolina = double.tryParse( _controllerGasolina.text ); // basicamente com o controller que criamos para o textfield gasolina, nos estamos capturando o que o usuario digitou lá em forma de texto e transferindo para um tipo double para asim vir como numero,com o controller Gasolina e adicionando dentro dessa variavel precoGasolina que acabamos de criar.

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _mensagem = "Numero Invalido, digite números maiores que 0 e utilizando (.)";
      });      
    }else(){
      /*
      Se o preço do álcool dividido pelo preço da gasolina
      for >= a 0.7 é melhor abastecer com gasolina
      senão é melhor utilizar álcool
       */
      if((precoAlcool / precoGasolina) >= 0.7 ){
          setState(() {
            _mensagem = "Melhor abastecer com gasolina";
          });
      }else(){
        setState(() {
          _mensagem = "Melhor abastecer com alcool";
        });
      };
      _limparCampos();
    };
  }

  void _limparCampos(){

    _controllerAlcool.text = "";
    _controllerGasolina.text = "";

  }

  @override
  Widget build(BuildContext context) {

    final ButtonStyle styleElevatedButton =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(// basicamente estou adicionando um widget que vai conseguir rolar a tela mesmo se teclado do celular estiver em cima de algum widget. não retornando aquele alerta que comumente sempre retorna
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("image/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Saiba qual a melhor opção para abestecimento do seu carro",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "preço Alcool, ex: 1.59"
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,// adicionando o controller criado para captura de dados do textfield alcool.
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex: 3.19",
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina, // adicionando o controller criado para captura de dados do textfield gasolina.
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 20,
                    ),                    
                  ),
                  onPressed: _calcular, 
                  style: styleElevatedButton,
                  
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _mensagem,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}
