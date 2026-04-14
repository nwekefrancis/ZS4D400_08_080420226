CLASS zcl_08_compute DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_compute IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE i.

    number1 = 6.
    number2 = 2.

    result = number1 + number2.

    out->write( result ).

*    DATA number4 TYPE i.
*    DATA number5 TYPE i.
*    DATA result2 TYPE i.
*
*    number4 = 6.
*    number5 = 2.
*
*    result2 = number4 / number5.
*
*    out->write( result2 ).


    DATA(number4) = -8.
    DATA(number5) = 3.
*    DATA result2 TYPE P DECIMALS 4.

    DATA(result2)  = number4 / number5.
*    result2 = number4 / number5.
    Data(output) = |{ number4 } / { number5 } = { result2 }|.

    out->write( result2 ).

  ENDMETHOD.
ENDCLASS.
