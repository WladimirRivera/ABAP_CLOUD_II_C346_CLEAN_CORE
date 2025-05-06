class zcl_bapi_wrap_factory definition
  public
  final
  create private .

  public section.

    "! <p>This method creates an instance of the Purchase Requisition BAPI wrapper implementation.</p>
    "! @parameter result | Wrapper implementation instance
    class-methods create_instance
      returning value(result) type ref to zif_wrap_bapi_pr_create.

  protected section.
  private section.

    methods constructor.

ENDCLASS.



CLASS ZCL_BAPI_WRAP_FACTORY IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Static Public Method ZCL_BAPI_WRAP_FACTORY2=>CREATE_INSTANCE
* +-------------------------------------------------------------------------------------------------+
* | [<-()] RESULT                         TYPE REF TO ZIF_WRAP_BAPI_PR_CREATE
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method create_instance.
    result = new zcl_bapi_pr_wrapper(  ).
    "NEW UPDATED VERSION OF THE API
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_BAPI_WRAP_FACTORY2->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method constructor.
  endmethod.
ENDCLASS.
