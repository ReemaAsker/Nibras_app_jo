import 'package:nibras_group_jor/features/company/company_info/data/company.dart';
import 'package:nibras_group_jor/features/company/company_info/data/web_services.dart';

class CompanyRepo {
  final WebServices webservices;

  CompanyRepo(this.webservices);
  Future<Company> getCompanyById(int id) async {
    var response = await webservices.grtCompanyById(id);
    return response;
  }

  Future<Company> createNewCompany(Company newCompany) async {
    var response;
    webservices.createCompany(response).then((value) {
      print("************************");
      response = value;
      print(value);
      print("************************");
    });

    return response;
  }
}
