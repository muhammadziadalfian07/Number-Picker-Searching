import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class PageNumberPicker extends StatefulWidget {
  @override
  _PageNumberPickerState createState() => _PageNumberPickerState();
}

class _PageNumberPickerState extends State<PageNumberPicker> {
  int currentIntValue = 10;
  double currentDoubleValue = 3.0;

  NumberPicker intNumberPicker;
  NumberPicker decNumberPicker;

  // NOTE: Menghandel value ketika berubah
  handelValueChanged(num value) {
    if (value != null) {
      if (value is int) {
        setState(() {
          currentIntValue = value;
        });
      } else {
        setState(() {
          currentDoubleValue = value;
        });
      }
    }
  }

  // NOTE: Method untuk menghandel value ketika berubah dari luar
  handleValueChangedExternally(num value) {
    if (value != null) {
      if (value is int) {
        setState(() {
          currentIntValue = value;
          intNumberPicker.animateInt(value);
        });
      } else {
        currentDoubleValue = value;
        decNumberPicker.animateDecimal(currentDoubleValue.toInt());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    intNumberPicker = new NumberPicker.integer(
      initialValue: currentIntValue,
      minValue: 0,
      maxValue: 100,
      step: 10,
      onChanged: handelValueChanged,
    );

    decNumberPicker = new NumberPicker.decimal(
      initialValue: currentDoubleValue,
      minValue: 1,
      maxValue: 5,
      decimalPlaces: 2,
      onChanged: handelValueChanged,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Page Number Picker"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            intNumberPicker,
            RaisedButton(
              child: Text("Current int Value: $currentIntValue"),
              color: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                showDialogInteger(context);
              },
            ),
            decNumberPicker,
            RaisedButton(
              child: Text("Current decimal Value: $currentDoubleValue"),
              color: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onPressed: () {
                showDialogDouble(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future showDialogInteger(BuildContext context) async {
    await showDialog<int>(
      context: context,
      builder: (context) {
        return NumberPickerDialog.integer(
          minValue: 0,
          maxValue: 100,
          initialIntegerValue: currentIntValue,
        );
      },
    ).then(
      (value) => handleValueChangedExternally,
    );
  }

  Future showDialogDouble(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) {
        return NumberPickerDialog.decimal(
          minValue: 1,
          maxValue: 5,
          initialDoubleValue: currentDoubleValue,
          title: Text("Silahkan Pilih Bilangan Desimal"),
        );
      },
    );
  }
}
