import 'package:flutter/material.dart';

class ApiAdress extends StatelessWidget {
  static const String routeName = "/api-adreese";
  ApiAdress({super.key});
  final TextEditingController _apiController = TextEditingController();

  void saveIpAdresse() {
    print("Saving ... ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SETTING API ADDRESS")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: _apiController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF393939),
                  fontSize: 13,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color(0xFF755DC1),
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xFF837E93),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1,
                      color: Color(0xFF9F7BFF),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: saveIpAdresse,
                  icon: Icon(Icons.save),
                  label: Text("Sauvegarder"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
