CLASS zcl_abap_cloud_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_abap_cloud_test IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_ABAP_CLOUD_TEST->IF_OO_ADT_CLASSRUN~MAIN
* +-------------------------------------------------------------------------------------------------+
* | [--->] OUT                            TYPE REF TO IF_OO_ADT_CLASSRUN_OUT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_oo_adt_classrun~main.

*   data lv_product type mara-matnr.
*
*    select single from t005
*           fields *
*           into @data(ls_countries1).

    SELECT SINGLE FROM I_Country
           FIELDS *
           INTO @DATA(ls_countries).
*
    out->write( ls_countries ).

  ENDMETHOD.
ENDCLASS.
