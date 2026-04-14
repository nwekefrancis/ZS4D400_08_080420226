CLASS zcl_08_hello_world DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_08_hello_world IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    out->write(
      EXPORTING
        data   = 'Hello World' ).


        out->write(
      EXPORTING
        data   = 'Hello World'
        name   = 'Meaningful description' ).

        out->write( 'Hello me' ).

  ENDMETHOD.
ENDCLASS.
