**CLASS zpopulate_customers08 DEFINITION
**  PUBLIC
**  FINAL
**  CREATE PUBLIC .
**
**  PUBLIC SECTION.
**
**    INTERFACES if_oo_adt_classrun .
**  PROTECTED SECTION.
**  PRIVATE SECTION.
**ENDCLASS.
**
**
**
**CLASS zpopulate_customers08 IMPLEMENTATION.
**
**
**  METHOD if_oo_adt_classrun~main.
**  ENDMETHOD.
**ENDCLASS.
*
*
*CLASS zpopulate_customers08 DEFINITION
*  PUBLIC
*  FINAL
*  CREATE PUBLIC.
*
*  PUBLIC SECTION.
*    INTERFACES if_oo_adt_classrun.
*ENDCLASS.
*
*
*CLASS zpopulate_customers08 IMPLEMENTATION.
*
*  METHOD if_oo_adt_classrun~main.
*
*    TYPES:
*      BEGIN OF ty_person,
*        salutation TYPE zcs08_customers-salutation,
*        first_name TYPE zcs08_customers-first_name,
*        last_name  TYPE zcs08_customers-last_name,
*        street     TYPE zcs08_customers-street,
*        city       TYPE zcs08_customers-city,
*        country    TYPE zcs08_customers-country,
*        postcode   TYPE zcs08_customers-postcode,
*      END OF ty_person.
*
*    DATA:
*      lt_customers TYPE STANDARD TABLE OF zcs08_customers WITH EMPTY KEY,
*      ls_customer  TYPE zcs08_customers,
*      lt_persons   TYPE STANDARD TABLE OF ty_person WITH EMPTY KEY,
*      ls_person    TYPE ty_person,
*      lv_index     TYPE i,
*      lv_lines     TYPE i,
*      lv_timestamp TYPE timestampl.
*
*    GET TIME STAMP FIELD lv_timestamp.
*
*    lt_persons = VALUE #(
*      ( salutation = 'Mr' first_name = 'Liam'      last_name = 'Miller'    street = 'Alexanderplatz 1'   city = 'Berlin'     country = 'DE' postcode = '10115' )
*      ( salutation = 'Ms' first_name = 'Emma'      last_name = 'Schmidt'   street = 'Marienplatz 8'      city = 'Munich'     country = 'DE' postcode = '80331' )
*      ( salutation = 'Mr' first_name = 'Noah'      last_name = 'Dupont'    street = 'Rue de Rivoli 10'   city = 'Paris'      country = 'FR' postcode = '75001' )
*      ( salutation = 'Ms' first_name = 'Olivia'    last_name = 'Martin'    street = 'Rue Victor Hugo 5'  city = 'Lyon'       country = 'FR' postcode = '69001' )
*      ( salutation = 'Mr' first_name = 'James'     last_name = 'Smith'     street = '5th Avenue 12'      city = 'New York'   country = 'US' postcode = '10001' )
*      ( salutation = 'Ms' first_name = 'Sophia'    last_name = 'Johnson'   street = 'Sunset Blvd 20'     city = 'Los Angeles' country = 'US' postcode = '90001' )
*      ( salutation = 'Mr' first_name = 'Lucas'     last_name = 'Brown'     street = 'Baker Street 14'    city = 'London'     country = 'GB' postcode = 'EC1A' )
*      ( salutation = 'Ms' first_name = 'Mia'       last_name = 'Taylor'    street = 'King Street 7'      city = 'Manchester' country = 'GB' postcode = 'M1' )
*      ( salutation = 'Mr' first_name = 'Matteo'    last_name = 'Rossi'     street = 'Via Roma 25'        city = 'Rome'       country = 'IT' postcode = '00100' )
*      ( salutation = 'Ms' first_name = 'Giulia'    last_name = 'Bianchi'   street = 'Via Milano 18'      city = 'Milan'      country = 'IT' postcode = '20100' )
*      ( salutation = 'Mr' first_name = 'Carlos'    last_name = 'Garcia'    street = 'Gran Via 30'        city = 'Madrid'     country = 'ES' postcode = '28001' )
*      ( salutation = 'Ms' first_name = 'Sofia'     last_name = 'Lopez'     street = 'La Rambla 11'       city = 'Barcelona'  country = 'ES' postcode = '08001' )
*      ( salutation = 'Mr' first_name = 'Haruto'    last_name = 'Sato'      street = 'Chiyoda 1'          city = 'Tokyo'      country = 'JP' postcode = '1000001' )
*      ( salutation = 'Ms' first_name = 'Yui'       last_name = 'Tanaka'    street = 'Kita 3'             city = 'Osaka'      country = 'JP' postcode = '5300001' )
*      ( salutation = 'Mr' first_name = 'Gabriel'   last_name = 'Silva'     street = 'Paulista 100'       city = 'Sao Paulo'  country = 'BR' postcode = '01001000' )
*      ( salutation = 'Ms' first_name = 'Ananya'    last_name = 'Sharma'    street = 'MG Road 15'         city = 'Mumbai'     country = 'IN' postcode = '400001' )
*      ( salutation = 'Mr' first_name = 'Ethan'     last_name = 'Wilson'    street = 'George Street 44'   city = 'Sydney'     country = 'AU' postcode = '2000' )
*      ( salutation = 'Ms' first_name = 'Charlotte' last_name = 'Moore'     street = 'Queen Street 9'     city = 'Toronto'    country = 'CA' postcode = 'M5V' )
*      ( salutation = 'Mr' first_name = 'Ivan'      last_name = 'Petrov'    street = 'Tverskaya 21'       city = 'Moscow'     country = 'RU' postcode = '101000' )
*      ( salutation = 'Ms' first_name = 'Mei'       last_name = 'Wang'      street = 'Chang An Ave 6'     city = 'Beijing'    country = 'CN' postcode = '100000' )
*    ).
*
*    lv_lines = lines( lt_persons ).
*
*    DO 100 TIMES.
*      lv_index = ( sy-index - 1 ) MOD lv_lines + 1.
*
*      READ TABLE lt_persons INTO ls_person INDEX lv_index.
*      IF sy-subrc <> 0.
*        CONTINUE.
*      ENDIF.
*
*      CLEAR ls_customer.
*
*      ls_customer-client                = sy-mandt.
*      ls_customer-customerid            = |{ sy-index WIDTH = 6 PAD = '0' }|.
*      ls_customer-salutation            = ls_person-salutation.
*      ls_customer-first_name            = ls_person-first_name.
*      ls_customer-last_name             = ls_person-last_name.
*      ls_customer-street                = ls_person-street.
*      ls_customer-city                  = ls_person-city.
*      ls_customer-country               = ls_person-country.
*      ls_customer-postcode              = ls_person-postcode.
*      ls_customer-created_by            = sy-uname.
*      ls_customer-created_at            = lv_timestamp.
*      ls_customer-local_last_changed_by = sy-uname.
*      ls_customer-local_last_changed_at = lv_timestamp.
*      ls_customer-last_changed_at       = lv_timestamp.
*
*      APPEND ls_customer TO lt_customers.
*    ENDDO.
*
*    MODIFY zcs08_customers FROM TABLE @lt_customers.
*
*    out->write(
*      COND string(
*        WHEN sy-subrc = 0
*        THEN |100 customer entries inserted or updated successfully.|
*        ELSE |Modify failed. SY-SUBRC = { sy-subrc }.|
*      )
*    ).
*
*  ENDMETHOD.
*
*ENDCLASS.


CLASS zpopulate_customers08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zpopulate_customers08 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES:
      BEGIN OF ty_person,
        customerid TYPE zcs08_customers-customerid,
        salutation TYPE zcs08_customers-salutation,
        first_name TYPE zcs08_customers-first_name,
        last_name  TYPE zcs08_customers-last_name,
        street     TYPE zcs08_customers-street,
        city       TYPE zcs08_customers-city,
        country    TYPE zcs08_customers-country,
        postcode   TYPE zcs08_customers-postcode,
      END OF ty_person.

    DATA:
      lt_persons   TYPE STANDARD TABLE OF ty_person WITH EMPTY KEY,
      lt_customers TYPE STANDARD TABLE OF zcs08_customers WITH EMPTY KEY,
      ls_person    TYPE ty_person,
      ls_customer  TYPE zcs08_customers,
      lv_timestamp TYPE timestampl.

    GET TIME STAMP FIELD lv_timestamp.

    lt_persons = VALUE #(
      ( customerid = '000001' salutation = 'Mr' first_name = 'Liam'      last_name = 'Miller'    street = 'Alexanderplatz 1'      city = 'Berlin'      country = 'DE' postcode = '10115' )
      ( customerid = '000002' salutation = 'Ms' first_name = 'Emma'      last_name = 'Schmidt'   street = 'Marienplatz 8'         city = 'Munich'      country = 'DE' postcode = '80331' )
      ( customerid = '000003' salutation = 'Mr' first_name = 'Noah'      last_name = 'Dupont'    street = 'Rue de Rivoli 10'      city = 'Paris'       country = 'FR' postcode = '75001' )
      ( customerid = '000004' salutation = 'Ms' first_name = 'Olivia'    last_name = 'Martin'    street = 'Rue Victor Hugo 5'     city = 'Lyon'        country = 'FR' postcode = '69001' )
      ( customerid = '000005' salutation = 'Mr' first_name = 'James'     last_name = 'Smith'     street = '5th Avenue 12'         city = 'New York'    country = 'US' postcode = '10001' )
      ( customerid = '000006' salutation = 'Ms' first_name = 'Sophia'    last_name = 'Johnson'   street = 'Sunset Blvd 20'        city = 'Los Angeles' country = 'US' postcode = '90001' )
      ( customerid = '000007' salutation = 'Mr' first_name = 'Lucas'     last_name = 'Brown'     street = 'Baker Street 14'       city = 'London'      country = 'GB' postcode = 'EC1A' )
      ( customerid = '000008' salutation = 'Ms' first_name = 'Mia'       last_name = 'Taylor'    street = 'King Street 7'         city = 'Manchester'  country = 'GB' postcode = 'M1' )
      ( customerid = '000009' salutation = 'Mr' first_name = 'Matteo'    last_name = 'Rossi'     street = 'Via Roma 25'           city = 'Rome'        country = 'IT' postcode = '00100' )
      ( customerid = '000010' salutation = 'Ms' first_name = 'Giulia'    last_name = 'Bianchi'   street = 'Via Milano 18'         city = 'Milan'       country = 'IT' postcode = '20100' )

      ( customerid = '000011' salutation = 'Mr' first_name = 'Carlos'    last_name = 'Garcia'    street = 'Gran Via 30'           city = 'Madrid'      country = 'ES' postcode = '28001' )
      ( customerid = '000012' salutation = 'Ms' first_name = 'Sofia'     last_name = 'Lopez'     street = 'La Rambla 11'          city = 'Barcelona'   country = 'ES' postcode = '08001' )
      ( customerid = '000013' salutation = 'Mr' first_name = 'Haruto'    last_name = 'Sato'      street = 'Chiyoda 1'             city = 'Tokyo'       country = 'JP' postcode = '1000001' )
      ( customerid = '000014' salutation = 'Ms' first_name = 'Yui'       last_name = 'Tanaka'    street = 'Kita 3'                city = 'Osaka'       country = 'JP' postcode = '5300001' )
      ( customerid = '000015' salutation = 'Mr' first_name = 'Gabriel'   last_name = 'Silva'     street = 'Paulista 100'          city = 'Sao Paulo'   country = 'BR' postcode = '01001000' )
      ( customerid = '000016' salutation = 'Ms' first_name = 'Ananya'    last_name = 'Sharma'    street = 'MG Road 15'            city = 'Mumbai'      country = 'IN' postcode = '400001' )
      ( customerid = '000017' salutation = 'Mr' first_name = 'Ethan'     last_name = 'Wilson'    street = 'George Street 44'      city = 'Sydney'      country = 'AU' postcode = '2000' )
      ( customerid = '000018' salutation = 'Ms' first_name = 'Charlotte' last_name = 'Moore'     street = 'Queen Street 9'        city = 'Toronto'     country = 'CA' postcode = 'M5V' )
      ( customerid = '000019' salutation = 'Mr' first_name = 'Ivan'      last_name = 'Petrov'    street = 'Tverskaya 21'          city = 'Moscow'      country = 'RU' postcode = '101000' )
      ( customerid = '000020' salutation = 'Ms' first_name = 'Mei'       last_name = 'Wang'      street = 'Chang An Ave 6'        city = 'Beijing'     country = 'CN' postcode = '100000' )

      ( customerid = '000021' salutation = 'Mr' first_name = 'Daniel'    last_name = 'Fischer'   street = 'Hauptstrasse 2'        city = 'Berlin'      country = 'DE' postcode = '10115' )
      ( customerid = '000022' salutation = 'Ms' first_name = 'Hannah'    last_name = 'Weber'     street = 'Leopoldstrasse 19'     city = 'Munich'      country = 'DE' postcode = '80331' )
      ( customerid = '000023' salutation = 'Mr' first_name = 'Julien'    last_name = 'Moreau'    street = 'Boulevard Voltaire 9'  city = 'Paris'       country = 'FR' postcode = '75001' )
      ( customerid = '000024' salutation = 'Ms' first_name = 'Camille'   last_name = 'Laurent'   street = 'Rue Merciere 4'        city = 'Lyon'        country = 'FR' postcode = '69001' )
      ( customerid = '000025' salutation = 'Mr' first_name = 'Michael'   last_name = 'Davis'     street = 'Broadway 77'           city = 'New York'    country = 'US' postcode = '10001' )
      ( customerid = '000026' salutation = 'Ms' first_name = 'Ava'       last_name = 'Anderson'  street = 'Hollywood Blvd 33'     city = 'Los Angeles' country = 'US' postcode = '90001' )
      ( customerid = '000027' salutation = 'Mr' first_name = 'Oliver'    last_name = 'White'     street = 'Fleet Street 5'        city = 'London'      country = 'GB' postcode = 'EC1A' )
      ( customerid = '000028' salutation = 'Ms' first_name = 'Isla'      last_name = 'Hall'      street = 'Deansgate 16'          city = 'Manchester'  country = 'GB' postcode = 'M1' )
      ( customerid = '000029' salutation = 'Mr' first_name = 'Marco'     last_name = 'Romano'    street = 'Via Nazionale 40'      city = 'Rome'        country = 'IT' postcode = '00100' )
      ( customerid = '000030' salutation = 'Ms' first_name = 'Elena'     last_name = 'Ricci'     street = 'Corso Como 12'         city = 'Milan'       country = 'IT' postcode = '20100' )

      ( customerid = '000031' salutation = 'Mr' first_name = 'Diego'     last_name = 'Navarro'   street = 'Calle Mayor 14'        city = 'Madrid'      country = 'ES' postcode = '28001' )
      ( customerid = '000032' salutation = 'Ms' first_name = 'Lucia'     last_name = 'Ortega'    street = 'Passeig de Gracia 8'   city = 'Barcelona'   country = 'ES' postcode = '08001' )
      ( customerid = '000033' salutation = 'Mr' first_name = 'Ren'       last_name = 'Kobayashi' street = 'Ginza 2'               city = 'Tokyo'       country = 'JP' postcode = '1000001' )
      ( customerid = '000034' salutation = 'Ms' first_name = 'Aiko'      last_name = 'Nakamura'  street = 'Umeda 6'               city = 'Osaka'       country = 'JP' postcode = '5300001' )
      ( customerid = '000035' salutation = 'Mr' first_name = 'Rafael'    last_name = 'Costa'     street = 'Rua Augusta 25'        city = 'Sao Paulo'   country = 'BR' postcode = '01001000' )
      ( customerid = '000036' salutation = 'Ms' first_name = 'Priya'     last_name = 'Patel'     street = 'Linking Road 42'       city = 'Mumbai'      country = 'IN' postcode = '400001' )
      ( customerid = '000037' salutation = 'Mr' first_name = 'Jack'      last_name = 'Harris'    street = 'Pitt Street 7'         city = 'Sydney'      country = 'AU' postcode = '2000' )
      ( customerid = '000038' salutation = 'Ms' first_name = 'Amelia'    last_name = 'Clark'     street = 'Bloor Street 10'       city = 'Toronto'     country = 'CA' postcode = 'M5V' )
      ( customerid = '000039' salutation = 'Mr' first_name = 'Sergey'    last_name = 'Volkov'    street = 'Arbat 3'               city = 'Moscow'      country = 'RU' postcode = '101000' )
      ( customerid = '000040' salutation = 'Ms' first_name = 'Lin'       last_name = 'Zhao'      street = 'Wangfujing 18'         city = 'Beijing'     country = 'CN' postcode = '100000' )

      ( customerid = '000041' salutation = 'Mr' first_name = 'Felix'     last_name = 'Krause'    street = 'Potsdamer Platz 6'     city = 'Berlin'      country = 'DE' postcode = '10115' )
      ( customerid = '000042' salutation = 'Ms' first_name = 'Lea'       last_name = 'Hoffmann'  street = 'Sendlinger Str 11'     city = 'Munich'      country = 'DE' postcode = '80331' )
      ( customerid = '000043' salutation = 'Mr' first_name = 'Antoine'   last_name = 'Bernard'   street = 'Avenue Opera 21'       city = 'Paris'       country = 'FR' postcode = '75001' )
      ( customerid = '000044' salutation = 'Ms' first_name = 'Claire'    last_name = 'Faure'     street = 'Rue Republique 13'     city = 'Lyon'        country = 'FR' postcode = '69001' )
      ( customerid = '000045' salutation = 'Mr' first_name = 'Henry'     last_name = 'Walker'    street = 'Madison Ave 50'        city = 'New York'    country = 'US' postcode = '10001' )
      ( customerid = '000046' salutation = 'Ms' first_name = 'Ella'      last_name = 'Young'     street = 'Melrose Ave 29'        city = 'Los Angeles' country = 'US' postcode = '90001' )
      ( customerid = '000047' salutation = 'Mr' first_name = 'George'    last_name = 'Scott'     street = 'Oxford Street 9'       city = 'London'      country = 'GB' postcode = 'EC1A' )
      ( customerid = '000048' salutation = 'Ms' first_name = 'Grace'     last_name = 'Green'     street = 'Market Street 22'      city = 'Manchester'  country = 'GB' postcode = 'M1' )
      ( customerid = '000049' salutation = 'Mr' first_name = 'Alessio'   last_name = 'Greco'     street = 'Via Veneto 15'         city = 'Rome'        country = 'IT' postcode = '00100' )
      ( customerid = '000050' salutation = 'Ms' first_name = 'Sara'      last_name = 'Conti'     street = 'Porta Nuova 17'        city = 'Milan'       country = 'IT' postcode = '20100' )

      ( customerid = '000051' salutation = 'Mr' first_name = 'Javier'    last_name = 'Santos'    street = 'Alcala 45'             city = 'Madrid'      country = 'ES' postcode = '28001' )
      ( customerid = '000052' salutation = 'Ms' first_name = 'Marta'     last_name = 'Ruiz'      street = 'Diagonal 90'           city = 'Barcelona'   country = 'ES' postcode = '08001' )
      ( customerid = '000053' salutation = 'Mr' first_name = 'Takumi'    last_name = 'Ito'       street = 'Shibuya 8'             city = 'Tokyo'       country = 'JP' postcode = '1000001' )
      ( customerid = '000054' salutation = 'Ms' first_name = 'Hina'      last_name = 'Yamamoto'  street = 'Namba 12'              city = 'Osaka'       country = 'JP' postcode = '5300001' )
      ( customerid = '000055' salutation = 'Mr' first_name = 'Bruno'     last_name = 'Almeida'   street = 'Rua da Consolacao 60'  city = 'Sao Paulo'   country = 'BR' postcode = '01001000' )
      ( customerid = '000056' salutation = 'Ms' first_name = 'Kavya'     last_name = 'Reddy'     street = 'Carter Road 8'         city = 'Mumbai'      country = 'IN' postcode = '400001' )
      ( customerid = '000057' salutation = 'Mr' first_name = 'Leo'       last_name = 'King'      street = 'Harbour Street 4'      city = 'Sydney'      country = 'AU' postcode = '2000' )
      ( customerid = '000058' salutation = 'Ms' first_name = 'Chloe'     last_name = 'Adams'     street = 'King West 13'          city = 'Toronto'     country = 'CA' postcode = 'M5V' )
      ( customerid = '000059' salutation = 'Mr' first_name = 'Nikolai'   last_name = 'Sokolov'   street = 'Lenina 2'              city = 'Moscow'      country = 'RU' postcode = '101000' )
      ( customerid = '000060' salutation = 'Ms' first_name = 'Jing'      last_name = 'Chen'      street = 'Dongcheng 30'          city = 'Beijing'     country = 'CN' postcode = '100000' )

      ( customerid = '000061' salutation = 'Mr' first_name = 'Jonas'     last_name = 'Becker'    street = 'Friedrichstrasse 20'   city = 'Berlin'      country = 'DE' postcode = '10115' )
      ( customerid = '000062' salutation = 'Ms' first_name = 'Nina'      last_name = 'Lang'      street = 'Maximilianstrasse 5'   city = 'Munich'      country = 'DE' postcode = '80331' )
      ( customerid = '000063' salutation = 'Mr' first_name = 'Louis'     last_name = 'Robert'    street = 'Rue Lafayette 7'       city = 'Paris'       country = 'FR' postcode = '75001' )
      ( customerid = '000064' salutation = 'Ms' first_name = 'Julie'     last_name = 'Girard'    street = 'Cours Franklin 10'     city = 'Lyon'        country = 'FR' postcode = '69001' )
      ( customerid = '000065' salutation = 'Mr' first_name = 'Ryan'      last_name = 'Evans'     street = 'Lexington Ave 31'      city = 'New York'    country = 'US' postcode = '10001' )
      ( customerid = '000066' salutation = 'Ms' first_name = 'Zoe'       last_name = 'Baker'     street = 'Santa Monica Blvd 14'  city = 'Los Angeles' country = 'US' postcode = '90001' )
      ( customerid = '000067' salutation = 'Mr' first_name = 'Arthur'    last_name = 'Morris'    street = 'Regent Street 18'      city = 'London'      country = 'GB' postcode = 'EC1A' )
      ( customerid = '000068' salutation = 'Ms' first_name = 'Ruby'      last_name = 'Ward'      street = 'Castlefield 6'         city = 'Manchester'  country = 'GB' postcode = 'M1' )
      ( customerid = '000069' salutation = 'Mr' first_name = 'Davide'    last_name = 'Gallo'     street = 'Via del Corso 8'       city = 'Rome'        country = 'IT' postcode = '00100' )
      ( customerid = '000070' salutation = 'Ms' first_name = 'Martina'   last_name = 'Leone'     street = 'Navigli 3'             city = 'Milan'       country = 'IT' postcode = '20100' )

      ( customerid = '000071' salutation = 'Mr' first_name = 'Pablo'     last_name = 'Morales'   street = 'Serrano 20'            city = 'Madrid'      country = 'ES' postcode = '28001' )
      ( customerid = '000072' salutation = 'Ms' first_name = 'Elena'     last_name = 'Vega'      street = 'Arago 15'              city = 'Barcelona'   country = 'ES' postcode = '08001' )
      ( customerid = '000073' salutation = 'Mr' first_name = 'Kaito'     last_name = 'Suzuki'    street = 'Asakusa 4'             city = 'Tokyo'       country = 'JP' postcode = '1000001' )
      ( customerid = '000074' salutation = 'Ms' first_name = 'Rin'       last_name = 'Mori'      street = 'Tennoji 9'             city = 'Osaka'       country = 'JP' postcode = '5300001' )
      ( customerid = '000075' salutation = 'Mr' first_name = 'Caio'      last_name = 'Rocha'     street = 'Ibirapuera 27'         city = 'Sao Paulo'   country = 'BR' postcode = '01001000' )
      ( customerid = '000076' salutation = 'Ms' first_name = 'Isha'      last_name = 'Kapoor'    street = 'Marine Drive 12'       city = 'Mumbai'      country = 'IN' postcode = '400001' )
      ( customerid = '000077' salutation = 'Mr' first_name = 'Max'       last_name = 'Cooper'    street = 'York Street 19'        city = 'Sydney'      country = 'AU' postcode = '2000' )
      ( customerid = '000078' salutation = 'Ms' first_name = 'Lily'      last_name = 'Hill'      street = 'Front Street 25'       city = 'Toronto'     country = 'CA' postcode = 'M5V' )
      ( customerid = '000079' salutation = 'Mr' first_name = 'Oleg'      last_name = 'Smirnov'   street = 'Kutuzovsky 11'         city = 'Moscow'      country = 'RU' postcode = '101000' )
      ( customerid = '000080' salutation = 'Ms' first_name = 'Xiu'       last_name = 'Liu'       street = 'Chaoyang 40'           city = 'Beijing'     country = 'CN' postcode = '100000' )

      ( customerid = '000081' salutation = 'Mr' first_name = 'Timo'      last_name = 'Neumann'   street = 'Unter den Linden 3'    city = 'Berlin'      country = 'DE' postcode = '10115' )
      ( customerid = '000082' salutation = 'Ms' first_name = 'Paula'     last_name = 'Kruger'    street = 'Theresienstrasse 14'   city = 'Munich'      country = 'DE' postcode = '80331' )
      ( customerid = '000083' salutation = 'Mr' first_name = 'Adrien'    last_name = 'Roux'      street = 'Rue Monge 16'          city = 'Paris'       country = 'FR' postcode = '75001' )
      ( customerid = '000084' salutation = 'Ms' first_name = 'Lucie'     last_name = 'Picard'    street = 'Place Bellecour 2'     city = 'Lyon'        country = 'FR' postcode = '69001' )
      ( customerid = '000085' salutation = 'Mr' first_name = 'Adam'      last_name = 'Parker'    street = 'Wall Street 1'         city = 'New York'    country = 'US' postcode = '10001' )
      ( customerid = '000086' salutation = 'Ms' first_name = 'Aria'      last_name = 'Brooks'    street = 'Vine Street 21'        city = 'Los Angeles' country = 'US' postcode = '90001' )
      ( customerid = '000087' salutation = 'Mr' first_name = 'Thomas'    last_name = 'Price'     street = 'Piccadilly 6'          city = 'London'      country = 'GB' postcode = 'EC1A' )
      ( customerid = '000088' salutation = 'Ms' first_name = 'Molly'     last_name = 'Bell'      street = 'Canal Street 8'        city = 'Manchester'  country = 'GB' postcode = 'M1' )
      ( customerid = '000089' salutation = 'Mr' first_name = 'Stefano'   last_name = 'Ferrari'   street = 'Via Appia 9'           city = 'Rome'        country = 'IT' postcode = '00100' )
      ( customerid = '000090' salutation = 'Ms' first_name = 'Chiara'    last_name = 'Marino'    street = 'Brera 20'              city = 'Milan'       country = 'IT' postcode = '20100' )

      ( customerid = '000091' salutation = 'Mr' first_name = 'Alvaro'    last_name = 'Castro'    street = 'Castellana 18'         city = 'Madrid'      country = 'ES' postcode = '28001' )
      ( customerid = '000092' salutation = 'Ms' first_name = 'Noa'       last_name = 'Gil'       street = 'Balmes 4'              city = 'Barcelona'   country = 'ES' postcode = '08001' )
      ( customerid = '000093' salutation = 'Mr' first_name = 'Daichi'    last_name = 'Abe'       street = 'Akihabara 5'           city = 'Tokyo'       country = 'JP' postcode = '1000001' )
      ( customerid = '000094' salutation = 'Ms' first_name = 'Emi'       last_name = 'Kato'      street = 'Shinsekai 7'           city = 'Osaka'       country = 'JP' postcode = '5300001' )
      ( customerid = '000095' salutation = 'Mr' first_name = 'Joao'      last_name = 'Nunes'     street = 'Liberdade 33'          city = 'Sao Paulo'   country = 'BR' postcode = '01001000' )
      ( customerid = '000096' salutation = 'Ms' first_name = 'Diya'      last_name = 'Mehta'     street = 'Palm Beach Road 6'     city = 'Mumbai'      country = 'IN' postcode = '400001' )
      ( customerid = '000097' salutation = 'Mr' first_name = 'Oscar'     last_name = 'Reed'      street = 'Crown Street 24'       city = 'Sydney'      country = 'AU' postcode = '2000' )
      ( customerid = '000098' salutation = 'Ms' first_name = 'Eva'       last_name = 'Campbell'  street = 'Spadina 12'            city = 'Toronto'     country = 'CA' postcode = 'M5V' )
      ( customerid = '000099' salutation = 'Mr' first_name = 'Dmitri'    last_name = 'Orlov'     street = 'Prospekt Mira 9'       city = 'Moscow'      country = 'RU' postcode = '101000' )
      ( customerid = '000100' salutation = 'Ms' first_name = 'Lan'       last_name = 'Sun'       street = 'Haidian 22'            city = 'Beijing'     country = 'CN' postcode = '100000' )
    ).

    LOOP AT lt_persons INTO ls_person.
      CLEAR ls_customer.

      ls_customer-client                = sy-mandt.
      ls_customer-customerid            = ls_person-customerid.
      ls_customer-salutation            = ls_person-salutation.
      ls_customer-first_name            = ls_person-first_name.
      ls_customer-last_name             = ls_person-last_name.
      ls_customer-street                = ls_person-street.
      ls_customer-city                  = ls_person-city.
      ls_customer-country               = ls_person-country.
      ls_customer-postcode              = ls_person-postcode.
      ls_customer-created_by            = sy-uname.
      ls_customer-created_at            = lv_timestamp.
      ls_customer-local_last_changed_by = sy-uname.
      ls_customer-local_last_changed_at = lv_timestamp.
      ls_customer-last_changed_at       = lv_timestamp.

      APPEND ls_customer TO lt_customers.
    ENDLOOP.

    DELETE FROM zcs08_customers.

    INSERT zcs08_customers FROM TABLE @lt_customers.

    out->write(
      COND string(
        WHEN sy-subrc = 0
        THEN |100 unique customer entries recreated successfully.|
        ELSE |Insert failed. SY-SUBRC = { sy-subrc }.|
      )
    ).

  ENDMETHOD.

ENDCLASS.

