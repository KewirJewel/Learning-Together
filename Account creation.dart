// Replace with your actual sign-in logic
bool signIn(String email, String password) {
  // Simulate successful sign-in
  return true;
}

// Replace with your actual logic to send verification code
void sendVerificationCode(String email) {
  // Simulate sending code
  print('Sent verification code to $email');
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isForgotPassword = false;
  String _verificationCode = '';

  void _toggleForgotPassword() {
    setState(() {
      _isForgotPassword = !_isForgotPassword;
    });
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      if (_isForgotPassword) {
        sendVerificationCode(_email);
      } else if (signIn(_email, _password)) {
        // Navigate to home page or handle successful sign-in
      } else {
        // Show error message for invalid credentials
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              if (!_isForgotPassword)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Email is required' : null,
                  onSaved: (value) => _email = value!,
                ),
              if (!_isForgotPassword)
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (value) =>
                      value!.isEmpty ? 'Password is required' : null,
                  onSaved: (value) => _password = value!,
                ),
              if (_isForgotPassword)
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) =>
                      value!.isEmpty ? 'Email is required' : null,
                  onSaved: (value) => _email = value!,
                ),
              if (_isForgotPassword)
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(labelText: 'Verification Code'),
                        validator: (value) => value!.isEmpty
                            ? 'Verification code is required'
                            : null,
                        onSaved: (value) => _verificationCode = value!,
                      ),
                    ),
                    TextButton(
                      onPressed: () => sendVerificationCode(_email),
                      child: Text('Send Code'),
                    ),
                  ],
                ),
              if (_isForgotPassword)
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'New Password'),
                  validator: (value) =>
                      value!.isEmpty ? 'Password is required' : null,
                ),
              if (_isForgotPassword)
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  validator: (value) => value != _verificationCode
                      ? 'Passwords do not match'
                      : null,
                ),
              ElevatedButton(
                onPressed: _handleSignIn,
                child: Text(_isForgotPassword ? 'Reset Password' : 'Sign In'),
              ),
              TextButton(
                onPressed: _toggleForgotPassword,
                child: Text(_isForgotPassword ? 'Sign In' : 'Forgot Password?'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

