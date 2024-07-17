class Profile {
  String name;
  String email;
  String telephone;
  String password;

  Profile(this.name, this.email, this.telephone, this.password);
}

class MyApp extends StatelessWidget {
  final Profile profile = Profile("John Doe", "johndoe@example.com", "+1234567890", "password");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          actions: [
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () => showProfileDialog(context),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Name: ${profile.name}\nEmail: ${profile.email}\nTelephone: ${profile.telephone}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void showProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Profile'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              initialValue: profile.name,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (value) => profile.name = value,
            ),
            TextField(
              initialValue: profile.email,
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => profile.email = value,
            ),
            TextField(
              initialValue: profile.telephone,
              decoration: InputDecoration(labelText: 'Telephone'),
              onChanged: (value) => profile.telephone = value,
            ),
            TextField(
              initialValue: profile.password,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
              onChanged: (value) => profile.password = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement logic to save profile changes (e.g., update database)
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}