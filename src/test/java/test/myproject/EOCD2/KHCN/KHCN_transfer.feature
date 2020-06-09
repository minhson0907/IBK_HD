@HDbank @KHCN_transfer
  Feature: Transfer

    @KHCN_transfer-01
    Scenario: Internal transfer
      Given I open IBK page
      Then I login KHCN with "datathanhvan" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And I transfer from "002704070001208 (CAO VAN THANH) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản được hưởng" "002704070000868" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "201,650" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "VND 1,650" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      And I verify the Debit Amount = Credit Amount + Charge Amount
      And I verify before total amount = after total amount + debit amount
      
    @KHCN_transfer-02
    Scenario: Interbank transfer
      Given I open IBK page
      Then I login KHCN with "datathanhvan" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "002704070001208 (CAO VAN THANH) - VND" with "200000" amount to "0071001245493" account number, "Vo Minh Son" account name, "VIETCOMBANK" bank name, "HO CHI MINH" city, "VIETCOMBANK CN TP HCM" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "VND 6,600" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0071001245493" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "VIETCOMBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "VIETCOMBANK CN TP HCM" is displayed after doing transaction successfully
      Then I verify "" "Giao dịch đã được chấp nhận và đang được duyệt." is displayed after doing transaction successfully
      And I verify before total amount = after total amount + credit amount + charge amount
