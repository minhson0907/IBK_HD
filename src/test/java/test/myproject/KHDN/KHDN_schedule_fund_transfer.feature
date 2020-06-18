@HDbank @KHDN_schedule_fund_transfer
  Feature: Schedule Fund Transfer

    @KHDN_schedule_fund_transfer-01
    Scenario: I do transaction successfully with schedule fund transfer
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản định kỳ trong HDBank"
      Then As KHDN, I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" to "002704070000868", "2000000" amount, "Schedule Fund" name, "01" "Ngày" frequency and "Thường xuyên" notice
      And I verify "Tài khoản được hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 2,000,000" is displayed after doing transaction successfully
      And I verify "Tên giao dịch định kỳ" "Schedule Fund" is displayed after doing transaction successfully
      And I verify "Tần suất giao dịch định kỳ" "Mỗi 1 ngày giao dịch sẽ tự động thực hiện lại 1 lần" is displayed after doing transaction successfully
      And I verify "Thông báo" "Thường xuyên" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      And I get transaction number
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản được hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 2,000,000" is displayed after doing transaction successfully
      And I verify "Tên giao dịch định kỳ" "Schedule Fund" is displayed after doing transaction successfully
      And I verify "Tần suất giao dịch định kỳ" "Mỗi 1 ngày giao dịch sẽ tự động thực hiện lại 1 lần" is displayed after doing transaction successfully
      And I verify "Thông báo" "Thường xuyên" is displayed after doing transaction successfully
      And I approve the above transaction
#      Then I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      Then I verify "" "Yêu cầu chuyển khoản của bạn đã được đưa lên. Thông báo sẽ được gửi sau khi xử lí giao dịch" is displayed after doing transaction successfully
      And I verify the number transaction is displayed "Giao dịch định kì" table in Home page






