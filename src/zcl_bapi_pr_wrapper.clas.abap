class zcl_bapi_pr_wrapper definition
  public
  final
  create public .

  public section.

    interfaces zif_wrap_bapi_pr_create.

  protected section.
  private section.

    "! <p>This method calls function modukle BAPI_PR_CREATE with given parameters.</p>
    "! <p>Note: Only this private method shall be used in wrapper to call BAPI_PR_CREATE.</p>
    "!
    "! @parameter prheader | Purchase Req. - Header
    "! @parameter prheaderx | Purchase Requisition - Header
    "! @parameter testrun | Test Indicator
    "! @parameter number | Purchase Requisition Number
    "! @parameter prheaderexp | Purchase Req. - Header
    "! @parameter return | Return Parameters
    "! @parameter pritem | Purchase Req. - Item Data
    "! @parameter pritemx | Purchase Requisition - Item Data
    "! @parameter pritemexp | Purchase Req. - Item Data
    "! @parameter pritemsource | Purchase Req. - Source of Supply
    "! @parameter praccount | Purchase Req. - Acct Assignment
    "! @parameter praccountproitsegment | Reservation Event Object: BAPI_PROFITABILITY_SEGMENT
    "! @parameter praccountx | Purchase Req. - Account Assignment
    "! @parameter praddrdelivery | PO Item: Address Structure BAPIADDR1 for Inbound Delivery
    "! @parameter pritemtext | Purchase Req. - Item Text
    "! @parameter prheadertext | Purchase Req. - Header Text
    "! @parameter extensionin | Reference Structure for BAPI Parameters EXTENSIONIN/EXTENSIONOUT
    "! @parameter extensionout | Reference Structure for BAPI Parameters EXTENSIONIN/EXTENSIONOUT
    "! @parameter prversion | Version Data for Purchase Requisition Item (BAPI)
    "! @parameter prversionx | Version Data for Purchase Requisition Item (BAPI)
    "! @parameter allversions | Version Management - All Version Data
    "! @parameter prcomponents | BAPI Structure for Components
    "! @parameter prcomponentsx | Update Information for Components in BUS2012 API
    "! @parameter serialnumber | Serial Numbers in Purchase Requisition BAPI
    "! @parameter serialnumberx | Change Parameter: Serial Numbers in Purch. Requisition BAPI
    methods call_bapi_pr_create
      importing
        value(prheader)        type bapimereqheader optional
        value(prheaderx)       type bapimereqheaderx optional
        value(testrun)         type bapiflag-bapiflag optional
      exporting
        value(number)          type bapimereqheader-preq_no
        value(prheaderexp)     type bapimereqheader
      changing
        return                 type bapirettab optional
        pritem                 type ty_bapimereqitemimp
        pritemx                type ty_bapimereqitemx optional
        pritemexp              type ty_bapimereqitem optional
        pritemsource           type ty_bapimereqsource optional
        praccount              type ty_bapimereqaccount optional
        praccountproitsegment  type ty_bapimereqaccountprofitseg optional
        praccountx             type ty_bapimereqaccountx optional
        praddrdelivery         type ty_bapimerqaddrdelivery optional
        pritemtext             type ty_bapimereqitemtext optional
        prheadertext           type ty_bapimereqheadtext optional
        extensionin            type bapiparextab optional
        extensionout           type bapiparextab optional
        prversion              type ty_bapimereqdcm optional
        prversionx             type ty_bapimereqdcmx optional
        allversions            type bbpt_if_bapimedcm_allversions optional
        prcomponents           type ty_bapimereqcomponent optional
        prcomponentsx          type ty_bapimereqcomponentx optional
        serviceoutline         type bapi_srv_outline_tty optional
        serviceoutlinex        type bapi_srv_outlinex_tty optional
        servicelines           type bapi_srv_service_line_tty optional
        servicelinesx          type bapi_srv_service_linex_tty optional
        servicelimit           type bapi_srv_limit_data_tty optional
        servicelimitx          type bapi_srv_limit_datax_tty optional
        servicecontractlimits  type bapi_srv_contract_limits_tty optional
        servicecontractlimitsx type bapi_srv_contract_limitsx_tty optional
        serviceaccount         type bapi_srv_acc_data_tty optional
        serviceaccountx        type bapi_srv_acc_datax_tty optional
        servicelongtexts       type bapi_srv_longtexts_tty optional
        serialnumber           type bapimereq_t_serialno optional
        serialnumberx          type bapimereq_t_serialnox optional.

    "! <p class="shorttext synchronized" lang="en">This method prepares headerx control structure</p>
    "!
    "! @parameter pr_header | Purchase Req. - Header
    "! @parameter prheaderx | Purchase Requisition - Header
    methods prepare_headerx importing pr_header        type zif_wrap_bapi_pr_create=>pr_header
                            returning value(prheaderx) type bapimereqheaderx.

    "! <p class="shorttext synchronized" lang="en">This method prepares itemx control structure</p>
    "!
    "! @parameter pr_items | Purchase Req. - Item
    "! @parameter pritemx | Purchase Requisition - Item Data
    methods prepare_itemx importing pr_items       type zif_wrap_bapi_pr_create=>pr_items
                          returning value(pritemx) type ty_bapimereqitemx.
ENDCLASS.



CLASS ZCL_BAPI_PR_WRAPPER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_BAPI_PR_WRAPPER->CALL_BAPI_PR_CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] PRHEADER                       TYPE        BAPIMEREQHEADER(optional)
* | [--->] PRHEADERX                      TYPE        BAPIMEREQHEADERX(optional)
* | [--->] TESTRUN                        TYPE        BAPIFLAG-BAPIFLAG(optional)
* | [<---] NUMBER                         TYPE        BAPIMEREQHEADER-PREQ_NO
* | [<---] PRHEADEREXP                    TYPE        BAPIMEREQHEADER
* | [<-->] RETURN                         TYPE        BAPIRETTAB(optional)
* | [<-->] PRITEM                         TYPE        TY_BAPIMEREQITEMIMP
* | [<-->] PRITEMX                        TYPE        TY_BAPIMEREQITEMX(optional)
* | [<-->] PRITEMEXP                      TYPE        TY_BAPIMEREQITEM(optional)
* | [<-->] PRITEMSOURCE                   TYPE        TY_BAPIMEREQSOURCE(optional)
* | [<-->] PRACCOUNT                      TYPE        TY_BAPIMEREQACCOUNT(optional)
* | [<-->] PRACCOUNTPROITSEGMENT          TYPE        TY_BAPIMEREQACCOUNTPROFITSEG(optional)
* | [<-->] PRACCOUNTX                     TYPE        TY_BAPIMEREQACCOUNTX(optional)
* | [<-->] PRADDRDELIVERY                 TYPE        TY_BAPIMERQADDRDELIVERY(optional)
* | [<-->] PRITEMTEXT                     TYPE        TY_BAPIMEREQITEMTEXT(optional)
* | [<-->] PRHEADERTEXT                   TYPE        TY_BAPIMEREQHEADTEXT(optional)
* | [<-->] EXTENSIONIN                    TYPE        BAPIPAREXTAB(optional)
* | [<-->] EXTENSIONOUT                   TYPE        BAPIPAREXTAB(optional)
* | [<-->] PRVERSION                      TYPE        TY_BAPIMEREQDCM(optional)
* | [<-->] PRVERSIONX                     TYPE        TY_BAPIMEREQDCMX(optional)
* | [<-->] ALLVERSIONS                    TYPE        BBPT_IF_BAPIMEDCM_ALLVERSIONS(optional)
* | [<-->] PRCOMPONENTS                   TYPE        TY_BAPIMEREQCOMPONENT(optional)
* | [<-->] PRCOMPONENTSX                  TYPE        TY_BAPIMEREQCOMPONENTX(optional)
* | [<-->] SERVICEOUTLINE                 TYPE        BAPI_SRV_OUTLINE_TTY(optional)
* | [<-->] SERVICEOUTLINEX                TYPE        BAPI_SRV_OUTLINEX_TTY(optional)
* | [<-->] SERVICELINES                   TYPE        BAPI_SRV_SERVICE_LINE_TTY(optional)
* | [<-->] SERVICELINESX                  TYPE        BAPI_SRV_SERVICE_LINEX_TTY(optional)
* | [<-->] SERVICELIMIT                   TYPE        BAPI_SRV_LIMIT_DATA_TTY(optional)
* | [<-->] SERVICELIMITX                  TYPE        BAPI_SRV_LIMIT_DATAX_TTY(optional)
* | [<-->] SERVICECONTRACTLIMITS          TYPE        BAPI_SRV_CONTRACT_LIMITS_TTY(optional)
* | [<-->] SERVICECONTRACTLIMITSX         TYPE        BAPI_SRV_CONTRACT_LIMITSX_TTY(optional)
* | [<-->] SERVICEACCOUNT                 TYPE        BAPI_SRV_ACC_DATA_TTY(optional)
* | [<-->] SERVICEACCOUNTX                TYPE        BAPI_SRV_ACC_DATAX_TTY(optional)
* | [<-->] SERVICELONGTEXTS               TYPE        BAPI_SRV_LONGTEXTS_TTY(optional)
* | [<-->] SERIALNUMBER                   TYPE        BAPIMEREQ_T_SERIALNO(optional)
* | [<-->] SERIALNUMBERX                  TYPE        BAPIMEREQ_T_SERIALNOX(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method call_bapi_pr_create.

    call function 'BAPI_PR_CREATE'
      exporting
        prheader               = prheader
        prheaderx              = prheaderx
        testrun                = testrun
      importing
        number                 = number
        prheaderexp            = prheaderexp
      tables
        return                 = return
        pritem                 = pritem
        pritemx                = pritemx
        pritemexp              = pritemexp
        pritemsource           = pritemsource
        praccount              = praccount
        praccountproitsegment  = praccountproitsegment
        praccountx             = praccountx
        praddrdelivery         = praddrdelivery
        pritemtext             = pritemtext
        prheadertext           = prheadertext
        extensionin            = extensionin
        extensionout           = extensionout
        prversion              = prversion
        prversionx             = prversionx
        allversions            = allversions
        prcomponents           = prcomponents
        prcomponentsx          = prcomponentsx
        serviceoutline         = serviceoutline
        serviceoutlinex        = serviceoutlinex
        servicelines           = servicelines
        servicelinesx          = servicelinesx
        servicelimit           = servicelimit
        servicelimitx          = servicelimitx
        servicecontractlimits  = servicecontractlimits
        servicecontractlimitsx = servicecontractlimitsx
        serviceaccount         = serviceaccount
        serviceaccountx        = serviceaccountx
        servicelongtexts       = servicelongtexts
        serialnumber           = serialnumber
        serialnumberx          = serialnumberx.

  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_BAPI_PR_WRAPPER->PREPARE_HEADERX
* +-------------------------------------------------------------------------------------------------+
* | [--->] PR_HEADER                      TYPE        ZIF_WRAP_BAPI_PR_CREATE=>PR_HEADER
* | [<-()] PRHEADERX                      TYPE        BAPIMEREQHEADERX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method prepare_headerx.

    field-symbols <fieldx> type any.

    data(pr_header_struct) = cast cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( pr_header ) ).

    loop at pr_header_struct->components into data(component).
      assign component component-name of structure prheaderx to <fieldx>.
      <fieldx> = abap_true.
    endloop.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Private Method ZCL_BAPI_PR_WRAPPER->PREPARE_ITEMX
* +-------------------------------------------------------------------------------------------------+
* | [--->] PR_ITEMS                       TYPE        ZIF_WRAP_BAPI_PR_CREATE=>PR_ITEMS
* | [<-()] PRITEMX                        TYPE        TY_BAPIMEREQITEMX
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method prepare_itemx.

    field-symbols <fieldx> type any.
    data(pr_item_struct) = cast cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( value zif_wrap_bapi_pr_create=>pr_item(  ) ) ).

    loop at pr_items into data(pr_item).
      data(pritemx_line) = value bapimereqitemx( preq_item = pr_item-preq_item ).

      loop at pr_item_struct->components into data(component).
        assign component component-name of structure pritemx_line to <fieldx>.

        case component-name.
          when 'PREQ_ITEM'.
          when others.
            <fieldx> = abap_true.
        endcase.
      endloop.

      append pritemx_line to pritemx.
    endloop.
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_BAPI_PR_WRAPPER->ZIF_WRAP_BAPI_PR_CREATE~CHECK
* +-------------------------------------------------------------------------------------------------+
* | [--->] PR_HEADER                      TYPE        PR_HEADER
* | [--->] PR_ITEMS                       TYPE        PR_ITEMS
* | [<-()] RESULT                         TYPE        PR_RETURNS
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method zif_wrap_bapi_pr_create~check.

    data(prheader) = corresponding bapimereqheader( pr_header ).
    data(pritem) = corresponding ty_bapimereqitemimp( pr_items ).

    data(prheaderx) = me->prepare_headerx( pr_header ).
    data(pritemx) = me->prepare_itemx( pr_items ).

    me->call_bapi_pr_create(
      exporting
        prheader               = prheader
        prheaderx              = prheaderx
        testrun                = abap_true
      changing
        return                 = result
        pritem                 = pritem
        pritemx                = pritemx
    ).
  endmethod.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_BAPI_PR_WRAPPER->ZIF_WRAP_BAPI_PR_CREATE~CREATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] PR_HEADER                      TYPE        PR_HEADER
* | [--->] PR_ITEMS                       TYPE        PR_ITEMS
* | [<---] PR_RETURNS                     TYPE        PR_RETURNS
* | [<-()] RESULT                         TYPE        PR_NUMBER
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method zif_wrap_bapi_pr_create~create.

    data(prheader) = corresponding bapimereqheader( pr_header ).
    data(pritem) = corresponding ty_bapimereqitemimp( pr_items ).

    data(prheaderx) = me->prepare_headerx( pr_header ).
    data(pritemx) = me->prepare_itemx( pr_items ).

    me->call_bapi_pr_create(
      exporting
        prheader               = prheader
        prheaderx              = prheaderx
        testrun                = abap_false
      importing
        number                 = result
      changing
        return                 = pr_returns
        pritem                 = pritem
        pritemx                = pritemx
    ).
  endmethod.
ENDCLASS.
