import 'package:flutter/material.dart';

class FormBmi extends StatefulWidget {
  const FormBmi({super.key});

  @override
  State<FormBmi> createState() => _FormBmiState();
}

class _FormBmiState extends State<FormBmi> {
  final _formKey = GlobalKey<FormState>();
  final _txtHeight = TextEditingController();
  final _txtWeight = TextEditingController();

  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Tính chỉ số BMI")),
        backgroundColor: const Color.fromARGB(255, 14, 142, 21),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _txtHeight,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.height),
                    labelText: "Chiều cao (m)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập chiều cao";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _txtWeight,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.monitor_weight_outlined),
                    labelText: "Cân nặng (kg)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Vui lòng nhập cân nặng";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 142, 21),
                    foregroundColor: Colors.white,  
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      double h = double.parse(_txtHeight.text);
                      double w = double.parse(_txtWeight.text);

                      double bmi = w / (h * h);

                      String explain = "";
                      if (bmi < 18.5) {
                        explain = "Gầy";
                      } else if (bmi < 24.9) {
                        explain = "Bình thường";
                      } else if (bmi < 29.9) {
                        explain = "Thừa cân";
                      } else {
                        explain = "Béo phì";
                      }

                      setState(() {
                        _result = "BMI: ${bmi.toStringAsFixed(2)} - $explain";
                      });
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.calculate),
                        SizedBox(width: 10),
                        Text("Tính BMI"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  _result,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
