// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();

//   bool isLoading = false;

//   signUp() async {
//     setState(() => isLoading = true);

//     try {
//       // 1. Create user in Firebase Auth
//       UserCredential userCred = 
//           await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // 2. Store user data in Firestore
//       await FirebaseFirestore.instance
//           .collection("users")
//           .doc(userCred.user!.uid)
//           .set({
//         "email": emailController.text.trim(),
//         "createdAt": DateTime.now(),
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("User Created Successfully!")),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(e.toString())),
//       );
//     }

//     setState(() => isLoading = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Firebase SignUp")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: "Email",
//               ),
//             ),
//             const SizedBox(height: 15),
//             TextField(
//               controller: passwordController,
//               decoration: const InputDecoration(
//                 labelText: "Password",
//               ),
//               obscureText: true,
//             ),
//             const SizedBox(height: 25),

//             isLoading
//                 ? const CircularProgressIndicator()
//                 : ElevatedButton(
//                     onPressed: signUp,
//                     child: const Text("Create Account"),
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          "User ID:\n${FirebaseAuth.instance.currentUser!.email}",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
