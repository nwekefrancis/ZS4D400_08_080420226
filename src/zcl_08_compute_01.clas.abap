CLASS zcl_08_compute_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_compute_01 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA number1 TYPE i.
    DATA number2 TYPE i.
    DATA result TYPE i.
    DATA output TYPE STRING.


    DATA op TYPE c LENGTH 1.

    number1 = 8.
    number2 = 0.

     op = '/'.

     case op.
      when '+'.
        result = number1 + number2.
      when '-'.
        result = number1 - number2.
      when '*'.
        result = number1 * number2.
      when '/'.
        try.
            result = number1 / number2.
          catch cx_sy_zerodivide.
            output =  |'Division durch Null ist nicht möglish' |.
        endtry.

      when others.
        output = |'{ op }' ist kein gültiger operator |.
    endcase.
    IF OUTPUT IS INITIAL.
        output = |{ number1 } / { number2 } = { result }|.
    endif.

   out->write( output ).


  ENDMETHOD.
ENDCLASS.
