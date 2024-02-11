import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_dependency/core/presentation/input_validation/common_validation/mobilne_number.dart';
import 'package:platform_dependency/core/presentation/navigation/route_builder.dart';

class InputValidationRoute extends RouteBuilder {
  @override
  Route mold(RouteSettings settings) {
    return MaterialPageRoute(builder: (ctx) => const InputValidationScreen());
  }
}

class InputValidationScreen extends StatefulWidget {
  const InputValidationScreen({super.key});

  @override
  State<InputValidationScreen> createState() => _InputValidationScreenState();
}

class _InputValidationScreenState extends State<InputValidationScreen> {
  String msg = "";
  MobileNumberInput input = const MobileNumberInput.pure();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Validation Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              inputFormatters: [LengthLimitingTextInputFormatter(11)],
              onChanged: (value) {
                input = MobileNumberInput.dirty(value);
                if (input.isValid) {
                  setState(() {
                    msg = "";
                  });
                } else {
                  setState(() {
                    msg = input.error!.message(context);
                  });
                }
              },
              decoration: const InputDecoration(
                hintText: "01Xxxxxxxxx",
                labelText: "Mobile Number",
              ),
            ),
            Text(msg),
          ],
        ),
      ),
    );
  }
}
