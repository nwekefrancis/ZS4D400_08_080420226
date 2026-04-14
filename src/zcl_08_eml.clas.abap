CLASS zcl_08_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_eml IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/C_AgencyTP.
    agencies_upd = VALUE #( ( AgencyID = '070020' Name = 'Demo cage groupd 08' ) ).

    MODIFY ENTITIES OF /DMO/C_AgencyTP ENTITY /DMO/Agency
        UPDATE FIELDS ( Name ) WITH agencies_upd.
    COMMIT ENTITIES.
    out->write( 'Agency 070020 updated' ).
  ENDMETHOD.
ENDCLASS.
