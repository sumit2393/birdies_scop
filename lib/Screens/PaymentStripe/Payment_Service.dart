import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentService{

  addCard(token){
    FirebaseAuth.instance.currentUser().then
      ((user){
        Firestore.instance.collection('cards').document(user.uid).collection('token').add({'tokenId': token}).then((val){
          print('saved');


        });

    });
  }

}


