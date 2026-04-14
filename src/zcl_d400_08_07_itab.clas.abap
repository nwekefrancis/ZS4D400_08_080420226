CLASS zcl_d400_08_07_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_d400_08_07_itab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


    TYPES ty_demo_02 TYPE TABLE OF /dmo/carrier.
    DATA it_demo_02 TYPE ty_demo_02.
    SELECT * FROM /dmo/carrier INTO TABLE @it_demo_02.
    out->write(  EXPORTING data = it_demo_02 name = 'Carrier' ).
    out->write( '---------------------------------------------------' ).
*
*    TYPES flights TYPE TABLE OF /DMO/FLIGHT.
*    DATA flightsData TYPE flights.
*
*    SELECT * FROM /DMO/FLIGHT INTO TABLE @flightsData.
*    out->write(  EXPORTING data = flightsData name = 'Flights' ).
*    out->write( flightsData ). -> same as the line above


     return.
     DATA number TYPE i VALUE 1234588.
     DATA numbers TYPE TABLE OF i.

     APPEND 100 TO numbers.
     APPEND 200 TO numbers.
     APPEND 300 TO numbers.
     APPEND 400 TO numbers.

     OUT->write( numbers ).

  ENDMETHOD.
ENDCLASS.
