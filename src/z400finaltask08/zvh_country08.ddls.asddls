//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'View for Value Help for Country'
//@Metadata.ignorePropagatedAnnotations: true
//define view entity ZVH_COUNTRY08 as select from t005
//{
//  key land1 as Country,
//      landx as CountryName
//}
//where spras = $session.system_language

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Value Help for Country'
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVH_COUNTRY08
  as select from I_CountryText
{
  key Country,
      CountryName
}
