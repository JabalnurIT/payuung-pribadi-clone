import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payung_pribadi_clone/core/extensions/context_extensions.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/app/providers/user_provider.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/utils/core_utils.dart';
import '../../domain/entities/address.dart';
import '../../domain/entities/company.dart';
import '../../domain/entities/financial.dart';
import '../../domain/entities/user.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/button_progress_bar.dart';
import '../widgets/company_info_form.dart';
import '../widgets/personal_address_form.dart';
import '../widgets/personal_bio_form.dart';

class PersonalScreen extends StatefulWidget {
  const PersonalScreen({super.key});

  static const routeName = '/personal';

  @override
  State<PersonalScreen> createState() => PersonalScreenState();
}

class PersonalScreenState extends State<PersonalScreen> {
  late LocalUser _user;
  TextEditingController nameController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController maritalStatusController = TextEditingController();
  GlobalKey<FormState> personalBioFormKey = GlobalKey<FormState>();

  TextEditingController registrationImageController = TextEditingController();
  TextEditingController registrationIdController = TextEditingController();
  TextEditingController registrationAddressController = TextEditingController();
  TextEditingController registrationProvinceController =
      TextEditingController();
  TextEditingController registrationRegencyController = TextEditingController();
  TextEditingController registrationDistrictController =
      TextEditingController();
  TextEditingController registrationVillageController = TextEditingController();
  TextEditingController registrationPostalCodeController =
      TextEditingController();
  TextEditingController domicileAddressController = TextEditingController();
  TextEditingController domicileProvinceController = TextEditingController();
  TextEditingController domicileRegencyController = TextEditingController();
  TextEditingController domicileDistrictController = TextEditingController();
  TextEditingController domicileVillageController = TextEditingController();
  TextEditingController domicilePostalCodeController = TextEditingController();
  GlobalKey<FormState> personalAddressFormKey = GlobalKey<FormState>();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyDepartmentController = TextEditingController();
  TextEditingController companyWorkDurationController = TextEditingController();
  TextEditingController incomeResourchController = TextEditingController();
  TextEditingController annualIncomeController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankBranchController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController accountNameController = TextEditingController();
  GlobalKey<FormState> companyInfoFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initController(context.userProvider.user!);
    initListener;
  }

  void initController(LocalUser user) {
    _user = user;
    nameController.text = user.name;
    birthDateController.text = user.birthDate;
    genderController.text = user.gender;
    emailController.text = user.email;
    phoneNumberController.text = user.phoneNumber;
    educationController.text = user.education ?? '';
    maritalStatusController.text = user.maritalStatus ?? '';
    registrationImageController.text = user.registrationImage ?? '';
    registrationIdController.text = user.registrationId ?? '';
    registrationAddressController.text = user.registrationAddress?.street ?? '';
    registrationProvinceController.text =
        user.registrationAddress?.province ?? '';
    registrationRegencyController.text =
        user.registrationAddress?.regency ?? '';
    registrationDistrictController.text =
        user.registrationAddress?.district ?? '';
    registrationVillageController.text =
        user.registrationAddress?.village ?? '';
    registrationPostalCodeController.text =
        user.registrationAddress?.postalCode ?? '';
    domicileAddressController.text = user.domicileAddress?.street ?? '';
    domicileProvinceController.text = user.domicileAddress?.province ?? '';
    domicileRegencyController.text = user.domicileAddress?.regency ?? '';
    domicileDistrictController.text = user.domicileAddress?.district ?? '';
    domicileVillageController.text = user.domicileAddress?.village ?? '';
    domicilePostalCodeController.text = user.domicileAddress?.postalCode ?? '';
    companyNameController.text = user.companyInformation?.name ?? '';
    companyAddressController.text = user.companyInformation?.address ?? '';
    companyDepartmentController.text =
        user.companyInformation?.department ?? '';
    companyWorkDurationController.text =
        user.companyInformation?.workDuration ?? '';
    incomeResourchController.text =
        user.financialInformation?.incomeResourch ?? '';
    annualIncomeController.text =
        user.financialInformation?.annualIncome?.toString() ?? '';
    bankNameController.text = user.financialInformation?.bankName ?? '';
    bankBranchController.text = user.financialInformation?.bankBranch ?? '';
    accountNumberController.text =
        user.financialInformation?.accountNumber ?? '';
    accountNameController.text = user.financialInformation?.accountName ?? '';
    setState(() {});
  }

  void get initListener {
    nameController.addListener(() => setState(() {}));
    birthDateController.addListener(() => setState(() {}));
    genderController.addListener(() => setState(() {}));
    emailController.addListener(() => setState(() {}));
    phoneNumberController.addListener(() => setState(() {}));
    educationController.addListener(() => setState(() {}));
    maritalStatusController.addListener(() => setState(() {}));
    registrationImageController.addListener(() => setState(() {}));
    registrationIdController.addListener(() => setState(() {}));
    registrationAddressController.addListener(() => setState(() {}));
    registrationProvinceController.addListener(() => setState(() {}));
    registrationRegencyController.addListener(() => setState(() {}));
    registrationDistrictController.addListener(() => setState(() {}));
    registrationVillageController.addListener(() => setState(() {}));
    registrationPostalCodeController.addListener(() => setState(() {}));
    domicileAddressController.addListener(() => setState(() {}));
    domicileProvinceController.addListener(() => setState(() {}));
    domicileRegencyController.addListener(() => setState(() {}));
    domicileDistrictController.addListener(() => setState(() {}));
    domicileVillageController.addListener(() => setState(() {}));
    domicilePostalCodeController.addListener(() => setState(() {}));
    companyNameController.addListener(() => setState(() {}));
    companyAddressController.addListener(() => setState(() {}));
    companyDepartmentController.addListener(() => setState(() {}));
    companyWorkDurationController.addListener(() => setState(() {}));
    incomeResourchController.addListener(() => setState(() {}));
    annualIncomeController.addListener(() => setState(() {}));
    bankNameController.addListener(() => setState(() {}));
    bankBranchController.addListener(() => setState(() {}));
    accountNumberController.addListener(() => setState(() {}));
    accountNameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    birthDateController.dispose();
    genderController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    educationController.dispose();
    maritalStatusController.dispose();
    registrationImageController.dispose();
    registrationIdController.dispose();
    registrationAddressController.dispose();
    registrationProvinceController.dispose();
    registrationRegencyController.dispose();
    registrationDistrictController.dispose();
    registrationVillageController.dispose();
    registrationPostalCodeController.dispose();
    domicileAddressController.dispose();
    domicileProvinceController.dispose();
    domicileRegencyController.dispose();
    domicileDistrictController.dispose();
    domicileVillageController.dispose();
    domicilePostalCodeController.dispose();
    companyNameController.dispose();
    companyAddressController.dispose();
    companyDepartmentController.dispose();
    companyWorkDurationController.dispose();
    incomeResourchController.dispose();
    annualIncomeController.dispose();
    bankNameController.dispose();
    bankBranchController.dispose();
    accountNumberController.dispose();
    accountNameController.dispose();
    super.dispose();
  }

  bool get nameChanged => _user.name != nameController.text.trim();

  bool get birthDateChanged =>
      _user.birthDate != birthDateController.text.trim();

  bool get genderChanged => _user.gender != genderController.text.trim();

  bool get emailChanged => _user.email != emailController.text.trim();

  bool get phoneNumberChanged =>
      _user.phoneNumber != phoneNumberController.text.trim();

  bool get educationChanged =>
      _user.education != educationController.text.trim();

  bool get maritalStatusChanged =>
      _user.maritalStatus != maritalStatusController.text.trim();

  bool get registrationImageChanged =>
      _user.registrationImage != registrationImageController.text.trim();

  bool get registrationIdChanged =>
      _user.registrationId != registrationIdController.text.trim();

  bool get registrationAddressChanged =>
      _user.registrationAddress?.street !=
      registrationAddressController.text.trim();

  bool get registrationProvinceChanged =>
      _user.registrationAddress?.province !=
      registrationProvinceController.text.trim();

  bool get registrationRegencyChanged =>
      _user.registrationAddress?.regency !=
      registrationRegencyController.text.trim();

  bool get registrationDistrictChanged =>
      _user.registrationAddress?.district !=
      registrationDistrictController.text.trim();

  bool get registrationVillageChanged =>
      _user.registrationAddress?.village !=
      registrationVillageController.text.trim();

  bool get registrationPostalCodeChanged =>
      _user.registrationAddress?.postalCode !=
      registrationPostalCodeController.text.trim();

  bool get domicileAddressChanged =>
      _user.domicileAddress?.street != domicileAddressController.text.trim();

  bool get domicileProvinceChanged =>
      _user.domicileAddress?.province != domicileProvinceController.text.trim();

  bool get domicileRegencyChanged =>
      _user.domicileAddress?.regency != domicileRegencyController.text.trim();

  bool get domicileDistrictChanged =>
      _user.domicileAddress?.district != domicileDistrictController.text.trim();

  bool get domicileVillageChanged =>
      _user.domicileAddress?.village != domicileVillageController.text.trim();

  bool get domicilePostalCodeChanged =>
      _user.domicileAddress?.postalCode !=
      domicilePostalCodeController.text.trim();

  bool get companyNameChanged =>
      _user.companyInformation?.name != companyNameController.text.trim();

  bool get companyAddressChanged =>
      _user.companyInformation?.address != companyAddressController.text.trim();

  bool get companyDepartmentChanged =>
      _user.companyInformation?.department !=
      companyDepartmentController.text.trim();

  bool get companyWorkDurationChanged =>
      _user.companyInformation?.workDuration !=
      companyWorkDurationController.text.trim();

  bool get incomeResourchChanged =>
      _user.financialInformation?.incomeResourch !=
      incomeResourchController.text.trim();

  bool get annualIncomeChanged =>
      _user.financialInformation?.annualIncome !=
      annualIncomeController.text.trim();

  bool get bankNameChanged =>
      _user.financialInformation?.bankName != bankNameController.text.trim();

  bool get bankBranchChanged =>
      _user.financialInformation?.bankBranch !=
      bankBranchController.text.trim();

  bool get accountNumberChanged =>
      _user.financialInformation?.accountNumber !=
      accountNumberController.text.trim();

  bool get accountNameChanged =>
      _user.financialInformation?.accountName !=
      accountNameController.text.trim();

  bool get nothingChanged =>
      !nameChanged &&
      !birthDateChanged &&
      !genderChanged &&
      !emailChanged &&
      !phoneNumberChanged &&
      !educationChanged &&
      !maritalStatusChanged &&
      !registrationImageChanged &&
      !registrationIdChanged &&
      !registrationAddressChanged &&
      !registrationProvinceChanged &&
      !registrationRegencyChanged &&
      !registrationDistrictChanged &&
      !registrationVillageChanged &&
      !registrationPostalCodeChanged &&
      !domicileAddressChanged &&
      !domicileProvinceChanged &&
      !domicileRegencyChanged &&
      !domicileDistrictChanged &&
      !domicileVillageChanged &&
      !domicilePostalCodeChanged &&
      !companyNameChanged &&
      !companyAddressChanged &&
      !companyDepartmentChanged &&
      !companyWorkDurationChanged &&
      !incomeResourchChanged &&
      !annualIncomeChanged &&
      !bankNameChanged &&
      !bankBranchChanged &&
      !accountNumberChanged &&
      !accountNameChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Informasi Pribadi',
          style: TextStyle(
            color: Colours.quaternaryColour,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colours.quaternaryColour,
          ),
          onPressed: () {
            context.userProvider.changeIndex(0);
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      resizeToAvoidBottomInset: true,
      backgroundColor: Colours.secondaryColour,
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (_, state) {
          if (state is ProfileError) {
            CoreUtils.showSnackBar(context, state.message, Colours.errorColour);
          } else if (state is ProfileUpdated) {
            context.userProvider.initUser(state.user);
            initController(state.user);
            if (context.userProvider.currentIndex + 1 < 3) {
              context.userProvider
                  .changeIndex(context.userProvider.currentIndex + 1);
            } else {
              context.userProvider.changeIndex(0);
              Navigator.of(context).pop();
            }
            CoreUtils.showSnackBar(
              context,
              'Informasi pribadi berhasil diperbarui',
              Colours.successColour,
            );
            setState(() {});
          } else if (state is RegistrationImageUpdated) {
            context.userProvider.initUser(state.user);
            initController(state.user);

            CoreUtils.showSnackBar(
              context,
              'Informasi pribadi berhasil diperbarui',
              Colours.successColour,
            );
            setState(() {});
          }
        },
        builder: (context, state) {
          return Consumer<UserProvider>(
            builder: (_, userProvider, __) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ButtonProgressBar(
                        currentIndex: userProvider.currentIndex,
                        activeColor: Colours.primaryColour,
                        inactiveColor: Colours.primaryColour.withOpacity(0.5),
                        size: 60,
                        labels: const [
                          'Biodata Diri',
                          'Alamat Pribadi',
                          'Informasi Perusahaan',
                        ],
                        items: const [
                          Text(
                            '1',
                            style: TextStyle(
                              color: Colours.secondaryColour,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '2',
                            style: TextStyle(
                              color: Colours.secondaryColour,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '3',
                            style: TextStyle(
                              color: Colours.secondaryColour,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        onTap: [
                          () {
                            userProvider.changeIndex(0);
                          },
                          () {
                            userProvider.changeIndex(1);
                          },
                          () {
                            userProvider.changeIndex(2);
                          },
                        ],
                      ),
                      if (state is ProfileLoading)
                        const LinearProgressIndicator(
                          color: Colours.primaryColour,
                          backgroundColor: Colours.secondaryColour,
                        ),
                      if (userProvider.currentIndex == 0 &&
                          state is! ProfileLoading)
                        PersonalBioForm(
                          nameController: nameController,
                          birthDateController: birthDateController,
                          genderController: genderController,
                          emailController: emailController,
                          phoneNumberController: phoneNumberController,
                          educationController: educationController,
                          maritalStatusController: maritalStatusController,
                          personalBioFormKey: personalBioFormKey,
                          buttonOnTap: () {
                            if (personalBioFormKey.currentState!.validate()) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: LocalUser(
                                        id: userProvider.user!.id,
                                        name: nameController.text,
                                        birthDate: birthDateController.text,
                                        gender: genderController.text,
                                        email: emailController.text,
                                        phoneNumber: phoneNumberController.text,
                                        education: educationController.text,
                                        maritalStatus:
                                            maritalStatusController.text,
                                        registrationImage: userProvider
                                            .user!.registrationImage,
                                        registrationId:
                                            userProvider.user!.registrationId,
                                        registrationAddress: userProvider
                                            .user!.registrationAddress,
                                        domicileAddress:
                                            userProvider.user!.domicileAddress,
                                        companyInformation: userProvider
                                            .user!.companyInformation,
                                        financialInformation: userProvider
                                            .user!.financialInformation,
                                        wishlist: userProvider.user!.wishlist,
                                        cart: userProvider.user!.cart,
                                      ),
                                    ),
                                  );
                            }
                          },
                          nothingChanged: nothingChanged,
                        ),
                      if (userProvider.currentIndex == 1 &&
                          state is! ProfileLoading)
                        PersonalAddressForm(
                          registrationImageController:
                              registrationImageController,
                          registrationIdController: registrationIdController,
                          registrationAddressController:
                              registrationAddressController,
                          registrationProvinceController:
                              registrationProvinceController,
                          registrationRegencyController:
                              registrationRegencyController,
                          registrationDistrictController:
                              registrationDistrictController,
                          registrationVillageController:
                              registrationVillageController,
                          registrationPostalCodeController:
                              registrationPostalCodeController,
                          domicileAddressController: domicileAddressController,
                          domicileProvinceController:
                              domicileProvinceController,
                          domicileRegencyController: domicileRegencyController,
                          domicileDistrictController:
                              domicileDistrictController,
                          domicileVillageController: domicileVillageController,
                          domicilePostalCodeController:
                              domicilePostalCodeController,
                          personalAddressFormKey: personalAddressFormKey,
                          takePicture: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  title: const Text('Pilih Sumber Gambar'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        title: const Text('Kamera'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          context.read<ProfileBloc>().add(
                                                const AddRegistrationImageEvent(
                                                  imageSource:
                                                      ImageSource.camera,
                                                ),
                                              );
                                        },
                                      ),
                                      ListTile(
                                        title: const Text('Galeri'),
                                        onTap: () {
                                          Navigator.of(context).pop();
                                          context.read<ProfileBloc>().add(
                                                const AddRegistrationImageEvent(
                                                  imageSource:
                                                      ImageSource.gallery,
                                                ),
                                              );
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          nextOnTap: () {
                            if (personalAddressFormKey.currentState!
                                .validate()) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: LocalUser(
                                        id: userProvider.user!.id,
                                        name: userProvider.user!.name,
                                        birthDate: userProvider.user!.birthDate,
                                        gender: userProvider.user!.gender,
                                        email: userProvider.user!.email,
                                        phoneNumber:
                                            userProvider.user!.phoneNumber,
                                        education: userProvider.user!.education,
                                        maritalStatus:
                                            userProvider.user!.maritalStatus,
                                        registrationImage:
                                            registrationImageController.text,
                                        registrationId:
                                            registrationIdController.text,
                                        registrationAddress: Address(
                                          id: userProvider
                                              .user!.registrationAddress!.id,
                                          street: registrationAddressController
                                              .text,
                                          province:
                                              registrationProvinceController
                                                  .text,
                                          regency: registrationRegencyController
                                              .text,
                                          district:
                                              registrationDistrictController
                                                  .text,
                                          village: registrationVillageController
                                              .text,
                                          postalCode:
                                              registrationPostalCodeController
                                                  .text,
                                        ),
                                        domicileAddress: Address(
                                          id: userProvider
                                              .user!.domicileAddress!.id,
                                          street:
                                              domicileAddressController.text,
                                          province:
                                              domicileProvinceController.text,
                                          regency:
                                              domicileRegencyController.text,
                                          district:
                                              domicileDistrictController.text,
                                          village:
                                              domicileVillageController.text,
                                          postalCode:
                                              domicilePostalCodeController.text,
                                        ),
                                        companyInformation: userProvider
                                            .user!.companyInformation,
                                        financialInformation: userProvider
                                            .user!.financialInformation,
                                        wishlist: userProvider.user!.wishlist,
                                        cart: userProvider.user!.cart,
                                      ),
                                    ),
                                  );
                            }
                          },
                          previousOnTap: () {
                            setState(() {
                              userProvider.changeIndex(0);
                            });
                          },
                          nothingChanged: nothingChanged,
                          sameAddress: userProvider.sameAddress,
                          changeSameAddress: (value) {
                            userProvider.changeSameAddress(value);
                            if (value!) {
                              domicileAddressController.text =
                                  registrationAddressController.text;
                              domicileProvinceController.text =
                                  registrationProvinceController.text;
                              domicileRegencyController.text =
                                  registrationRegencyController.text;
                              domicileDistrictController.text =
                                  registrationDistrictController.text;
                              domicileVillageController.text =
                                  registrationVillageController.text;
                              domicilePostalCodeController.text =
                                  registrationPostalCodeController.text;
                            } else {
                              domicileAddressController.text =
                                  _user.domicileAddress?.street ?? '';
                              domicileProvinceController.text =
                                  _user.domicileAddress?.province ?? '';
                              domicileRegencyController.text =
                                  _user.domicileAddress?.regency ?? '';
                              domicileDistrictController.text =
                                  _user.domicileAddress?.district ?? '';
                              domicileVillageController.text =
                                  _user.domicileAddress?.village ?? '';
                              domicilePostalCodeController.text =
                                  _user.domicileAddress?.postalCode ?? '';
                            }
                          },
                        ),
                      if (userProvider.currentIndex == 2 &&
                          state is! ProfileLoading)
                        CompanyInfoForm(
                          companyNameController: companyNameController,
                          companyAddressController: companyAddressController,
                          companyDepartmentController:
                              companyDepartmentController,
                          companyWorkDurationController:
                              companyWorkDurationController,
                          incomeResourchController: incomeResourchController,
                          annualIncomeController: annualIncomeController,
                          bankNameController: bankNameController,
                          bankBranchController: bankBranchController,
                          accountNumberController: accountNumberController,
                          accountNameController: accountNameController,
                          companyInfoFormKey: companyInfoFormKey,
                          nextOnTap: () {
                            if (companyInfoFormKey.currentState!.validate()) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: LocalUser(
                                        id: userProvider.user!.id,
                                        name: userProvider.user!.name,
                                        birthDate: userProvider.user!.birthDate,
                                        gender: genderController.text,
                                        email: userProvider.user!.email,
                                        phoneNumber:
                                            userProvider.user!.phoneNumber,
                                        education: userProvider.user!.education,
                                        maritalStatus:
                                            userProvider.user!.maritalStatus,
                                        registrationImage: userProvider
                                            .user!.registrationImage,
                                        registrationId:
                                            userProvider.user!.registrationId,
                                        registrationAddress: userProvider
                                            .user!.registrationAddress,
                                        domicileAddress:
                                            userProvider.user!.domicileAddress,
                                        companyInformation: Company(
                                          id: userProvider
                                              .user!.companyInformation!.id,
                                          name: companyNameController.text,
                                          address:
                                              companyAddressController.text,
                                          department:
                                              companyDepartmentController.text,
                                          workDuration:
                                              companyWorkDurationController
                                                  .text,
                                        ),
                                        financialInformation: Financial(
                                          id: userProvider
                                              .user!.financialInformation!.id,
                                          incomeResourch:
                                              incomeResourchController.text,
                                          annualIncome:
                                              annualIncomeController.text,
                                          bankName: bankNameController.text,
                                          bankBranch: bankBranchController.text,
                                          accountNumber:
                                              accountNumberController.text,
                                          accountName:
                                              accountNameController.text,
                                        ),
                                        wishlist: userProvider.user!.wishlist,
                                        cart: userProvider.user!.cart,
                                      ),
                                    ),
                                  );
                            }
                          },
                          previousOnTap: () {
                            setState(() {
                              userProvider.changeIndex(0);
                            });
                          },
                          nothingChanged: nothingChanged,
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
