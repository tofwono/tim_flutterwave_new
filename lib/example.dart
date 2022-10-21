import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tim_flutterwave/core/tim_flutterwave.dart';

class TimFlutterExample extends StatefulWidget {
  const TimFlutterExample({Key? key}) : super(key: key);

  @override
  State<TimFlutterExample> createState() => _TimFlutterExampleState();
}

class _TimFlutterExampleState extends State<TimFlutterExample> {
  //controllers
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  bool? res = false;
  late String res1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tim Flutterwave Payment'),
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              children: [
                //title
                const Text(
                  'Flutterwave payment',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _fullNameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone',
                  ),
                ),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    var data = {
                      'amount': _amountController.text,
                      'email': _emailController.text,
                      'phone': _phoneController.text,
                      'name': _fullNameController.text,
                      'payment_options':
                          'card, banktransfer, ussd, mpesa, mobile_money_rwanda,mobile_money_uganda, mobile_money_zambia, mobile_money_ghana',
                      'title': 'Flutterwave payment',
                      'currency': "UGX",
                      'tx_ref':
                          "AdeFlutterwave-${DateTime.now().millisecondsSinceEpoch}",
                      'icon':
                          "https://www.aqskill.com/wp-content/uploads/2020/05/logo-pde.png",
                      'public_key':
                          "FLWPUBK_TEST-bef5d259e2f13e98debf9fb18af5cbf5-X",
                      'sk_key':
                          'FLWSECK_TEST-5fa1e6a732ec05ceb06928840dca4d92-X'
                    };

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimFlutterWavePay(data),
                      ),
                    ).then((response) {
                      //response is the response from the payment
                      //print(response);
                      print(response['=================']);
                      print(response['status']);
                      print(response['message']);
                      print(response['data']['id']);
                      print(response['data']['tx_ref']);
                      print(response['data']['flw_ref']);
                      print(response['data']['device_fingerprint']);
                      print(response['data']['amount']);
                      print(response['data']['currency']);
                      print(response['data']['charged_amount']);
                      print(response['data']['app_fee']);
                      print(response['data']['merchant_fee']);
                      print(response['data']['processor_response']);
                      print(response['data']['auth_model']);
                      print(response['data']['ip']);
                      print(response['data']['narration']);
                      print(response['data']['status']);
                      print(response['data']['payment_type']);
                      print(response['data']['created_at']);
                      print(response['data']['account_id']);
                      //final response1 = jsonDecode(response);
                      //print('$response1');

                      //if (response["status"] != "cancelled") {}
                      res = true;
                      //res1 = response;
                      // set up the AlertDialog
                    });
                  },
                  child: const Text('Pay'),
                ),

                if (res!)
                  const Text(
                    'Test',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )

                // }
              ],
            ),
          ),
        ));
  }
}
