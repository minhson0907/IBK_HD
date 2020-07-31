@HDbank @KHDN_internal_transfer_approval_group

  Feature: Internal Transfer with approval group

    @KHDN_internal_transfer_approval_group-01
    Scenario: I do internal transfer with charged fee is Bên nhận and approval by multi-level group
      Given I open IBK page
      When As an input user in group, I login KHDN with "ketoanthanhtoan" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN in group, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As the first approval user in multi group, I login KHDN with "ketoantruong01" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      And I get "Số tiền ghi nợ" debit amount from above transaction
      And I get "Số tiền phí" fee from above transaction
      Then I approve the above transaction
      And I verify "Giao dịch có số tham chiếu" "đã được duyệt. Hệ thống sẽ thông báo đến người lập giao dịch" is displayed after doing transaction successfully
      Given I open IBK page
      Then As the second approval user in multi group, I login KHDN with "DUYTRINH2510" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      And I get "Số tiền ghi nợ" debit amount from above transaction
      And I get "Số tiền phí" fee from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee
      And I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHDN in group, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account
      And I verify "Loại giao dịch: GHI NO BANG CHUYEN KHOAN IBANK" "200,000" is displayed in mini statement
      And I verify "TK đích:" "002704070000868" is displayed in mini statement
      And I verify "Nội dung" "AUTO DESCRIPTION" is displayed in mini statement