@HDbank @KHDN_express_transfer
  Feature: Express Transfer

    @KHDN_express_transfer-01
    Scenario: I do express transfer transaction successfully to card number
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhanh qua thẻ/tài khoản"
      And As KHDN, I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "Chuyển đến Thẻ" transaction type, "9704060129837294" number, "" bank, "500000" amount and "AUTO REMARKS" description
      And I verify "Số thẻ thụ hưởng" "9704060129837294" is displayed after doing transaction successfully
      And I verify "Tên tài khoản thụ hưởng" "NGUYEN VAN NAPAS TEST ONLINE IBFT 247 VN" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "500,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO REMARKS" is displayed after doing transaction successfully
      And I verify "Phí" "Phí người chuyển trả" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "0 VND" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số thẻ thụ hưởng" "9704060129837294" is displayed after doing transaction successfully
      And I verify "Tên tài khoản thụ hưởng" "NGUYEN VAN NAPAS TEST ONLINE IBFT 247 VN" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "500,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO REMARKS" is displayed after doing transaction successfully
      And I verify "Phí" "Phí người chuyển trả" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "0 VND" is displayed after doing transaction successfully
      Then I get "Số tiền phí" fee from above transaction
      And I get "Số tiền thanh toán" debit amount from above transaction
      Then I approve the above transaction
      And I verify "Bạn đã thực hiện chuyển" "đến số thẻ 9704060129837294 thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      Then I verify before total amount = after total amount + debit amount + fee
      Then I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account
      And I verify "Loại giao dịch: THU VAT TRONG PHI" "1,500" is displayed in mini statement
      And I verify "Loại giao dịch: PHI DV CHUYEN KHOAN QUA THE DN" "15,000" is displayed in mini statement
      And I verify "Loại giao dịch: DEBIT FOR C2C TRANSACTION" "2,000,001" is displayed in mini statement

    @KHDN_express_transfer-02
    Scenario: I do express transfer transaction successfully to account number
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhanh qua thẻ/tài khoản"
      And As KHDN, I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "Chuyển đến Tài Khoản" transaction type, "0129837294" number, "DAB" bank, "500000" amount and "AUTO REMARKS" description
      And I verify "Số tài khoản thụ hưởng" "0129837294" is displayed after doing transaction successfully
      And I verify "Tên tài khoản thụ hưởng" "NGUYEN VAN NAPAS TEST ONLINE IBFT 247 VN" is displayed after doing transaction successfully
      And I verify "Ngân hàng thụ hưởng" "Ngân hàng TMCP Đông Á" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "500,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO REMARKS" is displayed after doing transaction successfully
      And I verify "Phí" "Phí người chuyển trả" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "0 VND" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tài khoản thụ hưởng" "0129837294" is displayed after doing transaction successfully
      And I verify "Tên tài khoản thụ hưởng" "NGUYEN VAN NAPAS TEST ONLINE IBFT 247 VN" is displayed after doing transaction successfully
      And I verify "Ngân hàng thụ hưởng" "Ngân hàng TMCP Đông Á" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "500,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO REMARKS" is displayed after doing transaction successfully
      And I verify "Phí" "Phí người chuyển trả" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "0 VND" is displayed after doing transaction successfully
      Then I get "Số tiền phí" fee from above transaction
      And I get "Số tiền thanh toán" debit amount from above transaction
      Then I approve the above transaction
      And I verify "Bạn đã thực hiện chuyển" "số tài khoản 0129837294 thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      Then I verify before total amount = after total amount + debit amount + fee

    @KHDN_express_transfer-03
    Scenario: I verify fee, VAT and transfer amount are displayed in mini statement
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhanh qua thẻ/tài khoản"
      And As KHDN, I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "Chuyển đến Thẻ" transaction type, "9704060129837294" number, "" bank, "2000001" amount and "AUTO REMARKS" description
      And I verify "Số thẻ thụ hưởng" "9704060129837294" is displayed after doing transaction successfully
      And I verify "Tên tài khoản thụ hưởng" "NGUYEN VAN NAPAS TEST ONLINE IBFT 247 VN" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "2,000,001 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO REMARKS" is displayed after doing transaction successfully
      And I verify "Phí" "Phí người chuyển trả" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "16,500 VND" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số thẻ thụ hưởng" "9704060129837294" is displayed after doing transaction successfully
      And I verify "Tên tài khoản thụ hưởng" "NGUYEN VAN NAPAS TEST ONLINE IBFT 247 VN" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "2,000,001 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO REMARKS" is displayed after doing transaction successfully
      And I verify "Phí" "Phí người chuyển trả" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "16,500 VND" is displayed after doing transaction successfully
      Then I get "Số tiền phí" fee from above transaction
      And I get "Số tiền thanh toán" debit amount from above transaction
      Then I approve the above transaction
      And I verify "Bạn đã thực hiện chuyển" "đến số thẻ 9704060129837294 thành công" is displayed after doing transaction successfully
      Then I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account
      And I verify "Loại giao dịch: THU VAT TRONG PHI" "1,500" is displayed in mini statement
      And I verify "Loại giao dịch: PHI DV CHUYEN KHOAN QUA THE DN" "15,000" is displayed in mini statement
      And I verify "Loại giao dịch: DEBIT FOR C2C TRANSACTION" "2,000,001" is displayed in mini statement


