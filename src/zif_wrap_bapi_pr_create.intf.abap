interface zif_wrap_bapi_pr_create
  public .

  "! Purchase Requisition Number
  types pr_number             type banfn.

  types:
    "! Purchase Req. - Header
    begin of pr_header,
      pr_type type bsart,
    end of pr_header,

    "! Purchase Req. - Item
    begin of pr_item,
      preq_item  type bnfpo,
      plant      type ewerk,
      acctasscat type knttp,
      currency   type waers,
      deliv_date type eindt,
      material   type matnr18,
      matl_group type matkl,
      preq_price type bapicurext,
      quantity   type bamng,
      unit       type bamei,
      pur_group  type ekgrp,
      purch_org  type ekorg,
      short_text type txz01,
    end of pr_item,

    "! Purchase Req. - Acct Assignment
    begin of pr_item_account,
      preq_item  type bnfpo,
      serial_no  type dzekkn,
      costcenter type kostl,
      gl_account type saknr,
    end of pr_item_account,

    "! Purchase Req. - Item Text
    begin of pr_item_text,
      preq_item type bnfpo,
      text_line type tdline,
      text_id   type tdid,
    end of pr_item_text,

    "! Purchase Req. - Header Text
    begin of pr_header_text,
      preq_item type bnfpo,
      text_line type tdline,
      text_id   type tdid,
    end of pr_header_text.

  types:
    "! Purchase Req. - Item
    pr_items   type standard table of pr_item with key preq_item,
    "! Table of BAPI return information
    pr_returns type bapirettab.

  "! <p>This method creates purchase requisitios for all the data that has been added, using BAPI_PR_CREATE.
  "! Purchase Requisition Number will be returned as result of successful purchase requisition creation.</p>
  "! <p>Purchase requisitions that have been validated with error return, will not be created.</p>
  "! <p>Purchase requisitions that have been validated without error return, will be created</p>
  "! <strong>Note</strong>: Using this method requires write authorization for authorization objects M_BANF_BSA, M_BANF_EKG, M_BANF_EKO, M_BANF_WRK
  "! @parameter pr_header | Purchase Req. - Header
  "! @parameter pr_items | Purchase Req. - Item
  "! @parameter result | Purchase Requisition Number
  methods create
    importing pr_header     type pr_header
              pr_items      type pr_items
    exporting pr_returns    type pr_returns
    returning value(result) type pr_number.


  "! <p>This method checks purchase requisitions data for validity, using BAPI_PR_CREATE test mode.
  "! Entries in purchase requisitions that have already been created, will not be checked again.
  "! BAPI return information will be provided as result in case of successful or faulty purchase requisition validation.</p>
  "! <strong>Note</strong>: Using this method requires write authorization for authorization objects M_BANF_BSA, M_BANF_EKG, M_BANF_EKO, M_BANF_WRK
  "! @parameter pr_header | Purchase Req. - Header
  "! @parameter pr_items | Purchase Req. - Item
  "! @parameter result | Table of BAPI return information
  methods check
    importing pr_header     type pr_header
              pr_items      type pr_items
    returning value(result) type pr_returns.
endinterface.
