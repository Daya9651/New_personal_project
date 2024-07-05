import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:likhit/screens/profile/profiledata.dart';
import 'package:likhit/service/api_url.dart';
import 'package:likhit/style/text_style.dart';

class ProfileInputPage extends StatefulWidget {
  @override
  _ProfileInputPageState createState() => _ProfileInputPageState();
}

class _ProfileInputPageState extends State<ProfileInputPage> {
  TextEditingController editProfile = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userAddController = TextEditingController();
  final TextEditingController _userAboutController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _qualifiactionController = TextEditingController();
  final TextEditingController _passingyearController = TextEditingController();
  final TextEditingController _academicController = TextEditingController();
  final TextEditingController _acdQalifiactionController = TextEditingController();
  final TextEditingController _acdpassingController = TextEditingController();
  final TextEditingController _advicePriceController = TextEditingController();
  final TextEditingController _documentpriceController = TextEditingController();
  final TextEditingController _casepriceController = TextEditingController();
  final TextEditingController _officeNameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _barstateController = TextEditingController();
  final TextEditingController _baridController = TextEditingController();
  final TextEditingController _baradmissionController = TextEditingController();

  final TextEditingController _servicesController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  File? _image =  null;

  Future<void> _getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  // ApiService apiService = ApiService();
  // late Future<editProfile> futureProfile;

  @override
  void initState() {
    super.initState();
    // EmailService().viewProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('Profile', style: AppTextStyles.kBody15SemiBoldTextStyle,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
    Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _image == null
                    ? ElevatedButton(
                     onPressed: _getImage,
                      child: const Text('Pick an image'),
                )
                    : CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(_image!),
                ),
                const SizedBox(height: 10.0),
                Text('Personal Details', style: AppTextStyles.kBody15RegularTextStyle,),
                Container(
                  padding: const EdgeInsets.all(8.00),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _userIdController,
                        decoration: const InputDecoration(
                          labelText: 'User Id',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _userNameController,
                        decoration: const InputDecoration(
                          labelText: 'User Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _userAddController,
                        decoration: const InputDecoration(
                          labelText: 'User Add',
                        ),
                      ),
                      TextFormField(
                        controller: _userAboutController,
                        decoration: const InputDecoration(
                          labelText: 'About Adv',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text('Education & Qualification', style: AppTextStyles.kBody15RegularTextStyle,),
                Container(
                  padding: const EdgeInsets.all(8.00),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _universityController,
                        decoration: const InputDecoration(
                          labelText: 'College / University Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _qualifiactionController,
                        decoration: const InputDecoration(
                          labelText: 'Qualification',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _passingyearController,
                        decoration: const InputDecoration(
                          labelText: 'Year of Passing',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _academicController,
                        decoration: const InputDecoration(
                          labelText: 'School Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _acdQalifiactionController,
                        decoration: const InputDecoration(
                          labelText: 'Academic',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _acdpassingController,
                        decoration: const InputDecoration(
                          labelText: 'Academic Passing Year',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text('Services Offered', style: AppTextStyles.kBody15RegularTextStyle,),
                Container(
                  padding: const EdgeInsets.all(8.00),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _advicePriceController,
                        decoration: const InputDecoration(
                          labelText: 'Legal advice price',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _documentpriceController,
                        decoration: const InputDecoration(
                          labelText: 'Document Review Price',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _casepriceController,
                        decoration: const InputDecoration(
                          labelText: 'Case Review price',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),
                Text('Experience', style: AppTextStyles.kBody15RegularTextStyle,),
                Container(
                  padding: const EdgeInsets.all(8.00),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _officeNameController,
                        decoration: const InputDecoration(
                          labelText: 'Last Court Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: _positionController,
                        decoration: const InputDecoration(
                          labelText: 'Last Position',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text('Bar Management', style: AppTextStyles.kBody15RegularTextStyle,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child:Column(
                    children: [
                      TextFormField(
                        controller: _barstateController,
                        decoration: const InputDecoration(
                          labelText: 'State',
                        ),
                      ),
                      TextFormField(
                        controller: _baridController,
                        decoration: const InputDecoration(
                          labelText: 'Bar ID',
                        ),
                      ),
                      TextFormField(
                        controller: _baradmissionController,
                        decoration: const InputDecoration(
                          labelText: 'Admission date',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileDisplayPage(
                          image: _image,
                          userId: _userIdController.text,
                          userName: _userNameController.text,
                          userAdd: _userAddController.text,
                          userAbout: _userAboutController.text,
                          university: _universityController.text,
                          qualification: _qualifiactionController.text,
                          passingyear: _passingyearController.text,
                          academic: _academicController.text,
                          acadqualification: _acdQalifiactionController.text,
                          acadpasssing: _acdpassingController.text,
                          adviceprice: _acdpassingController.text,
                          documentprice: _acdpassingController.text,
                          caseprice: _acdpassingController.text,
                          officeName: _officeNameController.text,
                          position: _positionController.text,
                          barstate: _barstateController.text,
                          barid: _baridController.text,
                          baradmission: _baradmissionController.text,
                          servicesOffered: _servicesController.text,
                          experience: _experienceController.text,
                        ),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            // );
          //
          ),
        ),
      ),
    );
  }
}
