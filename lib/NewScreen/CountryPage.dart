import 'package:flutter/material.dart';
import '../Model/CountryModel.dart';

class CountryPage extends StatefulWidget {
  const CountryPage({Key? key,required this.setCountryData}) : super(key: key);
  final Function setCountryData;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {

  List<CountryModel> countries = [
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
    CountryModel(name: "India", code: "+91", flag: "🇮🇳"),
    CountryModel(name: "Pakistan", code: "+92", flag: "🇵🇰"),
    CountryModel(name: "United States", code: "+1", flag: "🇺🇸"),
    CountryModel(name: "South Africa", code: "+27", flag: "🇿🇦"),
    CountryModel(name: "Afghanistan", code: "+93", flag: "🇦🇫"),
    CountryModel(name: "United Kingdom", code: "+44", flag: "🇬🇧"),
    CountryModel(name: "Italy", code: "+39", flag: "🇮🇹"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
              Icons.arrow_back,
              color: Colors.teal,
              size: 30
          ),
        ),
        actions: [
          IconButton(
            color: Colors.teal,
            icon: const Icon(
                Icons.search,
                size: 30
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Choose a Country',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 18,
            wordSpacing: 1,
            fontWeight: FontWeight.w600
          )
        ),
      ),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context,index)=>countryCard(countries[index])
      ),
    );
  }

  Widget countryCard(CountryModel countryModel) {
    return InkWell(
      onTap: () {
        widget.setCountryData(countryModel);
      },
      child: Card(
        margin: const EdgeInsets.all(0.15),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
          child: Row(
            children: [
              Text(countryModel.flag,
                style: const TextStyle(
                    fontSize: 30
                ),
              ),
              const SizedBox(width: 15),
              Text(countryModel.name,
                  style: const TextStyle(
                      fontSize: 16
                  )
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      countryModel.code,
                      style: const TextStyle(
                          fontSize: 16
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}