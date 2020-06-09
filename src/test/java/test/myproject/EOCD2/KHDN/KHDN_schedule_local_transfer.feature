@HDbank @KHDN_schedule_local_transfer
  Feature: Schedule Local Transfer

    @KHDN_schedule_local_transfer-01
    Scenario: I do transaction successfully with schedule fund transfer
      Given I open IBK page
      When I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản định kỳ ngoài HDBank"
      Then I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "2000000" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description, "Schedule Fund Transfer2" name, "08" "06" "2020" start date, "09" "06" "2020" end date, "01" "Ngày" frequency and "Thường xuyên" notice
      And I verify "Tài khoản gốc" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "VND 2,000,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I verify "Tên giao dịch định kỳ" "Schedule Fund Transfer2" is displayed after doing transaction successfully
      And I verify "Ngày bắt đầu" "08/06/2020" is displayed after doing transaction successfully
      And I verify "Ngày kết thúc" "09/06/2020" is displayed after doing transaction successfully
      And I verify "Tần suất giao dịch định kỳ" "Mỗi 01 ngày giao dịch sẽ tự động thực hiện lại 1 lần" is displayed after doing transaction successfully
      And I verify "Thông báo" "Thường xuyên" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      And I get transaction number
      Given I open IBK page
      Then I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản gốc" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "VND 2,000,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I verify "Tên giao dịch định kỳ" "Schedule Fund Transfer2" is displayed after doing transaction successfully
      And I verify "Ngày bắt đầu" "08/06/2020" is displayed after doing transaction successfully
      And I verify "Ngày kết thúc" "09/06/2020" is displayed after doing transaction successfully
      And I verify "Tần suất giao dịch định kỳ" "Mỗi 01 ngày giao dịch sẽ tự động thực hiện lại 1 lần" is displayed after doing transaction successfully
      And I verify "Thông báo" "Thường xuyên" is displayed after doing transaction successfully
      Then I approve the above transaction
#      Then I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify the number transaction is displayed "Giao dịch định kì" table in Home page






