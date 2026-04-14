CLASS zcl_08_compute_privat DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_compute_privat IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data number1 tyPE i.
    data number2 type i.
    data result type i.
    data result1 type string.

    number1 = -10.
    number2 = 3.

    result = number1 / number2.
    out->write( result ).

    result1 = |The result of -10/3 = { result }|.
    out->write( result1 ).

  ENDMETHOD.
ENDCLASS.
