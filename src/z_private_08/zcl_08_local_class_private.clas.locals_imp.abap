CLASS lcl_connection DEFINITION.

  PUBLIC SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA n_o_connections TYPE i.
    DATA e_carrier_id TYPE i.
    DATA e_connection_id TYPE i.
    CLASS-DATA conn_counter TYPE i.


    METHODS set_attributes
      IMPORTING
        i_carrier_id TYPE /dmo/carrier_id OPTIONAL
        i_connection TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

    METHODS get_attributes
      EXPORTING
        e_carrier_id TYPE /dmo/carrier_id
        e_connection TYPE /dmo/connection_id.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD set_attributes.
    IF carrier_id IS INITIAL OR connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id      =  i_carrier_id.
    connection_id   = i_connection.
    n_o_connections = n_o_connections + 1.
  ENDMETHOD.

  METHOD get_attributes.
    e_carrier_id        = carrier_id.
    e_connection_id     = connection_id.
  ENDMETHOD.

ENDCLASS.
