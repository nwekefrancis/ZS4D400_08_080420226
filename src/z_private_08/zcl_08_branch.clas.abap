CLASS zcl_08_branch DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_branch IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* Declarations
**************************

    DATA number1 TYPE i.
    DATA number2 TYPE c.

    DATA result TYPE p LENGTH 8 DECIMALS 2.

    DATA op TYPE c LENGTH 1.
    DATA output TYPE string.

* Input Values
**************************

    number1 = 123.
    number2 = 0.

    op = '+'.

    CASE op.
      WHEN '+'.
        result = number1 + number2.
      WHEN '-'.
        result = number1 - number2.
      WHEN '*'.
        result = number1 * number2.
      WHEN '/'.
        TRY.
            result = number1 / number2.
          CATCH cx_sy_zerodivide.
            output = |The division of { number1 } { op } { number2 } is a division by zero: undefined |.
            out->write( output ).
            RETURN.
        ENDTRY.
      WHEN OTHERS.
        output = |Operator { op } is not supported|.
        out->write( output ).
        RETURN.
    ENDCASE.

* Calculation
**************************

*    DATA(result) = number1 / number2.

*    result = number1 / number2.


    IF output IS INITIAL.
      output = |{ number1 } { op } { number2 } = { result }|.
    ENDIF.


* Output
**************************

    out->write( output ).

  ENDMETHOD.
ENDCLASS.
