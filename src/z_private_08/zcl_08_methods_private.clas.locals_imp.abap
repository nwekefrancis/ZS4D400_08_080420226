*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.

    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    CLASS-DATA conn_counter TYPE i.

* Add a method set_attributes with one importing
* parameter for each instance atttributes of the class
    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

* Adding a method get_output, with one returning
* parameter r_output of global table STRING_TABLE
    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

* Implementing get_out method, appending strint template to returning parameter
  METHOD get_output.
    APPEND |-------------------------------| TO r_output.
    APPEND |carrier:         { carrier_id }| TO r_output.
    APPEND |Connection:   { connection_id }| TO r_output.

  ENDMETHOD.

*Implementing set_attributes
  METHOD set_attributes.
    IF carrier_id IS INITIAL OR connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
    carrier_id      =  i_carrier_id.
    connection_id   = i_connection_id.
  ENDMETHOD.

ENDCLASS.
