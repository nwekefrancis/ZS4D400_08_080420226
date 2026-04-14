CLASS zcl_08_local_class_private DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_08_local_class_private IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.  " here 'connection' is a ref. variable
    lcl_connection=>conn_counter = 1234.         " '=>' is used here to address attribute of a static
    " variable 'conn_counter' outside the class lcl_connection
    DATA connection2 TYPE REF TO lcl_connection.
    DATA connection3 TYPE TABLE OF REF TO lcl_connection.

    "creating an instance of class lcl_connection
    connection = NEW #(  ).                     " This creates an instance of class lcl_connection using the 'new ( ).'
    connection->carrier_id    = 'LH'.              " Accessing an attribute LH of an object instance connection created by  the new ( ). statement
    connection->connection_id = '0400'.

    out->write( |New connection created: { connection->carrier_id } { connection->connection_id }| ).

    APPEND connection TO connection3.
    out->write( '1. Appending connection to connections3' ).
    out->write( connection3 ).

    connection2 = NEW #(  ).                    " This creates a new object instance of class lcl_connection using the 'new ( ).' statement
    connection2->carrier_id = 'AA'.             " Accessing an attribute a specific object instance connection2 created by  the new ( ). statement
    connection2->connection_id = '0017'.

    APPEND connection2 TO connection3.
    out->write( '2. Appending connection2 to connections3' ).
    out->write( connection3 ).

    connection = NEW #(  ).                    " This creates a new object instance of class lcl_connection using the 'new ( ).' statement
    connection->carrier_id = 'UA'.             " Accessing an attribute a specific object instance connection2 created by  the new ( ). statement
    connection->connection_id = '0064'.

    APPEND connection TO connection3.
    out->write( '3 Again, appending connection to connections3' ).
    out->write( connection3 ).

    connection = NEW #(  ).
    connection->carrier_id = 'BA'.
    connection->connection_id = '001'.

    out->write( '4. Appending another connection to connections3' ).
    APPEND connection TO connection3.
    out->write( connection3 ).

*    out->write( connection ).
*    out->write( connection2 ).
*    out->write( connection3 ).

  ENDMETHOD.

ENDCLASS.
