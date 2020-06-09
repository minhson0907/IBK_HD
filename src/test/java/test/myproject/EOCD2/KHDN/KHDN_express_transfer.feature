@HDbank @KHDN_express_transfer
  Feature: Express Transfer

    @KHDN_express_transfer-01
    Scenario: I do express transfer transaction successfully to card number
      Given I open IBK page
      Then I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhanh 24/7 tới tài khoản/thẻ"
      And I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "Chuyển đến Thẻ" transaction type, "9704060129837294" number, "" bank, "500000" amount and "AUTO REMARKS" description

    @KHDN_express_transfer-02
    Scenario: I do express transfer transaction successfully to account number
      Given I open IBK page
      Then I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhanh 24/7 tới tài khoản/thẻ"
      And I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "Chuyển đến Tài Khoản" transaction type, "0129837294" number, "DAB" bank, "500000" amount and "AUTO REMARKS" description

