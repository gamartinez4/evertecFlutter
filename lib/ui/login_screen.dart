
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../injection.dart';
import '../notifiers/login_notifier.dart';

class LoginScreen extends HookConsumerWidget {

    final loginNotifier = ChangeNotifierProvider<LoginNotifier>((ref) => getIt<LoginNotifier>());
    List<TextEditingController> textControllers = [TextEditingController(), TextEditingController(), TextEditingController()];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPasswordVisible = useState(false);


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset('assets/sentada.webp', fit: BoxFit.cover),
              const SizedBox(height: 20),
              const Text(
                'Bienvenido a:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Evertec',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.orange),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Tipo Documento:',
                  border: OutlineInputBorder(),
                ),
                controller: textControllers[0],
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Número Documento:',
                  border: OutlineInputBorder(),
                  
                ),
                controller: textControllers[1]
              ),
              const SizedBox(height: 10),
              TextFormField(
                obscureText: !isPasswordVisible.value,
                decoration: InputDecoration(
                  labelText: 'Contraseña:',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                    
                      isPasswordVisible.value ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                    
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                  )
                ),
                controller: textControllers[2]
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String loginJson = '{"document_type" : "${textControllers[0].text}", "document_number" : "${textControllers[1].text}", "password" : "${textControllers[2].text}"}';
                  if(await ref.read(loginNotifier).login(loginJson)) {
                    textControllers[0].text = '';
                    textControllers[1].text = '';
                    textControllers[2].text = '';
                    Navigator.pushNamed(context, "/main");
                  } else{
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: const Text('Credenciales invalidas'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                  
                    );
                  }

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, 
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20), 
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold), 
                ),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () {
                  showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('Registrar usuario'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                    
                      );
                },
                child: const Text('Registrar Usuario'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: SvgPicture.asset('assets/google_icon.svg', height: 50), 
                    onPressed: () {
                     showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('google'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                    
                      );
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/facebook_icon.svg',height: 50), 
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('facebook'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                    
                      );
                    },
                  ),
                  IconButton(
                    icon: SvgPicture.asset('assets/instagram_icon.svg',height: 50), 
                    onPressed: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          content: const Text('Instagram'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                    
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}