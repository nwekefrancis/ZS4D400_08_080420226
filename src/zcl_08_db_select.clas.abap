CLASS zcl_08_db_select DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_db_select IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.
    DATA lx_invalid_value TYPE REF TO cx_abap_invalid_value.

*                    First instance
**********************************************************************
    TRY.
        connection = NEW lcl_connection(
          i_carrier_id    = 'LH'
          i_connection_id =  '0400'
        ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( `Invalid value`  ).
    ENDTRY.

*                    Second Instance
**********************************************************************
    TRY.
        connection = NEW #(
          i_carrier_id    = 'AA'
          i_connection_id = '0017' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value.
        out->write( lx_invalid_value->get_text( )  ).
    ENDTRY.

*                     Third Instance
**********************************************************************
    TRY.
        connection = NEW #(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001' ).
        APPEND connection TO connections.
      CATCH cx_abap_invalid_value INTO lx_invalid_value.
        out->write( lx_invalid_value->get_text( ) ).
      CATCH cx_root INTO DATA(lx_root).
        out->write( lx_root->get_text( ) ).
    ENDTRY.

    LOOP AT connections INTO connection.
      out->write( connection->get_output(  ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
