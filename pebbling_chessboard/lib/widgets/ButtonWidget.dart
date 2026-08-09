import 'package:flutter/material.dart';

var size,height,width;
class ButtonWidget extends StatelessWidget{
  final String title;
  final VoidCallback  onPressed;
  const ButtonWidget({Key? key, required this.title, required this.onPressed, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Padding(
      padding: EdgeInsets.all(width*0.01),
      child: SizedBox(
        height: height*0.075,
        width: width*0.7,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStateProperty.all(Color(0xffE1B310)),
              textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black, fontFamily: "Rye")),
              elevation: MaterialStateProperty.all(20.0),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  )
                  )),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: TextStyle(
                fontSize: width*0.1,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
          ),
          onPressed: onPressed

        ),
      ),
    );
  }
}
