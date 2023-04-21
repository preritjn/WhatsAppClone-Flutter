import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key,required this.countryCode,required this.number}) : super(key: key);
  final String number;
  final String countryCode;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
                Icons.arrow_back,
                color: Colors.teal,
                size: 30
            )
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Verify ${widget.countryCode}${widget.number}',
          style: const TextStyle(
              color: Colors.teal
          )
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                  Icons.more_vert,
                  color: Colors.teal,
                  size: 30
              )
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            const SizedBox(height: 10),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                children: [
                  const TextSpan(
                      text: "We have sent a SMS with a code to ",
                      style: TextStyle(
                        fontSize: 14.5,
                        color: Colors.black
                      )
                  ),
                  TextSpan(
                    text: widget.countryCode+widget.number,
                      style: const TextStyle(
                          fontSize: 14.5,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  TextSpan(
                    text: ' Wrong Number?',
                    style: TextStyle(
                      color: Colors.cyan[800],
                      fontSize: 14.5
                    )
                  ),
                ]
              )
            ),
            const SizedBox(height: 5),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 30,
              style: const TextStyle(
                  fontSize: 17
              ),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                if (kDebugMode) {
                  print("Completed: $pin");
                }
              },
            ),
            const SizedBox(height: 20,),
            Text(
              'Enter 6 digit code',
              style: TextStyle(
                  color: Colors.grey[600],
                fontSize: 15
              )
            ),
            const SizedBox(height: 25),
            Row(
              children: [
                const Icon(Icons.message,color: Colors.teal,size: 30),
                const SizedBox(width: 25),
                Text('Resend SMS',style: TextStyle(color: Colors.cyan[800],fontSize: 16.5),)
              ],
            ),
            const SizedBox(height: 12),
            const Divider(thickness: 1.5),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.call,color: Colors.teal,size: 30),
                const SizedBox(width: 25),
                Text('Call Me',style: TextStyle(color: Colors.cyan[800],fontSize: 16.5),)
              ],
            )
          ],
        ),
      ),
    );
  }
}