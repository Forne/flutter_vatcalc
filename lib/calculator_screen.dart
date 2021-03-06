import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vatcalc/drawer_widget.dart';
import 'package:vatcalc/utils/vat_class.dart';

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
              child: Text(
                "Параметры",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: textAmountController,
              decoration: const InputDecoration(
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
              child: Text(
                "Результат",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Text(
                  'Сумма без НДС: $_resultWithout',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Text(
                  'НДС: $_resultVAT',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Text(
                  'Сумма с НДС: $_resultWith',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
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
