@HDbank @KHDN_bulk_transfer_ID_card
  Feature: Bulk Transfer to Identify Card

    @KHDN_bulk_transfer_ID_card-01
    Scenario: I do transaction successfully with internal transfer
      Given I open IBK page
      When I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\Ck lo CMND.xls" file to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "10" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "100,045 VND" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "220,000 VND" is displayed after doing transaction successfully
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I get "Tổng số tiền giao dịch quy đổi" debit amount from above transaction
      And I get "Phí giao dịch" fee from above transaction
      And I verify "Tổng số các giao dịch" "10" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "100,045 VND" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "220,000 VND" is displayed after doing transaction successfully
      Then I approve the above transaction
#      And I verify "" "Các giao dịch đã được đưa lên thành công cho việc xử lý trong tương lai" is displayed after doing transaction successfully
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
#      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee

