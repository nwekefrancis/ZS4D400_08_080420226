//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'View for Value Help for PostCode'
//@Metadata.ignorePropagatedAnnotations: true
//define view entity ZVH_POSTCODE08
//  as select from zcs08_postcode
//{
//  key postcode as Postcode,
//      country  as Country,
//      city     as City
//      
//      
//}

@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help for Postcode'
@ObjectModel.dataCategory: #VALUE_HELP
@Metadata.ignorePropagatedAnnotations: true
define view entity ZVH_POSTCODE08
  as select from zcs08_postcode
{
  key postcode as Postcode,
      country  as Country,
      city     as City
}
