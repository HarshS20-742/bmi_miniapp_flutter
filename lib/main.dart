import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  var inController = TextEditingController();
  var wtController = TextEditingController();
  var ftController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade100;

  void _incrementCounter() {
    setState(() {
     
     
    });
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      appBar: AppBar(
     
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text("Your BMI"),
      ),
      body: Container(
        color: Colors.orange,
      
       child:Center(
       child:Container(
        color: bgColor,
        width: 300,
      
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("BMI", style: TextStyle(
            fontSize: 34, fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 25,),


          TextField(
            controller : wtController,
            decoration: const InputDecoration(
              label: Text("Enter your weight in Kgs"),
              prefixIcon: Icon(Icons.line_weight),
            ),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 15,),

          TextField(
            controller: ftController,
            decoration: const InputDecoration(
              label: Text('Enter Your Height(in Feet)'),
              prefixIcon: Icon(Icons.height),
            ),
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 15,),

          TextField(
            controller: inController,
            decoration: const InputDecoration(
              label: Text("Enter your height(in inches)"),
              prefixIcon: Icon(Icons.height_rounded),
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 15,),

          ElevatedButton(onPressed: (){
            var wt = wtController.text.toString();
            var ft = ftController.text.toString();
            var inc = inController.text.toString();
            
            if(wt!="" && ft!="" && inc!=""){
              //BMI Calculation
              var iwt = int.parse(wt);
              var ift = int.parse(ft);
              var iin = int.parse(inc);

              var totalinches = (ift*12) + iin;
              var totalCm = totalinches*2.24;
              var tM = totalCm/100;

              var Bmi  = iwt/(tM*tM);

               var msg = "";

               if(Bmi>25){
                msg = "You Are OverWeight!!!";
                bgColor = Colors.purple.shade100;
               }
               else if(Bmi<18){
                msg = "You are underWeight!!!";
                bgColor = Colors.red.shade100;
               }
               else{
                msg = "You are Perfect!!!";
                bgColor = Colors.green.shade100;
               }

              setState(() {
                result = "$msg \n Your BMI is : ${Bmi.toStringAsFixed(2)}";
              });
            }
            else{
              setState(() {
                result = "All the Fields are mandatory for the Caalculation";
              });
            }


          }, child: Text("Calculate")),
          SizedBox(height: 15,),


          Text(result, style: TextStyle(fontSize: 20),)
          
          
        ],)
      )
      )
      )
    );
    
       
        
    
  }
}
