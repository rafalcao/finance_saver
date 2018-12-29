import 'package:flutter/material.dart';

class NewRelease extends StatelessWidget {

  
  final formKey = new GlobalKey<FormState>();

  String _value;
  String _date;
  String _type;
  String _classification;
  String _paymentMethod;
  String _installments;
  String _description;
  List<String> _classifications = <String>[
    '', 
    'F-Aluguel, luz, água e internet',
    'F-Comunicação (Celular e Fixo)',
    'F-Outras',
    'V-Mercado, padaria e utensílios',
    'V-Educação (Cursos e certificados)',
    'V-Janta (Restaurantes)',
    'V-Lazer (Bares, lanches)',
    'V-Trabalho (Almoços e lanches)',
    'V-Saúde (Medicamentos e consultas)',
    'V-Vestuário (Roupas e Sapatos)',
    'V-Entreterimento (Cinemas e Shows)',
    'V-Presentes',
    'V-Transporte (Uber, 99)',
    'V-Viagem (Hotel, passagem)',
    'V-Estética (Corte cabelo)',
    'V-Outros',
    'R-Salário (Bonus, 13, Premio)',
    'R-Outras',
    'Dívidas antigas',
    'Pagamento de fatura Cartão de Crédito',
    'Investimentos',
  ];

  @override
  Widget build(BuildContext context) {
    return new Form(
      key: formKey,
      child: new Column(
        children: <Widget>[
          new Center(
            child: new Text(
              'Novo lançamento',
            ),
          ),
          new Padding(
              padding: const EdgeInsets.only(top: 20.0),
          ),
          new Row(
            children: <Widget>[
              Expanded(
                child: new TextFormField(
                      decoration: new InputDecoration(labelText: "Valor"),
                      //validator: (val) =>
                          // ,
                          //!val.contains('@') ? 'Invalid Email' : null,
                      onSaved: (val) => _value = val,
                  ),
              ),

              Expanded(
                child: new Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                ), 
              ),
              
              Expanded(
                child: new TextFormField(
                    decoration: new InputDecoration(labelText: "Data"),
                    validator: (val) =>
                        val.length < 6 ? 'Password too short' : null,
                    onSaved: (val) => _date = val,
                ), 
              ),
              
            ],
          ),
          new FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Classificação',
                ),
                isEmpty: _classification == '',
                child: new DropdownButtonHideUnderline(
                  child: new DropdownButton<String>(
                    value: _classification,
                    isDense: true,
                    onChanged: (String newValue) {
                      ParentDataElement.setState(() {
                        //newContact.favoriteColor = newValue;
                        _classification = newValue;
                        state.didChange(newValue);
                      });
                    },
                    items: _classifications.map((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
          
          new Padding(
              padding: const EdgeInsets.only(top: 20.0),
          ),
          new RaisedButton(
              child: new Text(
              "Salvar",
              style: new TextStyle(color: Colors.white),
              ),
              color: Colors.green,
              onPressed: _submit,
          ),
            
        ],
      ),
    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      performLogin();
    }
  }

  void performLogin() {
    final snackbar = new SnackBar(
      content: new Text("valor : $_value, date : $_date, classificação: $_classification"),
    );

    setState();
    scaffoldKey.currentState.showSnackBar(snackbar);
    
  }
}

