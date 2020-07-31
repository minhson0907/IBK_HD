@HDbank @KHCN_internal_transfer
  Feature: Internal Transfer

    @KHCN_internal_transfer-01
    Scenario: I do transaction successfully with charged fee is Bên nhận
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản thụ hưởng" "002704070000868" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "198,350" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "VND 1,650" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I get "Số tiền ghi nợ" debit amount from above transaction
      And I get "Số tiền phí" fee from above transaction
      And I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount
      Then I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account
      And I verify "Loại giao dịch: THU VAT TRONG PHI" "150" is displayed in mini statement
      And I verify "Loại giao dịch: CN/EBANKING/CK/T.HDB" "1,500" is displayed in mini statement
      And I verify "Loại giao dịch: GHI NO BANG CHUYEN KHOAN IBANK" "198,350" is displayed in mini statement
      And I verify "Nội dung" "AUTO DESCRIPTION" is displayed in mini statement

    @KHCN_internal_transfer-02
    Scenario: I do transaction successfully with charged fee is Bên chuyển
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      Then I verify "Tài khoản thụ hưởng" "002704070000868" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "201,650" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "VND 1,650" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I get "Số tiền ghi có" debit amount from above transaction
      And I get "Số tiền phí" fee from above transaction
      And I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee
      Then I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account
      And I verify "Loại giao dịch: THU VAT TRONG PHI" "150" is displayed in mini statement
      And I verify "Loại giao dịch: CN/EBANKING/CK/T.HDB" "1,500" is displayed in mini statement
      And I verify "Loại giao dịch: GHI NO BANG CHUYEN KHOAN IBANK" "200,000" is displayed in mini statement
      And I verify "Nội dung" "AUTO DESCRIPTION" is displayed in mini statement

    @KHCN_internal_transfer-03
    Scenario: I do transaction successfully with accounts in a cif and charged fee is Bên chuyển/Bên nhận
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070002050" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      Then I verify "Tài khoản thụ hưởng" "002704070002050" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "0" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I get "Số tiền ghi có" debit amount from above transaction
      And I get "Số tiền phí" fee from above transaction
      And I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee

    @KHCN_internal_transfer-04
    Scenario: I verify the after limit = the before limit - debit amount with charged fee is Bên nhận
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên nhận"
      Then I verify "Tài khoản thụ hưởng" "002704070000868" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "198,350" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "VND 1,650" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên nhận" is displayed after doing transaction successfully
      And I get "Số tiền ghi có" debit amount from above transaction
      And I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get after transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I verify after transferring limit = before transferring limit - "198350"

    @KHCN_internal_transfer-05
    Scenario: I verify the after limit = the before limit - debit amount with charged fee is Bên chuyển
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      Then I verify "Tài khoản thụ hưởng" "002704070000868" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "201,650" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "VND 1,650" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get after transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I verify after transferring limit = before transferring limit - "200000"

    @KHCN_internal_transfer-06
    Scenario: I verify the after limit = the before limit - debit amount when transferring with accounts in a CIF
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "003704070003686" account, "200000" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      Then I verify "Tài khoản thụ hưởng" "003704070003686" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi nợ" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền ghi có" "200,000" is displayed after doing transaction successfully
      Then I verify "Số tiền phí" "VND 0" is displayed after doing transaction successfully
      Then I verify "Phí tính cho bên" "Bên chuyển" is displayed after doing transaction successfully
      And I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công." is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get after transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Then I verify after transferring limit = before transferring limit - "0"

    @KHCN_internal_transfer-07
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I edit limit amount per transaction to "30000000" for "Chuyển tiền trong khác chủ TK"
      And I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Given I open IBK page
      Then I login KHCN with "tamtrg09" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account, "30000001" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      And I verify "" "Số tiền giao dịch 30,000,001 VND vượt quá hạn mức cho mỗi lần giao dịch" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I edit limit amount per transaction to "40000000" for "Chuyển tiền trong khác chủ TK"
      And I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

    @KHCN_internal_transfer-08
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per day
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
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
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      When I login KHCN with "tamtrg09" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account with "before remaining limit total + 1"
      Then I verify "Số tiền giao dịch" "vượt quá hạn mức giao dịch trong ngày" is displayed after doing transaction successfully

    @KHCN_internal_transfer-09
    Scenario: I verify the transaction is not approved when transferring with limit = 0
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
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
      Then As KHCN, I search the limit with user "tamtrg09"
      And  As KHCN, I choose "003704070000251 (TRUONG THANH TAM) - VND" account, "tamtrg09" ID account and "SMS OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      When I login KHCN with "tamtrg09" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
#      transferring to make the limit = 0
      And I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account with "before remaining limit total"
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I do transaction with type is "TRANSFER" and "Chuyển khoản trong HDBank"
      And As KHCN, I transfer from "003704070000251 (TRUONG THANH TAM) - VND" to "002704070000868" account, "1" amount and "AUTO DESCRIPTION" description with fee payer is "Bên chuyển"
      And I verify "Số tiền giao dịch" "vượt quá hạn mức giao dịch trong ngày" is displayed after doing transaction successfully


