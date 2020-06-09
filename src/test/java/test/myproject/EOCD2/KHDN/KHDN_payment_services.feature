@HDbank @KHDN_payment_services
  Feature: Payment Services

    @KHDN_payment_services-01
    Scenario: I verify top up VietJetAir successfully
      Given I open IBK page
      When I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "BILLSPAYMENT" and "Topup cho đại lý VietJetAir"
      Then I top up from "045704070000966 (CTY CP HOANG YEN) - VND" to "37000272" agent code with "3000000" amount of payment and "AUTO NOTE" note
      And I verify "Tài khoản trích nợ" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "3,000,000 VND" is displayed after doing transaction successfully
      And I verify "Nhà cung cấp dịch vụ" "CTY CP HANG KHONG VIETJET" is displayed after doing transaction successfully
      And I verify "Mã đại lý" "37000272" is displayed after doing transaction successfully
      And I verify "Tên đại lý" "DLCN LE THANH THAO" is displayed after doing transaction successfully
      And I verify "Địa chỉ" "55A CACH MANG THANG 8, P7, Q.TAN BINH" is displayed after doing transaction successfully
      And I verify "Tài khoản thụ hưởng" "077704070001168 (CTY CP HANG KHONG VIETJET) - VND" is displayed after doing transaction successfully
      And I verify "Nội dung diễn giải" "AUTO NOTE" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "0 VND" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then I login KHDN with "autotestduyet" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản trích nợ" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền thanh toán" "3,000,000 VND" is displayed after doing transaction successfully
      And I verify "Nhà cung cấp dịch vụ" "CTY CP HANG KHONG VIETJET" is displayed after doing transaction successfully
      And I verify "Mã đại lý" "37000272" is displayed after doing transaction successfully
      And I verify "Tên đại lý" "DLCN LE THANH THAO" is displayed after doing transaction successfully
      And I verify "Địa chỉ" "55A CACH MANG THANG 8, P7, Q.TAN BINH" is displayed after doing transaction successfully
      And I verify "Tài khoản thụ hưởng" "077704070001168 (CTY CP HANG KHONG VIETJET) - VND" is displayed after doing transaction successfully
      And I verify "Nội dung diễn giải" "AUTO NOTE" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "0 VND" is displayed after doing transaction successfully
      Then I get "Số tiền thanh toán" debit amount from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch đã được ghi nhận và đang đợi xử lý, Quý khách vui lòng kiểm tra lịch sử giao dịch sau ít phút để biết kết quả giao dịch." is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount

    @KHDN_payment_services-02
    Scenario: I verify postpaid mobile bill is paid successfully
      Given I open IBK page
      When I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "BILLSPAYMENT" and "Thanh toán hoá đơn"
      Then I pay from "045704070000966 (CTY CP HOANG YEN) - VND" with "Thanh toán cước điện thoại" service type, "Mobifone - Thanh toán cước điện thoại di động trả sau" service provider, "0904320156" customer code and "AUTO NOTE" note


