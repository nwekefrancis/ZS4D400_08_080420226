CLASS zcl_insert_postcodes08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_insert_postcodes08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lt_postcodes TYPE TABLE OF zcs08_postcodes.

    APPEND VALUE #( client = sy-mandt country = 'DEU' postcode = '10115' city = 'Berlin' ) TO lt_postcodes.
    APPEND VALUE #( client = sy-mandt country = 'USA' postcode = '10001' city = 'New York' ) TO lt_postcodes.
    APPEND VALUE #( client = sy-mandt country = 'FRA' postcode = '75001' city = 'Paris' ) TO lt_postcodes.
    APPEND VALUE #( client = sy-mandt country = 'NIG' postcode = '21731' city = 'Onitsha' ) TO lt_postcodes.
    APPEND VALUE #( client = sy-mandt country = 'CAM' postcode = '78541' city = 'Kumba' ) TO lt_postcodes.
    APPEND VALUE #( client = sy-mandt country = 'NIG' postcode = '99547' city = 'Awka' ) TO lt_postcodes.


    DELETE FROM zcs08_postcodes.  " Optional: Clear existing data to avoid key conflicts

    INSERT zcs08_postcodes FROM TABLE @lt_postcodes.

    IF sy-subrc = 0.
      out->write( |Data inserted. Records: { lines( lt_postcodes ) }| ).  " Fixed with string template and upper case LINES
    ELSE.
      out->write( 'Failed - check for key duplicates or auth issues' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.
