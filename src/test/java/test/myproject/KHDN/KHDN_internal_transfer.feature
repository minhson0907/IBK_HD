@HDbank @KHDN_internal_transfer
  Feature: Internal Transfer

    @KHDN_internal_transfer-01
    Scenario: I do an interbank transfer transaction successfully with charged fee is Bên nhận
      Given I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
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

    @KHDN_internal_transfer-02
    Scenario: I do an interbank transfer transaction successfully with charged fee is Bên chuyển
      Given I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      And I get "Số tiền ghi nợ" debit amount from above transaction
      And I get "Số tiền phí" fee from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee

    @KHDN_internal_transfer-03
    Scenario: I verify the transaction is displayed in mini statement
      Given I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account
      And I verify "Loại giao dịch: GHI NO BANG CHUYEN KHOAN IBANK" "200,000" is displayed in mini statement
      And I verify "TK đích:" "002704070000868" is displayed in mini statement
      And I verify "Nội dung" "AUTO DESCRIPTION" is displayed in mini statement

    @KHDN_internal_transfer-04
    Scenario: I verify the after limit = the before limit - debit amount with charged fee is Bên nhận
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I approve the above transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get after transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I verify after transferring limit = before transferring limit - "200000"

    @KHDN_internal_transfer-05
    Scenario: I verify the after limit = the before limit - debit amount with charged fee is Bên chuyển
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I approve the above transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get after transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I verify after transferring limit = before transferring limit - "200000"

    @KHDN_internal_transfer-06
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I edit limit amount per transaction to "30000000" for "Chuyển tiền trong khác chủ TK"
      And I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "30000001" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản thụ hưởng" "002704070000868 (DUONG HOANG NHU THAO) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền ghi có" "VND 30,000,001" is displayed after doing transaction successfully
      And I verify "Số tiền ghi nợ" "VND 30,000,001" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "" "Số tiền giao dịch 30,000,001 VND vượt quá hạn mức cho mỗi lần giao dịch" is displayed after doing transaction successfully
#      Change other limit account to run again test case
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I edit limit amount per transaction to "40000000" for "Chuyển tiền trong khác chủ TK"
      And I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

    @KHDN_internal_transfer-07
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per day
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
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
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account with "before remaining limit total + 1"
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền giao dịch" "vượt quá hạn mức giao dịch trong ngày" is displayed after doing transaction successfully

    @KHDN_internal_transfer-08
    Scenario: I verify the transaction is not approved when transferring with limit = 0
      Given I open Admin page
      When I login ADMIN with "RM_002_MYTTT" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      And I edit limit amount per transaction over remaining limit for "Chuyển tiền trong khác chủ TK"
      And I edit limit amount per day over remaining limit for "Chuyển tiền trong khác chủ TK"
      Then I update the above request
      Given I open Admin page
      When I login ADMIN with "CK_002_MAINTQ" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_002_MYTTT" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account with "before remaining limit total"
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I approve the above transaction
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHDN, I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" to "002704070000868" account, "1" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "" "Số tiền giao dịch 1 VND vượt quá hạn mức giao dịch trong ngày của tài khoản 033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND. Hạn mức còn lại của tài khoản là: 0 VND" is displayed after doing transaction successfully



