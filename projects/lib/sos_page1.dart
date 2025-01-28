import 'package:flutter/material.dart';
import 'sos_page2.dart'; // Import the new SOSPage2
import 'emergency_data.dart'; // Import the EmergencyData class

class SOSPage1 extends StatefulWidget {
  const SOSPage1({super.key});

  @override
  _SOSPage1State createState() => _SOSPage1State();
}

class _SOSPage1State extends State<SOSPage1> {
  String _selectedOption = '';
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _otherController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmitPressed = false;

  void _selectOption(String option) {
    setState(() {
      _selectedOption = option;
      _isSubmitPressed = false; // Reset the flag when an option is selected
    });
  }

  String? _validateSelection() {
    if (_selectedOption.isEmpty && _isSubmitPressed) {
      return 'Please select a disaster type';
    }
    return null;
  }

  void _submitForm() {
    setState(() {
      _isSubmitPressed = true;
    });

    if (_formKey.currentState?.validate() ?? false) {
      // Retrieve the location and contact information
      String location = "12.9716° N, 77.5946° E"; // Placeholder for GPS data
      String contact = "+1234567890"; // Placeholder for contact information

      // Create an EmergencyData instance
      EmergencyData emergencyData = EmergencyData(
        type: _selectedOption == 'Other' ? _otherController.text : _selectedOption,
        people: int.parse(_controller.text),
        needs: "", // Placeholder
        injuries: "", // Placeholder
        location: location,
        contact: contact,
        timestamp: DateTime.now(),
      );

      // Navigate to SOSPage2 with the initial data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SOSPage2(emergencyData: emergencyData),
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SOS Page'),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
                  childAspectRatio: 1, // Make the buttons square
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: <Widget>[
                    _buildOptionButton('Flood'),
                    _buildOptionButton('Landslide'),
                    _buildOptionButton('Fire'),
                    _buildOptionButton('Building Collapse'),
                    _buildOptionButton('Vehicle Accident'),
                    _buildOptionButton('Other'),
                  ],
                ),
                const SizedBox(height: 20),
                if (_selectedOption == 'Other')
                  TextFormField(
                    controller: _otherController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Please specify the disaster',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please specify the disaster';
                      }
                      return null;
                    },
                  ),
                if (_selectedOption == 'Other') const SizedBox(height: 20),
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number of people in danger',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                    foregroundColor: Colors.purple, // Text color
                    side: BorderSide(color: Colors.black), // Border color
                    elevation: 5, // Elevation for shadow
                    shadowColor: Colors.black, // Shadow color
                  ),
                  child: const Text('Submit'),
                ),
                if (_validateSelection() != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      _validateSelection()!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(String option) {
    final bool isSelected = _selectedOption == option;
    return ElevatedButton(
      onPressed: () => _selectOption(option),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.green : Colors.blue, // Background color
        foregroundColor: Colors.white, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35), // Rounded edges
        ),
        padding: const EdgeInsets.all(8), // Reduce padding for smaller buttons
        minimumSize: const Size(100, 50), // Minimum size of the button
      ),
      child: Text(
        option,
        style: const TextStyle(fontSize: 19), // Reduce font size
      ),
    );
  }
}