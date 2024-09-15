import 'package:flutter/material.dart';
import 'package:payung_pribadi_clone/core/common/widgets/i_dropdown.dart';

import '../../../../core/common/widgets/calendar_widget.dart';
import '../../../../core/common/widgets/i_fields.dart';
import '../../../../core/res/colours.dart';

class PersonalBioForm extends StatelessWidget {
  const PersonalBioForm({
    super.key,
    required this.nameController,
    required this.birthDateController,
    required this.genderController,
    required this.emailController,
    required this.phoneNumberController,
    required this.educationController,
    required this.maritalStatusController,
    required this.personalBioFormKey,
    required this.buttonOnTap,
    required this.nothingChanged,
  });

  final TextEditingController nameController;
  final TextEditingController birthDateController;
  final TextEditingController genderController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;
  final TextEditingController educationController;
  final TextEditingController maritalStatusController;
  final GlobalKey<FormState> personalBioFormKey;
  final void Function() buttonOnTap;
  final bool nothingChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: personalBioFormKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.73,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colours.errorColour,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Nama Lengkap',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: nameController,
                      hintText: 'Nama Lengkap',
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colours.errorColour,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Tanggal Lahir',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    // IFields(
                    //   controller: birthDateController,
                    //   hintText: 'Tanggal Lahir',
                    // ),
                    IFields(
                      controller: birthDateController,
                      hintText: 'DD/MM/YYYY',
                      keyboardType: TextInputType.datetime,
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colours.primaryColour,
                      ),
                      overrideValidator: false,
                      readOnly: true,
                      onTap: () {
                        showModalBottomSheet<void>(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return CalendarWidget(
                              dateController: birthDateController,
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colours.errorColour,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Jenis Kelamin',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: genderController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Laki-laki',
                          child: Text('Laki-laki'),
                        ),
                        DropdownMenuItem(
                          value: 'Perempuan',
                          child: Text('Perempuan'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colours.errorColour,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Alamat Email',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: emailController,
                      hintText: 'Alamat Email',
                      readOnly: true,
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          '*',
                          style: TextStyle(
                            color: Colours.errorColour,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'No. HP',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: phoneNumberController,
                      hintText: 'No. HP',
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Pendidikan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: educationController,
                      items: const [
                        DropdownMenuItem(
                          value: 'SD',
                          child: Text('SD'),
                        ),
                        DropdownMenuItem(
                          value: 'SMP',
                          child: Text('SMP'),
                        ),
                        DropdownMenuItem(
                          value: 'SMA',
                          child: Text('SMA'),
                        ),
                        DropdownMenuItem(
                          value: 'D1',
                          child: Text('D1'),
                        ),
                        DropdownMenuItem(
                          value: 'D2',
                          child: Text('D2'),
                        ),
                        DropdownMenuItem(
                          value: 'D3',
                          child: Text('D3'),
                        ),
                        DropdownMenuItem(
                          value: 'S1',
                          child: Text('S1'),
                        ),
                        DropdownMenuItem(
                          value: 'S2',
                          child: Text('S2'),
                        ),
                        DropdownMenuItem(
                          value: 'S3',
                          child: Text('S3'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 90,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Status Pernikahan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: maritalStatusController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Belum Kawin',
                          child: Text('Belum Kawin'),
                        ),
                        DropdownMenuItem(
                          value: 'Kawin',
                          child: Text('Kawin'),
                        ),
                        DropdownMenuItem(
                          value: 'Janda',
                          child: Text('Janda'),
                        ),
                        DropdownMenuItem(
                          value: 'Duda',
                          child: Text('Duda'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IgnorePointer(
                ignoring: nothingChanged,
                child: ElevatedButton(
                  onPressed: buttonOnTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: nothingChanged
                        ? Colours.secondaryDisabledColour
                        : Colours.primaryColour,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.74,
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                        color: Colours.secondaryColour,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
