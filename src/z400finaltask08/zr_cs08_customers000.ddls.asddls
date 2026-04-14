@AccessControl.authorizationCheck: #MANDATORY
@Metadata.allowExtensions: true
@ObjectModel.sapObjectNodeType.name: 'ZCS08_CUSTOMERS000'
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZR_CS08_CUSTOMERS000
  as select from zcs08_customers as Customers
{
  key customerid            as Customerid,
      salutation            as Salutation,
      last_name             as LastName,
      first_name            as FirstName,
      street                as Street,
      city                  as City,
      @Consumption.valueHelpDefinition: [ {
      entity: {
        name: 'ZVH_COUNTRY08',
        element: 'Country'
      },
      useForValidation: true
      } ]
      country               as Country,
      @Consumption.valueHelpDefinition: [ {
      entity: {
        name: 'ZVH_POSTCODE08',
        element: 'Postcode'
      },
      useForValidation: true
      } ]
      postcode              as Postcode,
      @Semantics.user.createdBy: true
      created_by            as CreatedBy,
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt
}
