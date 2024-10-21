// import 'all_constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../methods/show_alert_dialog.dart';
import '../network/http_controller.dart';
import '../screens/vocab_details_screen.dart';

class FrontCard extends StatefulWidget {
  const FrontCard({super.key, required this.text});
  final String text;

  @override
  State<FrontCard> createState() => _FrontCardState();
}

class _FrontCardState extends State<FrontCard> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 7,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    showSpinner=true;
                  });
                  try{
                    List<dynamic> details;
                    if(widget.text.contains('/')){
                      details = await getVocabDetails(widget.text.split('/')[0]);
                    }else{
                      details = await getVocabDetails(widget.text);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                    if (!mounted) return;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => VocabDetailsScreen(word: widget.text),
                      ),
                    );
                  }catch(e){
                    // print('something wrong');
                    // print(e);
                    setState(() {
                      showSpinner=false;
                    });
                    showAlertDialog(context);
                  }
                },
                child: Text(
                  widget.text,
                  style: const TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
