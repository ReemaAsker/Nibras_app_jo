import 'package:nibras_group_jor/core/interfaces/droppable.dart';
import 'package:nibras_group_jor/features/company/company_info/data/models/CompanyRgistrationStatus.dart';

import '../../features/company/company_info/data/models/CompanyType.dart';
import '../../features/company/company_info/data/models/company_country_national.dart';
import '../../features/company/company_info/data/models/company_title.dart';

extension FindWhereDroppableId on List<Droppable?>{
  Droppable? findWhereDroppable(int? id){
    if (id!=null) {
      for (var element in this) {
        if (element?.getId() == id.toString()) {
          return element;
        }
      }
    }
  }
}
extension FindWhereDroppableValue on List<Droppable?>{
  Droppable? findWhereDroppableValue(String? value){
    for (var element in this) {
      if (element?.getDropValue() == value) {
        return element;
      }
    }
  }
}
extension FindWhereCompanyTitle on List<CompanyTitle?>{
  CompanyTitle? findWhereCompanyTitle(int? id){
    for (var element in this) {
      if (element?.id == id) {
        return element;
      }
    }
  }
}
extension FindWhereCompanyType on List<CompanyRgistrationStatus?>{
  CompanyRgistrationStatus? findWhereCompanyType(int? id){
    for (var element in this) {
      if (element?.id == id) {
        return element;
      }
    }
  }
}
extension FindWhereCompanyCountryNational on List<CompanyCountryNational?>{
  CompanyCountryNational? findWhereCompanyCountry(int? id){
    for (var element in this) {
      if (element?.id == id) {
        return element;
      }
    }
  }
}
extension FindWhereCompanyCat on List<CompanyType?>{
  CompanyType? findWhereCompanyCategory(int? id){
    for (var element in this) {
      if (element?.id == id) {
        return element;
      }
    }
  }
}