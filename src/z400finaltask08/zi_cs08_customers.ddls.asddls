@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View for Customers'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_CS08_CUSTOMERS as select from zcs08_customers
{
    key customerid            as Customerid,
    salutation                as Salutation,
    last_name                 as LastName,
    first_name                as FirstName,
    street                    as Street,
    city                      as City,
    country                   as Country,
    postcode                  as Postcode,
    created_by                as CreatedBy,
    created_at                as CreatedAt,
    local_last_changed_by     as LocalLastChangedBy,
    local_last_changed_at     as LocalLastChangedAt,
    last_changed_at           as LastChangedAt
}
