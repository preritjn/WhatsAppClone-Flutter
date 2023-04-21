import 'package:flutter/material.dart';
import 'package:whatsapp_clone/NewScreen/LoginPage.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Welcome to WhatsApp',
                style: TextStyle(
                  fontSize: 29,
                  color: Colors.teal,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height/8),
              Image.asset('assets/bg.png',color: Colors.greenAccent[700],height: 340,width: 340),
              SizedBox(height: MediaQuery.of(context).size.height/8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17
                      ),
                      children: [
                        TextSpan(
                          text: "Agree and Continue to accept the",
                          style: TextStyle(
                            color: Colors.grey[600]
                          )
                        ),
                        const TextSpan(
                          text: "WhatsApp Terms of Service and Privacy Policy",
                          style: TextStyle(
                            color: Colors.cyan
                          )
                        ),
                      ]
                  )
                ),
              ),
              const SizedBox(height: 22),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>const LoginPage()));
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width-110,
                  height: 50,
                  child: Card(
                    elevation: 7,
                    margin: const EdgeInsets.all(0),
                    color: Colors.greenAccent[700],
                    child: const Center(
                      child: Text(
                          'AGREE AND CONTINUE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          )
                      ),
                    ),
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