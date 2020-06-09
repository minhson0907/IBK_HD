@HDbank @KHDN_bulk_payment_of_wages
Feature: Bulk Payment of wages

  @KHDN_bulk_payment_of_wages-01
  Scenario: I verify before total amount = after total amount + debit amount
    Given I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    And I get amount total before doing transaction
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\Ck lo ngoai 2i 05.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
    Given I open IBK page
    Then I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    Then I approve the above transaction
    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I get amount total after doing transaction
    And I verify before total amount = after total amount + debit amount

  @KHDN_bulk_payment_of_wages-02
  Scenario: I verify an error message is displayed when transferring duplicated file
    Given I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    And I get amount total before doing transaction
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\Ck lo ngoai 2i 05.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Đã có giao dịch tương tự tồn tại trên hệ thống. Vui lòng kiểm tra lại thông tin. Cảm ơn Quý Khách hàng!" is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-03
  Scenario: I do transaction successfully with internal transfer with separated to single transaction
    Given I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\Ck lo ngoai 2i 04.xls" file to do transferring by "payment of wages" with separated to single transaction is "Yes"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "Yes" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Danh sách giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-04
  Scenario Outline: I approve the transaction with internal transfer with separated to single transaction
    Given I open IBK page
    Then I login KHDN with "autotestduyet" and "abc123"
    And I get amount total before doing transaction
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I verify "Số tiền chuyển" "<amount>" is displayed after doing transaction successfully
    And I verify "Số tài khoản người hưởng" "<account number>" is displayed after doing transaction successfully
    And I verify "Tên người hưởng" "<name>" is displayed after doing transaction successfully
    And I verify "Tên ngân hàng" "<bank>" is displayed after doing transaction successfully
    And I verify "Phí giao dịch" "<fee>" is displayed after doing transaction successfully
    And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
    And I verify "Chi tiết thanh toán" "AUTOMATION TESTING" is displayed after doing transaction successfully
    And I get "Số tiền chuyển" debit amount from above transaction
    And I get "Phí giao dịch" fee from above transaction
    Then I approve the above transaction
    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I get amount total after doing transaction
    And I verify before total amount = after total amount + debit amount + fee
    Examples:
      | amount     | account number | name            | bank   | fee    |
#      | 20,000,000 | 0123456789018  | Phan Quoc Hao 2 | ABBANK | 10,450 |
#      | 10,000,000 | 0123456789017  | Phan Quoc Hao 1 | ABBANK | 10,450 |
      | 20,000,000 | 0123456789228  | Phan B          | ABBANK | 10,450 |
      | 10,000,000 | 0123456789227  | Phan A          | ABBANK | 10,450 |

  @KHDN_bulk_payment_of_wages-05
  Scenario: I verify the after limit = the before limit - debit amount
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then I search the limit with user "autotestduyet"
    And I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
    Then I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\Ck lo ngoai 2i 03.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
    Given I open IBK page
    Then I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    Then I approve the above transaction
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then I search the limit with user "autotestduyet"
    And I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I get after transferring limit "Chuyển tiền ngoài hệ thống" with above user
    Then I verify after transferring limit = before transferring limit - "30000000"

  @KHDN_bulk_payment_of_wages-06
  Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then I search the limit with user "autotestduyet"
    And I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I edit limit amount per transaction to "29999999‬" for "Chuyển tiền ngoài hệ thống"
    And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
    Then I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\Ck lo ngoai 2i 02.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
    Given I open IBK page
    Then I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I verify "" "Số tiền giao dịch 30,020,900 VND vượt quá hạn mức cho mỗi lần giao dịch 045704070000966 (CTY CP HOANG YEN) - VND. Hạn mức cho mỗi lần giao dịch là 29,999,999 VND" is displayed in mini statement
#      Change other limit account to run again test case
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then I search the limit with user "autotestduyet"
    And I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I edit limit amount per transaction to "40000000" for "Chuyển tiền ngoài hệ thống"
    And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-07
  Scenario: I verify the transaction is not approved when transferring with amount > limit amount per day
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then I search the limit with user "autotestduyet"
    And I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I edit limit amount per day to "100000000" for "Chuyển tiền ngoài hệ thống"
    And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
    Then I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\Ck lo ngoai 5i 01.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "5" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "100,000,001 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
    Given I open IBK page
    Then I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I verify "" "Số tiền giao dịch 100,052,251 VND vượt quá hạn mức cho mỗi lần giao dịch 045704070000966 (CTY CP HOANG YEN) - VND. Hạn mức cho mỗi lần giao dịch là 40,000,000 VND" is displayed in mini statement
#     Change other limit account to run again test case
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then I search the limit with user "autotestduyet"
    And I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I edit limit amount per day to "200000000" for "Chuyển tiền ngoài hệ thống"
    And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-00
  Scenario Outline: I verify upload file with load testing
    Given I open IBK page
    When I login KHDN with "autotestnhap" and "abc123"
    And I get amount total before doing transaction
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "<path>" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "<number total>" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "<amount number>" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
#    And I approve the above transaction
#    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
#    Given I open IBK page
#    Then I login KHDN with "autotestduyet" and "abc123"
#    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
#    And I search the above transaction
#    And I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
#    And I verify "Tổng số các giao dịch" "<number total>" is displayed after doing transaction successfully
#    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "<amount number>" is displayed after doing transaction successfully
#    Then I approve the above transaction
#    And I get amount total after doing transaction
#    And I verify before total amount = after total amount + debit amount
    Examples:
      | path                       | number total | amount number |
      | \data\Ck lo ngoai 100i.xls | 100          | 505,150 VND   |
      | \data\Ck lo ngoai 150i.xls | 150          | 761,475 VND   |
      | \data\Ck lo ngoai 200i.xls | 200          | 1,020,300 VND |
      | \data\Ck lo ngoai 500i.xls | 500          | 2,625,750 VND |

