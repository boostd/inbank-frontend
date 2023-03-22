import 'package:flutter/material.dart';
import 'api_service.dart';


class LoanForm extends StatefulWidget {
  @override
  _LoanFormState createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();
  String _nationalId = '';
  int _loanAmount = 2000;
  int _loanPeriod = 12;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Makes a request to the backend API here
      void _submitForm() async {
        if (_formKey.currentState!.validate()) {
          try {
            final result = await _apiService.requestLoanDecision(_nationalId, _loanAmount, _loanPeriod);
            print('Loan Amount: ${result['loanAmount']}');
            print('Loan Period: ${result['loanPeriod']}');
          } catch (e) {
            print('Error: $e');
          }
        }
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'National ID',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a National ID';
                  }
                  // Add more validation logic if needed
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _nationalId = value;
                  });
                },
              ),
              SizedBox(height: 24.0),
              Text('Loan Amount: $_loanAmount €'),
              Slider(
                value: _loanAmount.toDouble(),
                min: 2000,
                max: 10000,
                onChanged: (double newValue) {
                  setState(() {
                    _loanAmount = newValue.round();
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Loan Amount (€)',
                ),
                initialValue: '2000',
                validator: (value) {
                  final intValue = int.tryParse(value ?? '');
                  if (intValue == null || intValue < 2000 || intValue > 10000) {
                    return 'Loan amount must be between 2000 and 10000 €';
                  }
                  return null;
                },
                onChanged: (value) {
                  final intValue = int.tryParse(value);
                  if (intValue != null && intValue >= 2000 &&
                      intValue <= 10000) {
                    setState(() {
                      _loanAmount = intValue;
                    });
                  }
                },
              ),
              SizedBox(height: 24.0),
              Text('Loan Period: $_loanPeriod months'),
              Slider(
                value: _loanPeriod.toDouble(),
                min: 12,
                max: 60,
                onChanged: (double newValue) {
                  setState(() {
                    _loanPeriod = newValue.round();
                  });
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Loan Period (months)',
                ),
                initialValue: '12',
                validator: (value) {
                  final intValue = int.tryParse(value ?? '');
                  if (intValue == null || intValue < 12 || intValue > 60) {
                    return 'Loan period must be between 12 and 60 months';
                  }
                  return null;
                },
                onChanged: (value) {
                  final intValue = int.tryParse(value);
                  if (intValue != null && intValue >= 12 && intValue <= 60) {
                    setState(() {
                      _loanPeriod = intValue;
                    });
                  }
                },
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
