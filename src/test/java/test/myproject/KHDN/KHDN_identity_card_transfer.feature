@HDbank @KHDN_identity_card_transfer
  Feature: Identity Card Transfer

    @KHDN_identity_card_transfer-01
    Scenario: I do an identity card transfer transaction successfully with identification type is CMND and charged fee is Người chuyển
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "400000" amount, "Vo Minh Son" name, "CMND" Identification type, "311858999" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người chuyển" fee charged and "AUTO DESCRIPTION" description
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "CMND" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "311858999" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "22,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "CMND" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "311858999" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "22,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I get "Phí giao dịch" fee from above transaction
      And I get "Số tiền" debit amount from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      Then I verify before total amount = after total amount + debit amount + fee

    @KHDN_identity_card_transfer-02
    Scenario: I do an identity card transfer transaction successfully with identification type is CMND and charged fee is Người nhận
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "400000" amount, "Vo Minh Son" name, "CMND" Identification type, "311858999" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người nhận" fee charged and "AUTO DESCRIPTION" description
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "CMND" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "311858999" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người nhận" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "CMND" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "311858999" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người nhận" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I get "Phí giao dịch" fee from above transaction
      And I get "Số tiền" debit amount from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      Then I verify before total amount = after total amount + debit amount + fee

    @KHDN_identity_card_transfer-03
    Scenario: I do an identity card transfer transaction successfully with identification type is Hộ chiếu and charge fee is Người chuyển
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "400000" amount, "Vo Minh Son" name, "Hộ chiếu" Identification type, "9654784145" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người chuyển" fee charged and "AUTO DESCRIPTION" description
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "Hộ chiếu" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "9654784145" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "22,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "Hộ chiếu" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "9654784145" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người chuyển" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "22,000 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I get "Phí giao dịch" fee from above transaction
      And I get "Số tiền" debit amount from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      Then I verify before total amount = after total amount + debit amount + fee

    @KHDN_identity_card_transfer-04
    Scenario: I do an identity card transfer transaction successfully with identification type is Hộ chiếu and charge fee is Người nhận
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I get amount total before doing transaction
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "400000" amount, "Vo Minh Son" name, "Hộ chiếu" Identification type, "9654784145" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người nhận" fee charged and "AUTO DESCRIPTION" description
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "Hộ chiếu" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "9654784145" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người nhận" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "400,000 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "Hộ chiếu" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "9654784145" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người nhận" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      And I get "Phí giao dịch" fee from above transaction
      And I get "Số tiền" debit amount from above transaction
      Then I approve the above transaction
      And I verify "" "Giao dịch thành công" is displayed after doing transaction successfully
      And I get amount total after doing transaction
      Then I verify before total amount = after total amount + debit amount + fee

    @KHDN_identity_card_transfer-05
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per transaction
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
      Then As KHDN, I search the limit with user "autotestduyet"
      And As KHDN, I choose "045704070000966 (CTY CP HOANG YEN) - VND" account, "autotestduyet" ID account and "HDBank OTP" authenticate method
      And I edit limit amount per transaction to "30000000" for "Chuyển tiền trong khác chủ TK"
      And I verify "" "Yêu cầu được tạo thành công. Đang trong quá trình chờ duyệt" is displayed after doing transaction successfully
      Given I open Admin page
      When I login ADMIN with "CK_001_LEDTH" and "abc123"
      Then I approve the above request
      And I verify "" "Yêu cầu được duyệt thành công." is displayed after doing transaction successfully
      Given I open IBK page
      Then As an input user, I login KHDN with "autotestnhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "045704070000966 (CTY CP HOANG YEN) - VND" with "30000001" amount, "Vo Minh Son" name, "Hộ chiếu" Identification type, "9654784145" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người nhận" fee charged and "AUTO DESCRIPTION" description
      And I verify "Tài khoản nguồn" "045704070000966 (CTY CP HOANG YEN) - VND" is displayed after doing transaction successfully
      And I verify "Số tiền" "30,000,001 VND" is displayed after doing transaction successfully
      And I verify "Tên người hưởng" "Vo Minh Son" is displayed after doing transaction successfully
      And I verify "Loại giấy tờ tùy thân" "Hộ chiếu" is displayed after doing transaction successfully
      And I verify "Số CMND/Hộ chiếu" "9654784145" is displayed after doing transaction successfully
      And I verify "Ngày cấp" "09/07/2000" is displayed after doing transaction successfully
      And I verify "Nơi cấp" "HCM" is displayed after doing transaction successfully
      And I verify "Phí tính cho bên" "Người nhận" is displayed after doing transaction successfully
      And I verify "Phí giao dịch" "0 VND" is displayed after doing transaction successfully
      And I verify "Ghi chú" "AUTO DESCRIPTION" is displayed after doing transaction successfully
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "autotestduyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I verify "" "Số tiền giao dịch 30,000,001 VND vượt quá hạn mức cho mỗi lần giao dịch" is displayed after doing transaction successfully
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

    @KHDN_identity_card_transfer-06
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per day
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
#    Dùng bộ user khác vì case này chuyển hạn mức còn lại trong ngày về 0
      Then As KHDN, I search the limit with user "kiemthu1_duyet"
      And As KHDN, I choose "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" account, "kiemthu1_duyet" ID account and "HDBank OTP" authenticate method
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
      Then As KHDN, I search the limit with user "kiemthu1_duyet"
      And As KHDN, I choose "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" account, "kiemthu1_duyet" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      Then As an input user, I login KHDN with "kiemthu1_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" with "before remaining limit total + 1" and "Vo Minh Son" name, "Hộ chiếu" Identification type, "9654784145" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người nhận" fee charged and "AUTO DESCRIPTION" description
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "kiemthu1_duyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Số tiền giao dịch" "vượt quá hạn mức cho mỗi lần giao dịch" is displayed after doing transaction successfully

    @KHDN_identity_card_transfer-07
    Scenario: I verify the transaction is not approved when transferring with amount > limit amount per day
      Given I open Admin page
      When I login ADMIN with "RM_LEDTH" and "abc123"
#    Dùng bộ user khác vì case này chuyển hạn mức còn lại trong ngày về 0
      Then As KHDN, I search the limit with user "kiemthu1_duyet"
      And As KHDN, I choose "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" account, "kiemthu1_duyet" ID account and "HDBank OTP" authenticate method
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
      Then As KHDN, I search the limit with user "kiemthu1_duyet"
      And As KHDN, I choose "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" account, "kiemthu1_duyet" ID account and "HDBank OTP" authenticate method
      And I get before transferring limit "Chuyển tiền trong khác chủ TK" with above user
      Given I open IBK page
      Then As an input user, I login KHDN with "kiemthu1_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" with "before remaining limit total" and "Vo Minh Son" name, "Hộ chiếu" Identification type, "9654784145" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người nhận" fee charged and "AUTO DESCRIPTION" description
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "kiemthu1_duyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      And I approve the above transaction
      Given I open IBK page
      Then As an input user, I login KHDN with "kiemthu1_nhap" and "abc123"
      And I do transaction with type is "TRANSFER" and "Chuyển tiền nhận trong HDBank qua CMND"
      Then I transfer from "041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND" with "1" amount, "Vo Minh Son" name, "Hộ chiếu" Identification type, "9654784145" ID/PASSPORT, "09" "07" "2000" Date of issuance, "HCM" Place of issuance, "Người nhận" fee charged and "AUTO DESCRIPTION" description
      Then I input the code to complete the transaction
      Then I verify "" "Giao dịch đã được chấp nhận và đang chờ duyệt với số bút toán" is displayed after doing transaction successfully
      Given I open IBK page
      Then As an approval user, I login KHDN with "kiemthu1_duyet" and "abc123"
      And I do transaction with type is "APPROVAL" and "Giao dịch chờ phê duyệt"
      And I search the above transaction
      Then I verify "Số tiền giao dịch" "vượt quá hạn mức giao dịch trong ngày của tài khoản 041704070000279 (CONG TY TNHH QUANG CAO LIEN KET) - VND. Hạn mức còn lại của tài khoản là: 0 VND" is displayed after doing transaction successfully
