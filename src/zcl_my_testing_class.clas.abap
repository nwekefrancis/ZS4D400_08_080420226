CLASS zcl_my_testing_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_my_testing_class IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA my_var1 TYPE i.
*    DATA my_var2 TYPE STRING.
*    DATA my_var3 TYPE STRING VALUE 'Hello World'.
*
*    out->write( my_var3 ).

     DATA LV_demo_01 TYPE string.
     LV_demo_01 = 'Hello ' && ' world'.

     DATA number TYPE i VALUE 123456.

     DATA numbers TYPE TABLE OF i.

     APPEND 100 TO numbers.
     APPEND 200 TO numbers.
     APPEND 300 TO numbers.
     APPEND 400 TO numbers.

     number = numbers[ 3 ].

     out->write( number ).
     out->write( '-----' ).
     out->write( numbers ).
     out->write( lv_demo_01 ).

  ENDMETHOD.
ENDCLASS.
