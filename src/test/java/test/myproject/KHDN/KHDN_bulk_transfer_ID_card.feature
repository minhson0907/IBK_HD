@HDbank @KHDN_bulk_transfer_ID_card
  Feature: Bulk Transfer to Identify Card

    @KHDN_bulk_transfer_ID_card-01
    Scenario: I do transaction successfully with separated to single transaction is No and charged fee is Bên nhận
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I get "Tổng số tiền giao dịch quy đổi" debit amount from above transaction
      And I get "Phí giao dịch" fee from above transaction
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount

    @KHDN_bulk_transfer_ID_card-02
    Scenario: I verify an error message is displayed when transferring duplicated file
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I approve the above transaction
#      And I verify "" "Đã có giao dịch tương tự tồn tại trên hệ thống. Vui lòng kiểm tra lại thông tin. Cảm ơn Quý Khách hàng!" is displayed after doing transaction successfully
#    still success with duplicated file

    @KHDN_bulk_transfer_ID_card-03
    Scenario: I do transaction successfully with separated to single transaction is Yes and charged fee is Bên nhận
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i 01.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "Yes"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I get "Tổng số các giao dịch" transaction total when uploading file
      And I get "Tổng số tiền giao dịch quy đổi" debit amount from above transaction
      And I approve the above transaction
      And I verify "" "Danh sách giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount

    @KHDN_bulk_transfer_ID_card-04
    Scenario: I do transaction successfully with separated to single transaction is No and charged fee is Bên chuyển
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i 01 BEN.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I get "Tổng số các giao dịch" transaction total when uploading file
      And I get "Tổng số tiền giao dịch quy đổi" debit amount from above transaction
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I get "Tổng số tiền giao dịch quy đổi" debit amount from above transaction
      And I get "Phí giao dịch" fee from above transaction
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee when upload file

    @KHDN_bulk_transfer_ID_card-05
    Scenario: I do transaction successfully with separated to single transaction is Yes and charged fee is Bên chuyển
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i 02 BEN.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "Yes"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I get "Tổng số các giao dịch" transaction total when uploading file
      And I get "Tổng số tiền giao dịch quy đổi" debit amount from above transaction
      And I approve the above transaction
      And I verify "" "Danh sách giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I get "Phí giao dịch" fee from above transaction
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee when upload file

    @KHDN_bulk_transfer_ID_card-06
    Scenario: I verify the after limit = the before limit - debit amount
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      When As an approval user, I login KHDN with "autotestnhap" and "abc123"
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i 03.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      Then I approve the above transaction
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I get after transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I verify after transferring limit = before transferring limit - "30000000"

    @KHDN_bulk_transfer_ID_card-07
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I edit limit amount per transaction to "29999999‬" for "Chuyển tiền trong khác chủ TK"
      Then I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 2i 04.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "2" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "30,000,000 VND" is displayed after doing transaction successfully
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền giao dịch" "vượt quá hạn mức cho mỗi lần giao dịch" is displayed after doing transaction successfully
#      Change other limit account to run again test case
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I edit limit amount per transaction to "40000000" for "Chuyển tiền trong khác chủ TK"
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

    @KHDN_bulk_transfer_ID_card-08
    Scenario: I verify the transaction is not approved when transferring with limit = 0
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      And I edit limit amount per transaction over remaining limit for "Chuyển tiền trong khác chủ TK"
      And I edit limit amount per day over remaining limit for "Chuyển tiền trong khác chủ TK"
      Then I update the above request
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" to "002704070000868" account with "before remaining limit total"
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I approve the above transaction
      Given I open IBK page
      When As an input user, I login KHDN with "autotestnhap" and "abc123"
      Then I do transaction with type is "TRANSFER" and "Chuyển tiền nhận qua CMND theo lô"
      And I upload "\data\CK lo CMND\Ck lo CMND 5i limit.xls" file from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account to do transferring by "identity card" with separated to single transaction is "No"
      And I verify "Tổng số các giao dịch" "1" is displayed after doing transaction successfully
      And I verify "Tổng số tiền giao dịch quy đổi" "5 VND" is displayed after doing transaction successfully
      And I approve the above transaction
      And I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền giao dịch" "vượt quá hạn mức giao dịch trong ngày" is displayed after doing transaction successfully