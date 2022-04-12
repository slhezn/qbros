import 'package:crud/logic/login_view_logic.dart';
import 'package:crud/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController? _controllerMail;
  TextEditingController? _controllerPass;
  String? _mail;
  String? _pass;

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red.shade100, Colors.red.shade900],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: _size.height / 4,
                width: _size.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2017/02/09/16/59/student-2052868_960_720.jpg',
                    ),
                  ),
                ),
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controllerMail,
                        onChanged: (value) => _mail = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'mail adresiniz',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.mail),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _controllerPass,
                        onChanged: (value) => _pass = value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'şifreniz',
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.lock),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (context
                            .read<LoginViewLogic>()
                            .findUser(_mail!, _pass!)) {
                          context.read<LoginViewLogic>().username = _mail;
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                        }
                      },
                      child: Container(
                        height: _size.height / 12,
                        width: _size.width / 3,
                        child: const Center(
                            child: Text(
                          'Giriş Yap',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [Colors.red.shade300, Colors.red.shade900],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
