class zcl_bapi_wrapper_tier1 definition
  public
  final
  create public .

  public section.
    interfaces if_oo_adt_classrun.
  protected section.
  private section.
ENDCLASS.



CLASS ZCL_BAPI_WRAPPER_TIER1 IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_BAPI_WRAPPER_TIER1->IF_OO_ADT_CLASSRUN~MAIN
* +-------------------------------------------------------------------------------------------------+
* | [--->] OUT                            TYPE REF TO IF_OO_ADT_CLASSRUN_OUT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method if_oo_adt_classrun~main.

    data pr_returns type bapirettab.

*    data(purchase_requisition) = zcl_bapi_wrap_factory=>create_instance( )->create(
    data(purchase_requisition) = zcl_bapi_wrap_factory2=>create_instance( )->create(
              exporting
                pr_header    = value zif_wrap_bapi_pr_create=>pr_header( pr_type = 'NB' )
                pr_items     = value zif_wrap_bapi_pr_create=>pr_items( (
                  preq_item  = '00010'
                  plant      = '1010'
                  acctasscat = 'U'
                  currency   = 'EUR'
                  deliv_date = cl_abap_context_info=>get_system_date(  ) + 15
                  material   = 'TG10'
                  matl_group = 'A001'
                  preq_price = '100.00'
                  quantity   = '1'
                  unit       = 'ST'
                  pur_group  = '001'
                  purch_org  = '1010'
                  short_text = 'TG10'
                ) )

              importing
                pr_returns      = pr_returns
            ).

    out->write( pr_returns ).

  endmethod.
ENDCLASS.
