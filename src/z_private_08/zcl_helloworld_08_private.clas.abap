CLASS zcl_helloworld_08_private DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_helloworld_08_private IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.



**********************************************************************
****************Internal Table****************************************

    DATA number TYPE i.
    DATA numbers TYPE TABLE OF i.
    DATA output TYPE i.

    APPEND 1234 TO numbers.
    APPEND 12345 TO numbers.
    APPEND 123456 TO numbers.
    APPEND 1234567 TO numbers.
    APPEND 12345678 TO numbers.
    APPEND 123456789 TO numbers.

    LOOP AT numbers INTO number.
      out->write( |The values of { number } are now trasfered into number { number }| ).
    ENDLOOP.

*    out->write( number ).
*    out->write( numbers ).
*    CLEAR numbers.
*    out->write( 'after clearing the internal table, the next is empty....' ).
*    out->write( numbers ).


*    out->write( 'Hello World' ).
*
*    DATA name TYPE c LENGTH 10.
*    DATA text TYPE string.
*    name = 'Francis'.
*    text = |Hello { name }|.
*
*    out->write( 'second output: ' &&  text ).
*
*    CONCATENATE 'Hi '
*                name
*           INTO text.
*    out->write( 'Third output: ' &&  text ).
*
*    text = 'Hello'.
*    text = name.
*    text = replace( val   = 'hello World'
*                    sub   = 'hello'
*                    with  = name ).
*    text = COND #( WHEN text = ' ' THEN 'Hello' && name
*                   ELSE text ).
*    out->write( 'Fourth output: ' &&  text ).


  ENDMETHOD.

ENDCLASS.
