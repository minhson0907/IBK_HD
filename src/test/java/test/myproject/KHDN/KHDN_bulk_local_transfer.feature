@HDbank @KHDN_bulk_local_transfer
  Feature: Bulk Local Transfer

    @KHDN_bulk_local_transfer-01
    Scenario: I do transaction successfully with
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô trong HDBank"
      And I upload "\data\19c\CK lo trong\Ck lo trong.xls" file to do transferring by "bulk local" with separated to single transaction is "No"
      And I verify "Tổng số giao dịch" "10" is displayed after doing transaction successfully
      And I verify "Tổng giá trị giao dịch quy đổi theo loại tiền" "27,891 VND" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I get "Tổng giá trị giao dịch quy đổi theo loại tiền" debit amount from above transaction
      And I verify "Tổng số giao dịch" "10" is displayed after doing transaction successfully
      And I verify "Tổng giá trị giao dịch quy đổi theo loại tiền" "27,891 VND" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      Then I approve the above transaction
#      And I verify "" "Các giao dịch đã được đưa lên thành công cho việc xử lý trong tương lai" is displayed after doing transaction successfully
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount

