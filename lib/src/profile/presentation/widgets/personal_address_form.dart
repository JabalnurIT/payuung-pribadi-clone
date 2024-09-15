import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/common/widgets/i_dropdown.dart';
import '../../../../core/common/widgets/i_fields.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';

class PersonalAddressForm extends StatelessWidget {
  const PersonalAddressForm({
    super.key,
    required this.registrationImageController,
    required this.registrationAddressController,
    required this.registrationProvinceController,
    required this.registrationRegencyController,
    required this.registrationDistrictController,
    required this.registrationVillageController,
    required this.registrationPostalCodeController,
    required this.domicileAddressController,
    required this.domicileProvinceController,
    required this.domicileRegencyController,
    required this.domicileDistrictController,
    required this.domicileVillageController,
    required this.domicilePostalCodeController,
    required this.personalAddressFormKey,
    required this.nextOnTap,
    required this.previousOnTap,
    required this.nothingChanged,
    required this.sameAddress,
    required this.changeSameAddress,
    required this.takePicture,
  });

  final TextEditingController registrationImageController;
  final TextEditingController registrationAddressController;
  final TextEditingController registrationProvinceController;

  final TextEditingController registrationRegencyController;
  final TextEditingController registrationDistrictController;

  final TextEditingController registrationVillageController;
  final TextEditingController registrationPostalCodeController;

  final TextEditingController domicileAddressController;
  final TextEditingController domicileProvinceController;
  final TextEditingController domicileRegencyController;
  final TextEditingController domicileDistrictController;
  final TextEditingController domicileVillageController;
  final TextEditingController domicilePostalCodeController;
  final GlobalKey<FormState> personalAddressFormKey;
  final void Function() nextOnTap;
  final void Function() previousOnTap;
  final bool nothingChanged;
  final bool? sameAddress;
  final void Function(bool?) changeSameAddress;
  final void Function() takePicture;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: personalAddressFormKey,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.73,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colours.secondaryColour,
                  boxShadow: [
                    BoxShadow(
                      color: Colours.quinaryColour.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: takePicture,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colours.primaryColour.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: SvgPicture.asset(
                              MediaRes.registrationIcon,
                              height: 30,
                              width: 30,
                              colorFilter: const ColorFilter.mode(
                                Colours.primaryColour,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Upload KTP',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
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
                          'NIK',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: registrationImageController,
                      hintText: 'NIK',
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
                          'Alamat Sesuai KTP',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: registrationAddressController,
                      hintText: 'Alamat Sesuai KTP',
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
                          'Provinsi',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: registrationProvinceController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Jawa Barat',
                          child: Text('Jawa Barat'),
                        ),
                        DropdownMenuItem(
                          value: 'Jawa Tengah',
                          child: Text('Jawa Tengah'),
                        ),
                        DropdownMenuItem(
                          value: 'Jawa Timur',
                          child: Text('Jawa Timur'),
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
                          'Kota/Kabupaten',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: registrationRegencyController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Bogor',
                          child: Text('Bogor'),
                        ),
                        DropdownMenuItem(
                          value: 'Depok',
                          child: Text('Depok'),
                        ),
                        DropdownMenuItem(
                          value: 'Bekasi',
                          child: Text('Bekasi'),
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
                          'Kecamatan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: registrationDistrictController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Cileungsi',
                          child: Text('Cileungsi'),
                        ),
                        DropdownMenuItem(
                          value: 'Cibinong',
                          child: Text('Cibinong'),
                        ),
                        DropdownMenuItem(
                          value: 'Citeureup',
                          child: Text('Citeureup'),
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
                          'Kelurahan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: registrationVillageController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Cileungsi',
                          child: Text('Cileungsi'),
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
                          'Kode Pos',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: registrationPostalCodeController,
                      hintText: 'Kode Pos',
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Row(
                  children: [
                    Checkbox(
                      value: sameAddress,
                      onChanged: changeSameAddress,
                      activeColor: Colours.primaryColour,
                      side: const BorderSide(
                        color: Colours.quinaryColour,
                      ),
                    ),
                    const Text(
                      'Alamat domisili sama dengan alamat KTP.',
                      style: TextStyle(
                        color: Colours.quinaryColour,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              if ((sameAddress != null) && !sameAddress!) ...[
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
                            'Alamat Domisili',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IFields(
                        controller: domicileAddressController,
                        hintText: 'Alamat Domisili',
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
                            'Provinsi',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IDropdown(
                        controller: domicileProvinceController,
                        items: const [
                          DropdownMenuItem(
                            value: 'Jawa Barat',
                            child: Text('Jawa Barat'),
                          ),
                          DropdownMenuItem(
                            value: 'Jawa Tengah',
                            child: Text('Jawa Tengah'),
                          ),
                          DropdownMenuItem(
                            value: 'Jawa Timur',
                            child: Text('Jawa Timur'),
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
                            'Kota/Kabupaten',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IDropdown(
                        controller: domicileRegencyController,
                        items: const [
                          DropdownMenuItem(
                            value: 'Bogor',
                            child: Text('Bogor'),
                          ),
                          DropdownMenuItem(
                            value: 'Depok',
                            child: Text('Depok'),
                          ),
                          DropdownMenuItem(
                            value: 'Bekasi',
                            child: Text('Bekasi'),
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
                            'Kecamatan',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IDropdown(
                        controller: domicileDistrictController,
                        items: const [
                          DropdownMenuItem(
                            value: 'Cileungsi',
                            child: Text('Cileungsi'),
                          ),
                          DropdownMenuItem(
                            value: 'Cibinong',
                            child: Text('Cibinong'),
                          ),
                          DropdownMenuItem(
                            value: 'Citeureup',
                            child: Text('Citeureup'),
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
                            'Kelurahan',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IDropdown(
                        controller: domicileVillageController,
                        items: const [
                          DropdownMenuItem(
                            value: 'Cileungsi',
                            child: Text('Cileungsi'),
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
                            'Kode Pos',
                            style: TextStyle(
                              color: Colours.quinaryColour,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      IFields(
                        controller: domicilePostalCodeController,
                        hintText: 'Kode Pos',
                      ),
                    ],
                  ),
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: previousOnTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colours.secondaryColour,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(
                          color: Colours.primaryColour,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5 / 2,
                      child: const Text(
                        'Sebelumnya',
                        style: TextStyle(
                          color: Colours.primaryColour,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IgnorePointer(
                    ignoring: nothingChanged,
                    child: ElevatedButton(
                      onPressed: nextOnTap,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colours.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5 / 2,
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
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
