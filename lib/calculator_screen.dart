import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vatcalc/drawer_widget.dart';
import 'package:vatcalc/vat_class.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _resultWith = "";
  String _resultWithout = "";
  String _resultVAT = "";

  final textAmountController = TextEditingController();
  final textRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle =
        TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор НДС'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/help');
            },
            child: const Text("Справка"),
            style: buttonStyle,
          ),
          IconButton(
              tooltip: "История расчетов",
              onPressed: () {
                Navigator.pushNamed(context, '/history');
              },
              icon: const Icon(Icons.history)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),
      drawer: navDrawer(context),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
                "Параметры",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: textAmountController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFeceff1),
                labelText: 'Сумма',
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: textRateController,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Color(0xFFeceff1),
                labelText: 'Ставка',
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 60,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                        flex: 6,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              VAT vat = VAT.withoutVat(
                                  double.parse(textAmountController.text),
                                  double.parse(textRateController.text));
                              _resultVAT = vat.vat.toStringAsFixed(2);
                              _resultWith =
                                  vat.amountWithVat.toStringAsFixed(2);
                              _resultWithout =
                                  vat.amountWithoutVat.toStringAsFixed(2);
                            });
                          },
                          child: const Text('Начислить НДС'),
                        )),
                    const Expanded(
                      flex: 1,
                      child: Text(""),
                    ),
                    Expanded(
                        flex: 6,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              VAT vat = VAT.withVat(
                                  double.parse(textAmountController.text),
                                  double.parse(textRateController.text));
                              _resultVAT = vat.vat.toStringAsFixed(2);
                              _resultWith =
                                  vat.amountWithVat.toStringAsFixed(2);
                              _resultWithout =
                                  vat.amountWithoutVat.toStringAsFixed(2);
                            });
                          },
                          child: const Text('Выделить НДС'),
                        )),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                "Результат",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(
                child: Text(
                  'Сумма без НДС: $_resultWithout',
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                color: const Color(0xFFECEFF1),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(
                child: Text(
                  'НДС: $_resultVAT',
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                color: const Color(0xFFECEFF1),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Card(
                child: Text(
                  'Сумма с НДС: $_resultWith',
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                color: const Color(0xFFECEFF1),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate), label: "Калькулятор"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "История"),
          BottomNavigationBarItem(
              icon: Icon(Icons.people), label: "О приложении")
        ],
      ),
    );
  }
}
