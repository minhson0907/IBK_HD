@HDbank @KHDN_interbank_transfer
  Feature: Interbank Transfer

    @KHDN_interbank_transfer-01
    Scenario: I do an interbank transfer transaction successfully with charged fee is Người chuyển
      Given I open IBK page
      Then As an input user, I login KHDN with "son_nhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "200000" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I get "Số tiền chuyển" debit amount from above transaction
      And I get "Phí giao dịch" fee from above transaction
      Then I approve the above transaction
#      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch đã được chấp nhận và đang được duyệt" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount + fee

    @KHDN_interbank_transfer-02
    Scenario: I verify the transaction is displayed in mini statement
      Given I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "ACCOUNT" and "Sổ phụ rút gọn"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account
      And I verify "Loại giao dịch: GD GHI NO TU TT THANH TOAN" "200,000" is displayed in mini statement
      And I verify "Nội dung" "AUTO DESCRIPTION" is displayed in mini statement

    @KHDN_interbank_transfer-03
    Scenario: I do an interbank transfer transaction successfully with charged fee is Người hưởng
      Given I open IBK page
      Then As an input user, I login KHDN with "son_nhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "200000" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người hưởng" fee payer and "AUTO DESCRIPTION" description
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người hưởng" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người hưởng" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I get "Số tiền chuyển" debit amount from above transaction
      Then I approve the above transaction
#      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
#      And I verify "" "Giao dịch đã được ghi nhận thành công và đang chờ xử lý" is displayed after doing transaction successfully
      And I verify "" "Giao dịch đã được chấp nhận và đang được duyệt" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      And I verify before total amount = after total amount + debit amount

    @KHDN_interbank_transfer-04
    Scenario: I verify the after limit = the before limit - debit amount with charged fee is Người hưởng
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "200000" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người hưởng" fee payer and "AUTO DESCRIPTION" description
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người hưởng" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người hưởng" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I approve the above transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get after transferring limit "Chuyển tiền ngoài hệ thống" with above user
      Then I verify after transferring limit = before transferring limit - "200000"

    @KHDN_interbank_transfer-05
    Scenario: I verify the after limit = the before limit - debit amount with charged fee is Người chuyển
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "200000" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền chuyển" "VND 200,000" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I approve the above transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get after transferring limit "Chuyển tiền ngoài hệ thống" with above user
      Then I verify after transferring limit = before transferring limit - "200000"

    @KHDN_interbank_transfer-06
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I edit limit amount per transaction to "30000000" for "Chuyển tiền ngoài hệ thống"
      And I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "30000001" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      And I verify "Số tiền chuyển" "VND 30,000,001" is displayed after doing transaction successfully
      And I verify "Số tài khoản người hưởng" "0864774684357" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "VO MINH SON" is displayed after doing transaction successfully
      And I verify "Tên ngân hàng" "AGRIBANK" is displayed after doing transaction successfully
      And I verify "Thành phố của ngân hàng" "HO CHI MINH" is displayed after doing transaction successfully
      And I verify "Chi nhánh của ngân hàng" "AGRIBANK CN GIA DINH" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 9,900" is displayed after doing transaction successfully
#      And I verify "Phí giao dịch" "VND 19,800" is displayed after doing transaction successfully
      And I verify "Số tiền chuyển" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Chi tiết thanh toán" "AUTO DESCRIPTION" is displayed after doing transaction successfully
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
      And I edit limit amount per transaction to "40000000" for "Chuyển tiền ngoài hệ thống"
      And I update the above request
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully

    @KHDN_interbank_transfer-07
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per day
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
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
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "before remaining limit total + 1" to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Số tiền giao dịch" "vượt quá hạn mức giao dịch trong ngày của tài khoản" is displayed after doing transaction successfully

    @KHDN_interbank_transfer-08
    Scenario: I verify the transaction is not approved when transferring with limit = 0
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
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
      Then As KHDN, I search the limit with user "sonvm3"
      And As KHDN, I choose "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" account, "sonvm3" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền ngoài hệ thống" with above user
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "before remaining limit total" to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I approve the above transaction
      Then I open IBK page
      When As an input user, I login KHDN with "son_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển khoản ngoài HDBank"
      And I transfer from "033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND" with "1" amount to "0864774684357" account number, "VO MINH SON" account name, "AGRIBANK" bank name, "HO CHI MINH" city, "AGRIBANK CN GIA DINH" branch, "Người chuyển" fee payer and "AUTO DESCRIPTION" description
      Then I input the code to complete the transaction
      Given I open IBK page
      Then As an approval user, I login KHDN with "sonvm3" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "" "Số tiền giao dịch 1 VND vượt quá hạn mức giao dịch trong ngày của tài khoản 033704070000111 (CTY CP CONG NGHE DTH & GIAI PHAP SO) - VND. Hạn mức còn lại của tài khoản là: 0 VND" is displayed after doing transaction successfully


