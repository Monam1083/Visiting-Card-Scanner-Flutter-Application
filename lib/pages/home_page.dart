import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:visting_card_scanner_application/pages/scan_page.dart';
import 'package:visting_card_scanner_application/provider/contact_provider.dart';
import 'package:visting_card_scanner_application/utils/helper_function.dart';

class HomePage extends StatefulWidget {
  static const String routername = "/";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedindex = 0;
  @override
  void didChangeDependencies() {
    Provider.of<ContactProvider>(context, listen: false).getAllContacts();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact List")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.goNamed(ScanPage.routername);
        },
        shape: const CircleBorder(),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          onTap: (index) {
            setState(() {
              selectedindex = index;
            });
            _fetchData();
          },
          currentIndex: selectedindex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "All"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourite",
            ),
          ],
        ),
      ),
      body: Consumer<ContactProvider>(
        builder: (context, Provider, child) => ListView.builder(
          itemCount: Provider.contactList.length,
          itemBuilder: (context, index) {
            final contact = Provider.contactList[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: const EdgeInsets.only(right: 20),
                alignment: FractionalOffset.centerRight,
                color: Colors.red,
                child: Icon(Icons.delete, size: 25, color: Colors.white),
              ),
              confirmDismiss: _showConfirmationDialog,
              onDismissed: (_) async {
                await Provider.deleteContact(contact.id);
                showMsg(context, "Delete");
              },
              child: ListTile(
                title: Text(contact.name),
                trailing: IconButton(
                  onPressed: () {
                    Provider.updateFavourite(contact);
                  },
                  icon: Icon(
                    contact.favourite ? Icons.favorite : Icons.favorite_border,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(DismissDirection direction) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Contact"),
        content: const Text("are you sure want to delete contact:?"),
        actions: [
          OutlinedButton(
            onPressed: () {
              context.pop(false);
            },
            child: const Text("NO"),
          ),
          OutlinedButton(
            onPressed: () {
              context.pop(true);
            },
            child: const Text("YES"),
          ),
        ],
      ),
    );
  }

  void _fetchData() {
    switch (selectedindex) {
      case 0:
        Provider.of<ContactProvider>(context, listen: false).getAllContacts();
        break;
      case 1:
        Provider.of<ContactProvider>(context, listen: false).getAllContacts();
        break;
    }
  }
}
