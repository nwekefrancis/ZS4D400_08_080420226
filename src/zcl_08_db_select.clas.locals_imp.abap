*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

*" Define the class lcl_connection
CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
  " Declare a class-level counter to keep track of connections
    CLASS-DATA conn_counter TYPE i.

    " Method to get the formatted output of the connection details
    METHODS get_output
      RETURNING
        VALUE(r_output) TYPE string_table.

    " Constructor method to initialize a connection object
    METHODS constructor
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

  PROTECTED SECTION.
  PRIVATE SECTION.
  " Data fields to store carrier and connection IDs
    DATA carrier_id    TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    " Data fields to store airport IDs for departure and destination
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.

ENDCLASS.


*" Implement the methods of the class lcl_connection
CLASS lcl_connection IMPLEMENTATION.

  " Implementation of the get_output method
  METHOD get_output.

    APPEND |-------------------------------------| TO r_output.
    APPEND |Carrier:         { carrier_id      } | TO r_output.
    APPEND |Connection:      { connection_id   } | TO r_output.

    APPEND |DEPARTURE        { airport_to_id   } | TO r_output.
    APPEND |DESTINATION      { airport_from_id } | TO r_output.

  ENDMETHOD.

  " Implementation of the constructor method
  METHOD constructor.

    IF i_carrier_id IS INITIAL OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    " Select the airport IDs from the database table based on input IDs
    SELECT SINGLE FROM /dmo/connection
      FIELDS airport_from_id, airport_to_id
      WHERE carrier_id    = @i_carrier_id
        AND connection_id = @i_connection_id
      INTO ( @airport_from_id, @airport_to_id ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    " Assign input IDs to the object's data fields
    carrier_id    = i_carrier_id.
    connection_id = i_connection_id.
    conn_counter += 1.
  ENDMETHOD.

ENDCLASS.
