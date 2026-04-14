CLASS zpopulate_postcode08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zpopulate_postcode08 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES:
      BEGIN OF ty_sample,
        country  TYPE zcs08_postcode-country,
        city     TYPE zcs08_postcode-city,
        postcode TYPE zcs08_postcode-postcode,
      END OF ty_sample.

    DATA:
      lt_postcodes TYPE STANDARD TABLE OF zcs08_postcode WITH EMPTY KEY,
      ls_postcode  TYPE zcs08_postcode,
      lt_samples   TYPE STANDARD TABLE OF ty_sample WITH EMPTY KEY,
      ls_sample    TYPE ty_sample,
      lv_index     TYPE i,
      lv_lines     TYPE i.

    lt_samples = VALUE #(
      ( country = 'DE' city = 'Berlin'      postcode = '10115' )
      ( country = 'DE' city = 'Munich'      postcode = '80331' )
      ( country = 'FR' city = 'Paris'       postcode = '75001' )
      ( country = 'FR' city = 'Lyon'        postcode = '69001' )
      ( country = 'US' city = 'New York'    postcode = '10001' )
      ( country = 'US' city = 'Los Angeles' postcode = '90001' )
      ( country = 'GB' city = 'London'      postcode = 'EC1A'  )
      ( country = 'GB' city = 'Manchester'  postcode = 'M1'    )
      ( country = 'IT' city = 'Rome'        postcode = '00100' )
      ( country = 'IT' city = 'Milan'       postcode = '20100' )
    ).

    lv_lines = lines( lt_samples ).

    DO 100 TIMES.
      lv_index = ( sy-index - 1 ) MOD lv_lines + 1.

      READ TABLE lt_samples INTO ls_sample INDEX lv_index.
      IF sy-subrc <> 0.
        CONTINUE.
      ENDIF.

      CLEAR ls_postcode.
      ls_postcode-client  = sy-mandt.
      ls_postcode-country = ls_sample-country.
      ls_postcode-city    = ls_sample-city.
      ls_postcode-postcode = |{ ls_sample-postcode }{ sy-index WIDTH = 3 PAD = '0' }|.

      APPEND ls_postcode TO lt_postcodes.
    ENDDO.

    MODIFY zcs08_postcode FROM TABLE @lt_postcodes.

    out->write(
      COND string(
        WHEN sy-subrc = 0
        THEN |100 postcode entries inserted or updated successfully.|
        ELSE |Modify failed. SY-SUBRC = { sy-subrc }.|
      )
    ).

  ENDMETHOD.

ENDCLASS.


