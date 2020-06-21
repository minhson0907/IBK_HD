@HDbank @KHDN_bulk_payment_of_wages
Feature: Bulk Payment of wages

  @KHDN_bulk_payment_of_wages-01
  Scenario: I do transaction successfully with separated to single transaction is No and charged fee is Bên nhận
    Given I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    And I get amount total before doing transaction
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\19c\CK lo ngoai\Ck lo ngoai 2i 05 BEN.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    Then I approve the above transaction
#    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I get amount total after doing transaction
    And I verify before total amount = after total amount + debit amount

  @KHDN_bulk_payment_of_wages-02
  Scenario: I verify an error message is displayed when transferring duplicated file
    Given I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    And I get amount total before doing transaction
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\19c\CK lo ngoai\Ck lo ngoai 2i 05 BEN.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Đã có giao dịch tương tự tồn tại trên hệ thống. Vui lòng kiểm tra lại thông tin. Cảm ơn Quý Khách hàng!" is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-03
  Scenario: I do transaction successfully with separated to single transaction is Yes and charged fee is Bên nhận
    Given I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\19c\CK lo ngoai\Ck lo ngoai 2i 04 BEN.xls" file to do transferring by "payment of wages" with separated to single transaction is "Yes"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "Yes" is displayed after doing transaction successfully
    And I verify "Số tiền chuyển" "VND 20,000,000" is displayed in mini statement
#    And I verify "Phí" "VND 10,450" is displayed in mini statement
#    And I verify "Phí" "VND 20,350" is displayed in mini statement
    Then I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    And I approve the above transaction
    And I verify "" "Danh sách giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
    And I get amount total before doing transaction
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    Then I approve the above transaction
#    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    Then I approve the above transaction
#    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I get amount total after doing transaction
    And I verify before total amount = after total amount + debit amount

  @KHDN_bulk_payment_of_wages-04
  Scenario: I do transaction successfully with separated to single transaction is No and charged fee is Bên chuyển
    Given I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\CK lo ngoai\Ck lo ngoai 2i 05.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
    And I get amount total before doing transaction
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I get "Tổng số các giao dịch" transaction total when uploading file
    And I get bulk payment of wages fee
    Then I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    Then I approve the above transaction
    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I get amount total after doing transaction
    And I verify before total amount = after total amount + debit amount + fee when upload file


  @KHDN_bulk_payment_of_wages-05
  Scenario: I do transaction successfully with separated to single transaction is Yes and charged fee is Bên chuyển
    Given I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\CK lo ngoai\Ck lo ngoai 2i 04.xls" file to do transferring by "payment of wages" with separated to single transaction is "Yes"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "Yes" is displayed after doing transaction successfully
    And I get "Tổng số các giao dịch" transaction total when uploading file
    And I get bulk payment of wages fee
    Then I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    And I approve the above transaction
    And I verify "" "Danh sách giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
    And I get amount total before doing transaction
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    Then I approve the above transaction
    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    Then I approve the above transaction
    And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
    And I get amount total after doing transaction
    And I verify before total amount = after total amount + debit amount + fee when upload file

  @KHDN_bulk_payment_of_wages-06
  Scenario: I verify the after limit = the before limit - debit amount
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then As KHDN, I search the limit with user "autotestduyet"
    And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
    Then I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\CK lo ngoai\Ck lo ngoai 2i 03.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I get "Tổng số tiền giao dịch quy đổi theo VNĐ" debit amount from above transaction
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    Then I approve the above transaction
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then As KHDN, I search the limit with user "autotestduyet"
    And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I get after transferring limit "Chuyển tiền ngoài hệ thống" with above user
    Then I verify after transferring limit = before transferring limit - "30000000"

  @KHDN_bulk_payment_of_wages-07
  Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then As KHDN, I search the limit with user "autotestduyet"
    And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I edit limit amount per transaction to "29999999‬" for "Chuyển tiền ngoài hệ thống"
    Then I update the above request
    And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
    Then I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\CK lo ngoai\Ck lo ngoai 2i 02.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
    And I verify "Tổng số tiền giao dịch quy đổi theo VNĐ" "30,000,000 VND" is displayed after doing transaction successfully
    And I verify "Tách thành giao dịch đơn" "No" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    And I verify "Số tiền giao dịch" "vượt quá hạn mức cho mỗi lần giao dịch" is displayed in mini statement
#      Change other limit account to run again test case
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then As KHDN, I search the limit with user "autotestduyet"
    And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
    And I edit limit amount per transaction to "40000000" for "Chuyển tiền ngoài hệ thống"
    Then I update the above request
    And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-08
  Scenario: I verify the transaction is not approved when transferring with limit = 0
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    #    Dùng bộ user khác vì case này chuyển hạn mức còn lại trong ngày về 0
    Then As KHDN, I search the limit with user "kiemthu1_duyet"
    And As KHDN, I choose "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" account, "kiemthu1_duyet" ID account and "HDBank OTP" authenticate method
    And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
    And I edit limit amount per transaction over remaining limit for "Chuyển tiền ngoài hệ thống"
    And I edit limit amount per day over remaining limit for "Chuyển tiền ngoài hệ thống"
    Then I update the above request
    Given I open Admin page
    When I login ADMIN with "CK_001_LEDTH" and "abc123"
    Then I approve the above request
    And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
    Given I open Admin page
    When I login ADMIN with "RM_LEDTH" and "abc123"
    Then As KHDN, I search the limit with user "kiemthu1_duyet"
    And As KHDN, I choose "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" account, "kiemthu1_duyet" ID account and "HDBank OTP" authenticate method
    And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
    Then I open IBK page
    When As an input user, I login KHDN with "kiemthu1_nhap" and "abc123"
    And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
    And I transfer from "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" with "before remaining limit total + 1" to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
    And I input the code to complete the transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "kiemthu1_duyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    Then I approve the above transaction
    Then I open IBK page
    When As an input user, I login KHDN with "kiemthu1_nhap" and "abc123"
    Then I do transaction with type is "TRANSFER" and "Chuyển khoản theo lô ngoài HDBank"
    And I upload "\data\CK lo ngoai\Ck lo ngoai limit.xls" file to do transferring by "payment of wages" with separated to single transaction is "No"
    And I verify "Tổng số các giao dịch" "1" is displayed after doing transaction successfully
    And I approve the above transaction
    And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
    Given I open IBK page
    Then As an approval user, I login KHDN with "kiemthu1_duyet" and "abc123"
    And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
    And I search the above transaction
    Then I approve the above transaction
#    And I verify "Số tiền giao dịch" "vượt quá hạn mức cho mỗi lần giao dịch" is displayed in mini statement
    And I verify "" "UserID chưa được cấp hạn mức cho loại giao dịch này. Vui lòng liên hệ trung tâm hỗ trợ HDBank" is displayed after doing transaction successfully

  @KHDN_bulk_payment_of_wages-00
  Scenario Outline: I verify upload file with load testing
    Given I open IBK page
    When As an input user, I login KHDN with "autotestnhap" and "abc123"
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
      | path                                   | number total | amount number |
      | \data\CK lo ngoai\Ck lo ngoai 100i.xls | 100          | 505,150 VND   |
      | \data\CK lo ngoai\Ck lo ngoai 150i.xls | 150          | 761,475 VND   |
      | \data\CK lo ngoai\Ck lo ngoai 200i.xls | 200          | 1,020,300 VND |
      | \data\CK lo ngoai\Ck lo ngoai 500i.xls | 500          | 2,625,750 VND |

