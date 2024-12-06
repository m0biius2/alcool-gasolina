import 'package:flutter/material.dart';

class Combustivel extends StatefulWidget {
  const Combustivel({super.key});

  @override
  State<Combustivel> createState() => _CombustivelState();
}

class _CombustivelState extends State<Combustivel> {
  // controller
  // controller alcool
  TextEditingController _alcoolController   = TextEditingController();
  // controller gasolina
  TextEditingController _gasolinaController = TextEditingController();

  // atributo
  String _resultado = "";

  // metodo
  // metodo que calcula qual o melhor combustivel
  void _calcularCombustivel(){
    // variavel precoAlcool criada a partir do controller/objeto alcoolController
    var _precoAlcool    = double.tryParse(_alcoolController.text);
    // variavel precoGasolina criada a partir do controller/objeto gasolinaController
    var _precoGasolina  = double.tryParse(_gasolinaController.text);

    // se precoAlcool e/ou precoGasolina forem nulos
    if(_precoAlcool == null || _precoGasolina == null) {
      setState(() {
        _resultado = "Valor do álcool e/ou gasolina não podem ser nulos.";
      });
    } else {
      // se precoAlcool dividido por precoGasolina for maior ou igual a 0.7, gasolina e melhor, se nao, alcool e melhor
      if((_precoAlcool / _precoGasolina) >= 0.7) {
        setState(() {
          _resultado = "Gasolina irá render mais!";
        });
      } else {
        setState(() {
          _resultado = "Álcool irá render mais!";
        });
      }
    }
  }

  // metodo que limpa os dados da pagina
  void _limparDados(){
    _alcoolController.text = "";
    _gasolinaController.text = "";
    setState(() {
      _resultado = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        // start
        leading:  Icon(
          Icons.local_gas_station_rounded,
          color: Colors.white,
          size: 28,
          ),
        // center
        title: Text(
          "Álcool ou Gasolina",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      "images/logo.png",
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "Saiba qual é a melhor opção para o abastecimento do seu carro",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Preço do Álcool, ex: 3.50",),
                      controller: _alcoolController
                  ),
                  TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: "Preço da Gasolina, ex: 5.80"),
                      controller: _gasolinaController
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30)
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)
                      ),
                      onPressed: _calcularCombustivel,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Calcular",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 17
                            ),
                          )
                        ],
                      )
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 5),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent)
                        ),
                        onPressed: _limparDados,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Limpar Dados",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17
                              ),
                            )
                          ],
                        )
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _resultado,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        ],
                      )
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}
