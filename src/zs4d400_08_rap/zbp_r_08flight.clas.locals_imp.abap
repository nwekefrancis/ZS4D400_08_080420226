CLASS lhc_zr_08flight DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Flight
        RESULT result,
      validationPrice FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validationPrice,
      validationCurrencyCode FOR VALIDATE ON SAVE
        IMPORTING keys FOR Flight~validationCurrencyCode.
ENDCLASS.


CLASS lhc_zr_08flight IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validationPrice.
    DATA reported_record LIKE LINE OF reported-flight.
    DATA failed_record LIKE LINE OF failed-flight.

    READ ENTITIES OF zr_08flight IN LOCAL MODE
      ENTITY Flight
        FIELDS ( Price ) "Überwachung
        WITH CORRESPONDING #( keys )
            RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
      "Meldung ausgeben.*****************************************************
      IF flight-Price <= 0.
        reported_record-%tky = flight-%tky.

        reported_record-%msg = me->new_message(
                                id       =  '/LRN/S4D400'
                                number   =  '101'
                                severity =  if_abap_behv_message=>severity-error ).

        reported_record-%element-price = if_abap_behv=>mk-on.

        APPEND reported_record TO reported-flight.


*****************************************************************************
        "Änderung zurüchnehmen
        failed_record-%tky = flight-%tky.
        APPEND failed_record TO failed-flight.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validationCurrencyCode.

    DATA reported_record LIKE LINE OF reported-flight.
    DATA failed_record LIKE LINE OF failed-flight.
    DATA exists TYPE abap_boolean.

    READ ENTITIES OF zr_08flight IN LOCAL MODE
      ENTITY Flight
        FIELDS ( CurrencyCode )
        WITH CORRESPONDING #( keys )
            RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).

      SELECT SINGLE FROM I_Currency FIELDS @abap_true
           WHERE Currency = @flight-CurrencyCode INTO @exists.
      IF exists = abap_false.

        reported_record-%tky = flight-%tky.                                          "1 Abb 221 EN

        reported_record-%msg = me->new_message(
                                id       =  '/LRN/S4D400'
                                number   =  '102'
                                severity =  if_abap_behv_message=>severity-error
                                V1       = flight-CurrencyCode ).  "                   Abb 221 EN

        reported_record-%element-CurrencyCode = if_abap_behv=>mk-on.                 "2. Abb 221 EN

        APPEND reported_record TO reported-flight.
      ENDIF.

    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
