CLASS lhc_zr_cs08_customers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR customers
        RESULT result.

    METHODS setcityfrompostcode FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Customers~SetCityFromPostcode.

ENDCLASS.

CLASS lhc_zr_cs08_customers IMPLEMENTATION.
  METHOD get_global_authorizations.
  ENDMETHOD.
  METHOD setcityfrompostcode.
    READ ENTITIES OF zr_cs08_customers000 IN LOCAL MODE
    ENTITY Customers
      FIELDS ( postcode country )
      WITH CORRESPONDING #( keys )
    RESULT DATA(lt_customers).

    LOOP AT lt_customers ASSIGNING FIELD-SYMBOL(<ls_customer>).
      IF <ls_customer>-postcode IS NOT INITIAL AND <ls_customer>-country IS NOT INITIAL.
        SELECT SINGLE city FROM zcs08_postcode
          WHERE postcode = @<ls_customer>-postcode
            AND country = @<ls_customer>-country
          INTO @DATA(lv_city).
        IF sy-subrc = 0.
          MODIFY ENTITIES OF zr_cs08_customers000 IN LOCAL MODE
            ENTITY Customers
              UPDATE FIELDS ( city )
              WITH VALUE #( ( %tky = <ls_customer>-%tky
                              city = lv_city
                              %control-city = if_abap_behv=>mk-on ) ).
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
