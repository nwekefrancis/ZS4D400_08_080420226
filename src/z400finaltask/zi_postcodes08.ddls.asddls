@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Postcodes Value Help'

define view entity ZI_POSTCODES08
  as select from zcs08_postcodes as Postcodes
{
  key country as Country,
  key postcode as Postcode,
      city as City
}
