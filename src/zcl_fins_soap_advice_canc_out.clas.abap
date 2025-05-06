CLASS zcl_fins_soap_advice_canc_out DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_fins_soap_advice_canc_out .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_fins_soap_advice_canc_out IMPLEMENTATION.
  METHOD if_fins_soap_advice_canc_out~map.
*    advicecancellation_out = advicecancellation.
*    advicepartner_out = advicepartner.
  ENDMETHOD.

ENDCLASS.
