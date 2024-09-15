import 'package:flutter/material.dart';

import '../../../../core/common/widgets/i_dropdown.dart';
import '../../../../core/common/widgets/i_fields.dart';
import '../../../../core/res/colours.dart';

class CompanyInfoForm extends StatelessWidget {
  const CompanyInfoForm({
    super.key,
    required this.companyNameController,
    required this.companyAddressController,
    required this.companyDepartmentController,
    required this.companyWorkDurationController,
    required this.incomeResourchController,
    required this.annualIncomeController,
    required this.bankNameController,
    required this.bankBranchController,
    required this.accountNumberController,
    required this.accountNameController,
    required this.companyInfoFormKey,
    required this.nextOnTap,
    required this.previousOnTap,
    required this.nothingChanged,
  });

  final TextEditingController companyNameController;
  final TextEditingController companyAddressController;
  final TextEditingController companyDepartmentController;
  final TextEditingController companyWorkDurationController;
  final TextEditingController incomeResourchController;
  final TextEditingController annualIncomeController;
  final TextEditingController bankNameController;
  final TextEditingController bankBranchController;
  final TextEditingController accountNumberController;
  final TextEditingController accountNameController;
  final GlobalKey<FormState> companyInfoFormKey;
  final void Function() nextOnTap;
  final void Function() previousOnTap;
  final bool nothingChanged;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: companyInfoFormKey,
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
                          'Nama Usaha / Perusahaan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: companyNameController,
                      hintText: 'Nama Usaha / Perusahaan',
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
                          'Alamat Usaha / Perusahaan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: companyAddressController,
                      hintText: 'Alamat Usaha / Perusahaan',
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
                          'Jabatan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: companyDepartmentController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Non-Staf',
                          child: Text('Non-Staf'),
                        ),
                        DropdownMenuItem(
                          value: 'Staf',
                          child: Text('Staf'),
                        ),
                        DropdownMenuItem(
                          value: 'Supervisor',
                          child: Text('Supervisor'),
                        ),
                        DropdownMenuItem(
                          value: 'Manajer',
                          child: Text('Manajer'),
                        ),
                        DropdownMenuItem(
                          value: 'Direktur',
                          child: Text('Direktur'),
                        ),
                        DropdownMenuItem(
                          value: 'Lainnya',
                          child: Text('Lainnya'),
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
                          'Lama Bekerja',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: companyWorkDurationController,
                      items: const [
                        DropdownMenuItem(
                          value: '< 6 Bulan',
                          child: Text('< 6 Bulan'),
                        ),
                        DropdownMenuItem(
                          value: '6 Bulan - 1 Tahun',
                          child: Text('6 Bulan - 1 Tahun'),
                        ),
                        DropdownMenuItem(
                          value: '1 - 2 Tahun',
                          child: Text('1 - 2 Tahun'),
                        ),
                        DropdownMenuItem(
                          value: '> 2 Tahun',
                          child: Text('> 2 Tahun'),
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
                          'Sumber Pendapatan',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: incomeResourchController,
                      items: const [
                        DropdownMenuItem(
                          value: 'Gaji',
                          child: Text('Gaji'),
                        ),
                        DropdownMenuItem(
                          value: 'Keuntungan Bisnis',
                          child: Text('Keuntungan Bisnis'),
                        ),
                        DropdownMenuItem(
                          value: 'Bunga Tabungan',
                          child: Text('Bunga Tabungan'),
                        ),
                        DropdownMenuItem(
                          value: 'Warisan',
                          child: Text('Warisan'),
                        ),
                        DropdownMenuItem(
                          value: 'Dana dari orang tua atau anak',
                          child: Text('Dana dari orang tua atau anak'),
                        ),
                        DropdownMenuItem(
                          value: 'Undian',
                          child: Text('Undian'),
                        ),
                        DropdownMenuItem(
                          value: 'Keuntungan Investasi',
                          child: Text('Keuntungan Investasi'),
                        ),
                        DropdownMenuItem(
                          value: 'Lainnya',
                          child: Text('Lainnya'),
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
                          'Pendapatan Kotor Pertahun',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: annualIncomeController,
                      items: const [
                        DropdownMenuItem(
                          value: '< 10 Juta',
                          child: Text('< 10 Juta'),
                        ),
                        DropdownMenuItem(
                          value: '10 - 50 Juta',
                          child: Text('10 - 50 Juta'),
                        ),
                        DropdownMenuItem(
                          value: '50 - 100 Juta',
                          child: Text('50 - 100 Juta'),
                        ),
                        DropdownMenuItem(
                          value: '100 - 500 Juta',
                          child: Text('100 - 500 Juta'),
                        ),
                        DropdownMenuItem(
                          value: '500 Juta - 1 Milyar',
                          child: Text('500 Juta - 1 Milyar'),
                        ),
                        DropdownMenuItem(
                          value: '> 1 Milyar',
                          child: Text('> 1 Milyar'),
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
                          'Nama Bank',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IDropdown(
                      controller: bankNameController,
                      items: const [
                        DropdownMenuItem(
                          value: 'BCA',
                          child: Text('BCA'),
                        ),
                        DropdownMenuItem(
                          value: 'BRI',
                          child: Text('BRI'),
                        ),
                        DropdownMenuItem(
                          value: 'BNI',
                          child: Text('BNI'),
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
                          'Cabang Bank',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: bankBranchController,
                      hintText: 'Cabang Bank',
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
                          'Nomor Rekening',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: accountNumberController,
                      hintText: 'Nomor Rekening',
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
                          'Nama Pemilik Rekening',
                          style: TextStyle(
                            color: Colours.quinaryColour,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    IFields(
                      controller: accountNameController,
                      hintText: 'Nama Pemilik Rekening',
                    ),
                  ],
                ),
              ),
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
                        backgroundColor: nothingChanged
                            ? Colours.secondaryDisabledColour
                            : Colours.primaryColour,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5 / 2,
                        child: const Text(
                          'Simpan',
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
