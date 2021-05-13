import 'package:chat_app/services/appstate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool mostrarFormulario = false;
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0XFFA0D523),
      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
                width: size.width * 0.7,
                child: Image.asset('assets/images/logo1.png'),
              ),
            ),
            this.mostrarFormulario == false ? Dismissible(
              key: Key('login'),
              direction: DismissDirection.up,
              onDismissed: (DismissDirection dir){
                print("Se ha deslizado");
                print(dir);
                this.mostrarFormulario = true;
                setState(() {
                  
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Icon(Icons.arrow_upward,
                    color: Colors.white,
                    size: 30,),
                    Text("ENTRAR", 
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'DMSans',
                      color: Colors.white
                    ),),
                  ],
                ),
              ),
            ): Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                // color: Colors.green,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text("Logueate", style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 20
                      ),
                      textAlign: TextAlign.center,),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: this._emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          filled: true,
                          labelText: "Correo Electrònico"
                        ),
                        keyboardType: TextInputType.emailAddress,
                        // ignore: missing_return
                        validator: (val){
                          //Validar Contraseña
                          if (val.isEmpty)
                            return "Este campo es necesario";
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: this._passwordController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.transparent
                            )
                          ),
                          filled: true,
                          labelText: "Contraseña"
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        // ignore: missing_return
                        validator: (String val){
                          if (val.isEmpty)
                          return "Este campo es necesario";
                          if (val.length < 6){
                            return 'La contraseña es muy corta';
                          }
                        },
                      ),
                      InkWell(
                        onTap: (){
                          if( _formKey.currentState.validate() )
                          Provider.of<AppState>(context, listen: false).log_in(
                            _emailController.text,
                            _passwordController.text
                          );
                          print("Esta todo correcto");
                          // Provider.of<AppState>(context, listen: false).log_in();
                        },
                        splashColor: Colors.yellow,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),
                          width: double.infinity,
                          child: Center(
                            child: Text("Entrar", 
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Registrate ahora", style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto',
                        fontSize: 20
                      ),)
                    ],
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}