import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/CountryPage.dart';
import 'package:whatsapp_clone/NewScreen/OTPScreen.dart';
import 'package:whatsapp_clone/Screens/LoginScreen.dart';
import '../Model/CountryModel.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String countryName = 'India';
  String countryCode = '+91';
  final TextEditingController _textEditingController = TextEditingController();

  Widget countryCard() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>CountryPage(setCountryData: setCountryData)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.teal,
                    width: 1.8
                )
            )
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                    countryName,
                    style: const TextStyle(
                        fontSize: 16
                    )
                ),
              ),
            ),
            const Icon(
                Icons.arrow_drop_down,
                color: Colors.teal,
                size: 28
            )
          ],
        ),
      ),
    );
  }

  Widget number() {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 38,
      child: Row(
        children: [
          Container(
            width: 70,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.teal,
                  width: 1.8
                )
              )
            ),
            child: Center(
              child: Text(
                countryCode,
                style: const TextStyle(
                    fontSize: 18
                )
              )
            ),
          ),
          const SizedBox(width: 30),
          Container(
            width: MediaQuery.of(context).size.width/1.5-100,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Colors.teal,
                        width: 1.8
                    )
                )
            ),
            child: TextFormField(
              controller: _textEditingController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(8),
                hintText: "Phone Number",
              ),
            ),
          )
        ],
      ),
    );
  }

  void setCountryData(CountryModel countryModel) {
    setState(() {
      countryName = countryModel.name;
      countryCode = countryModel.code;
    });
    Navigator.pop(context);
  }

  Future<void> showMyDialogue() {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'We will be verifying your phone number',
                  style: TextStyle(
                      fontSize: 16
                  )
              ),
              const SizedBox(height: 8),
              Text(
                "$countryCode ${_textEditingController.text}",
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 8),
              const Text(
                'Is this OK, or would you like to edit the number',
                style: TextStyle(
                    fontSize: 15.5
                )
              )
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                  'Edit',
                  style:
                  TextStyle(
                      fontSize: 15,
                      color: Colors.teal
                  )
              )
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (builder)=>OTPScreen(countryCode: countryCode,number: _textEditingController.text)));
              },
              child: const Text(
                  'Ok',style: TextStyle(
                  fontSize: 15,
                  color: Colors.teal
              )
            )
          )
        ],
      );
    });
  }

  Future<void> showMyDialogue1() {
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                  'Enter a valid number',
                  style: TextStyle(
                      fontSize: 16
                  )
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                  'Ok',
                  style:
                  TextStyle(
                      fontSize: 15,
                      color: Colors.teal
                  )
              )
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Enter your phone number',
          style: TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              wordSpacing: 1
          ),
        ),
        centerTitle: true,
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.black,
            size: 30,
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Column(
          children: [
            const Text(
                'WhatsApp will send a sms message to verify your number',
                style: TextStyle(
                    fontSize: 15.5
                )
            ),
            const SizedBox(height: 5),
            Text(
                'Whats my number?',
                style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.cyan[800]
                )
            ),
            const SizedBox(height: 15),
            countryCard(),
            const SizedBox(height: 5),
            number(),
            Expanded(child: Container()),
            InkWell(
              onTap: () {
                if(_textEditingController.text.length<10) {
                  showMyDialogue1();
                } else {
                  showMyDialogue();
                }
              },
              child: Container(
                height: 40,
                width: 70,
                color: Colors.tealAccent[400],
                child: const Center(
                  child: Text(
                    'NEXT',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    )
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}