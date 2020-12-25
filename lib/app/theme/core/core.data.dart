mixin CoreData {
  //text + widget + label/placeholder/hint/

  //Search widget
  static String textSearchPlaceHolder = "Từ khoá sản phẩm...";
  static String textStoreSearchPlaceHolder = "Tìm kiếm cửa hàng...";
  static String textAddressSearchPlaceHolder = "Tìm kiếm địa chỉ đã lưu...";
  static String imageSearchNotFound = "./assets/images/img_not_found.png";
  static String textSearchNotFound(String strSearch) {
    return "Không tìm thấy kết quả của \"$strSearch\"";
  }

  static String textAddToCartSuccessButton = "Tiếp tục mua hàng";

  static String textSearchSuggestHint =
      "Bạn hãy thử sử dụng các từ khóa chung chung hơn.";
  static String textSearchCancelLabel = "Hủy";
  static String textSearchHistoryLabel = "Lịch sử tìm kiếm";
  static String textSearchClearHistoryLabel = "Xóa lịch sử tìm kiếm";
  static String textSearchHotKeywordLabel = "Từ khóa hot";
  static String textSearchOrderLabel = "Kiểm tra đơn hàng";
  static String textSearchOrderDescription =
      "Kiểm tra tình trạng đơn hàng của bạn bằng cách nhập số điện thoại đã đặt đơn dưới đây:";
  static String textSearchOrderButton = "Tra cứu";
  static String textSearchSuggestLabel = "Có thể bạn quan tâm?";
  // 'Không tìm thấy sản phẩm nào!'
  static String textSearchWithCollectionTitlePlaceHolder(
      String titleCollection) {
    return "Tìm kiếm trong $titleCollection...";
  }

  static String textSearchResult(int counts, String keywords) {
    return "Có ${counts.toString()} kết quả tìm kiếm của $keywords";
  }

  static String textSearchResultTitle = "Kết quả tìm kiếm";

  // Scan barcode
  static String textScanBarcodeNotPermission =
      "Ứng dụng chưa được cấp quyền sử dụng camera!";
  static String textScanBarcodeReScanNotAllow =
      "Bạn đã ấn nút quay lại khi chưa quét xong.";
  static String textScanBarcodeAlertTitle = "Quét mã sản phẩm";

  //scan offline
  static String textScanSucceed = "Tích luỹ thành công";
  static String textScanFailed = "Tích luỹ thất bại";

  //Home widget:
  // nothing
  static String textHomeCollectionNoData = "Chưa có sản phẩm nào.";
  static String textHomeBlogNoData = "Chưa có bài viết nào.";
  static String textHomeModuleTitle = "Chưa có";
  static String textHomeCollectionItemTitle = "Chưa có";
  // default
  static String textHomeListCollectionTitle = "Danh mục sản phẩm";

  //auth
  static String textWrongEmailPassword = "Email hoặc mật khẩu không đúng";
  static String textEmailUsed =
      'Email của bạn đã được sử dụng bằng phương thức đăng nhập khác.';
  static String textUnknowError =
      "Lỗi không xác định, xin vui lòng thử lại sau";
  static String textEmailExist = "Email này đã được sử dụng";
  static String textValidatorError = "Lỗi xác nhận";
  static String textEmailIsRequired = "Vui lòng nhập email của bạn";
  static String textEmailPlaceholder = "Nhập email của bạn";
  static String textEmailWrongFormat = "Email không hợp lệ";
  static String textPasswordIsRequired = "Password không được bỏ trống";
  static String textPasswordPlaceholder = "Nhập mật khẩu của bạn";
  static String textPasswordCondition = "Mật khẩu phải từ 8 kí tự trở lên";
  static String textNameIsRequired = "Vui lòng nhập tên của bạn";
  static String textNamePlaceholder = "Nhập tên của bạn";
  static String textPhoneIsRequired = "Vui lòng nhập số điện thoại của bạn";
  static String textVerifyCodeIsRequired =
      "Vui lòng nhập mã xác thực được gửi đến điện thoại của bạn";
  static String textVerifyCodeIsExpired = "Mã xác thực hết hiệu lực.";
  static String textVerifyCodeWrongFormat = "Mã xác thực không hợp lệ.";
  static String textPhonePlaceholder = "Nhập số điện thoại của bạn";
  static String textPhoneWrongFormat = "Số điện thoại không hợp lệ";
  static String textRePasswordCondition = "Mật khẩu không khớp nhau";

  // reset pwd
  static String textResetPasswordTitle = "Đặt lại mật khẩu";
  static String textResetPasswordButton = "Gửi email";
  static String textResetPasswordSuccess =
      "Yêu cầu đặt lại mật khẩu đã được gửi đến email của bạn. Vui lòng kiểm tra mail.";
  static String textResetPasswordFailed = "Email không tồn tại.";

  //server
  static String textServerMaintaince = "Server đang tiến hành bảo trì!";

  //Product Item widget: nothing
  static String textProductItemNoDataLabel = "Chưa có";

  //button
  static String textCloseButton = "Đóng";
  static String textDeleteButton = "Xoá";
  static String textCancelButton = "Hủy";
  static String textDoneButton = "Xong";
  static String textRetryButton = "Thử lại";
  //Product Detail
  static String textProductSeen = "Sản phẩm đã xem";
  static String textProductSeenNoData = "Bạn chưa xem sản phẩm nào.";
  static String textProductRelated = "Sản phẩm liên quan";
  static String textProductNoDescription = "Chưa có mô tả cho sản phẩm";
  static String textProductNotFound = "Sản phẩm không tồn tại!";
  static String textDescriptionLabel = "Mô tả sản phẩm";
  static String textDescriptionViewMoreLabel = "Xem thêm";
  static String textPriceLabel = "Giá";
  static String textComparePriceLabel = "Giá gốc";
  static String textAddToCartAlertTitle = "Thêm sản phẩm";
  static String textAddToCartSuccessDescription =
      "Đã thêm vào giỏ hàng thành công sản phẩm";
  static String textButtonAddToCart = "Thêm vào giỏ hàng";
  static String textSoldOut = "Hết hàng";
  static String textButtonCheckoutNow = "Thanh toán ngay";
  static String textAddToCartFailedDescription = "Thất bại";
  static String textAddToCartFailedSoldOut = "Sản phẩm này đã hết hàng.";
  static String textAddToCartSelectedVariantEmpty =
      "Vui lòng chọn một phiên bản sản phẩm.";
  static String textProductAddReview = "Viết nhận xét";
  static String textProductReviewSectionLabel = "Khách hàng nhận xét";
  static String textReviewsNoData = "Chưa có nhận xét nào.";
  static String textReviewsNoImage = "assets/images/review_empty.png";
  static String textReviewAlreadyExists =
      "Bạn đã nhận xét cho sản phẩm này rồi!";
  static String textReviewPopupTitle = "Nhận xét";

  // Popup review widget
  static String textPopupReviewTitle = "Viết nhận xét";
  static String textPopupCommentReviewTitle = "Trả lời";
  static String textPopupReviewAddImage =
      "Thêm hình ảnh sản phẩm thực tế nếu bạn muốn.";
  static String textPopupReviewTitlePlaceHolder = "Nhập tiêu đề";
  static String textPopupReviewContentPlaceHolder =
      // "Nhập nội dung nhận xét của bạn.\n(Tối thiểu 50 ký tự, tối đa 4000 ký tự)";
      "Nhập nội dung nhận xét của bạn.\n(tối đa 4000 ký tự)";
  static String textPopupCommentReviewContentPlaceHolder =
      "Nhập nội dung trả lời của bạn.\n(tối đa 4000 ký tự)";
  static String textPopupReviewCreateButtonLabel = "Gửi";
  static String textPopupReviewUpdateButtonLabel = "Sửa";
  static String textPopupReviewAlertTitle = "Viết nhận xét";
  static String textPopupReviewRateMissed = "Vui lòng chọn số sao đánh giá!";
  static String textReviewConfirm = "Đã được duyệt";
  static String textReviewPending = "Đang chờ duyệt";
  static String textReviewUploadImageTitle = "Tải lên hình ảnh";
  static String textReviewUploadImageFailedDescriptionLabel =
      "Tải ảnh lên thất bại.";
  static String textUploadImageSizeTooLarge =
      "Không thành công! Vui lòng sử dụng hình ảnh có dung lượng nhỏ hơn 5Mb.";
  static String textReviewRemoveImageTitle = "Xóa hình ảnh";
  static String textReviewRemoveImageDescription =
      "Bạn có chắc muốn xóa hình ảnh này không?";
  static String textCartHasSoldOutItemTitle = "Thanh toán";
  static String textCartHasSoldOutItemDescription =
      "Vui lòng loại bỏ các sản phẩm hết hàng khỏi giỏ để tiến hành thanh toán.";

  // My review widget
  static String textMyReviewTitle = "Nhận xét của tôi";
  static String textMyReviewTabProductLabel = "Sản phẩm";
  static String textMyReviewTabOrderLabel = "Đơn hàng";

  // Coupons widget
  static String textMyCouponsTitle = "Vouchers của tôi";
  static String textMyCouponsEmpty = "Chưa có vouchers nào.";
  static String textMyCouponsNoImage = "assets/images/voucher_empty.png";
  static String textCopiedSuccess = "Đã copy!";

  //Blog widget
  static String textBlogTitleLabel = "Tin tức";
  static String textBlogItemNoTitle = "Tiêu đề bài viết";
  static String textBlogNodata = "Chưa có";

  //Filter widget
  static String textFilterTitleLabel = "Bộ lọc tìm kiếm";
  static String textFilterPriceLabel = "Khoảng giá";
  static String textFilterPriceAllLabel = "Tất cả";
  static String textFilterPriceMaxLabel = "Lớn hơn ";
  static String textFilterMinRangeLabel = "Tối thiểu";
  static String textFilterMaxRangeLabel = "Tối đa";
  static String textFilterVendorLabel = "Thương hiệu";
  static String textFilterTypeLabel = "Loại sản phẩm";
  static String textFilterCertifyLabel = "Chứng nhận";

  // Sort cupertino
  static String textSortDefaltLabel = "Sắp xếp";

  //Cart widget
  static String textCartBtnCheckout = "Tiến hành đặt hàng";
  static String textCartHeaderTitle = "Giỏ hàng của tôi";
  static String textCartTotalLabel = "Tạm tính:";
  static String textCartNoData = "Chưa có sản phẩm nào.";
  static String imageCartEmpty = "./assets/images/cart_empty.png";
  static String textCartTotalEmptyLabel = "0đ";
  static String textCartRemoveItemTitle = "Xóa sản phẩm";
  static String textCartRemoveItemDescription =
      "Bạn có chắc muốn xóa sản phẩm này không?";
  static String textCartNoteHeaderTitle = "Ghi chú";
  static String textCartNoteInputPlaceHolder =
      "Nhập ghi chú của bạn (Tối đa 4000 ký tự)";
  static String textCartPromotionTitle = "Khuyến mãi";
  static String textCartPromotionInputPlaceHolder = "Nhập mã khuyến mãi";
  static String textCartPromotionBtnSubmit = "Áp dụng";

  // Checkout widget
  static String textCheckoutHeaderTitle = "Thanh toán";
  static String textCheckoutDeliveryTabLabel = "Giao hàng";
  static String textCheckoutPickupTabLabel = "Tự đến lấy";
  static String textCouponTypeDescriptionTitle = "Hình thức";
  static String textCouponTypeDescriptionOption1Title =
      "Không sử dụng chung với chương trình khuyến mãi.";
  static String textCouponTypeDescriptionOption2Title =
      "Sử dụng chung với chương trình khuyến mãi.";
  static String textCheckoutFulFillmentTitle = "Hình thức";
  static String textCheckoutFulFillmentMethod1Title = "Giao hàng tiết kiệm";
  static String textCheckoutFulFillmentMethod2Title = "Hình thức giao hàng 2";
  static String textCheckoutFinancialLabel = "Hình thức thanh toán";
  static String textCheckoutFinancialCODLabel =
      "Thanh toán khi nhận hàng (COD)";
  static String textCheckoutFinancialVnpayLabel = "Cổng thanh toán Vnpay";
  static String textCheckoutFinancialBankingLabel = "Chuyền khoản ngân hàng";
  static String textCheckoutFinancialCODSubLabel = "Thanh toán COD";
  static String textCheckoutFinancialVnpaySubLabel = "Thanh toán Vnpay";
  static String textCheckoutFinancialBankingSubLabel = "Chuyền khoản ngân hàng";
  static String textCheckoutNoteSectionTitle = "Thêm ghi chú";
  static String textCheckoutAmountTitle = "Tổng tiền phải trả";
  static String textCheckoutButtonLabel = "Thanh toán";
  static String textShippingAddressTitle = "Địa chỉ giao hàng";
  static String textSelectLocationTitle = "Chọn vị trí";
  static String textShippingAddressEmpty = "Chưa chọn địa chỉ giao hàng";
  static String textSelectSavedAddress = "Chọn địa chỉ đã lưu";
  static String textHaveAccountTitle = "Đã có tài khoản?";
  static String textRecommendLoginAction = "Đăng nhập";
  static String textCurrentLocationTitle = "Vị trí hiện tại của tôi";
  static String textSelectOnMapTitle = "Chọn vị trí trên bản đồ";
  static String textGeolocationPermissionTitle = "Truy cập vị trí";
  static String textGeolocationPermissionMessage =
      "Ứng dụng cần truy cập địa chỉ thiết bị để tìm cửa hàng gần nhất. Vui lòng vào cài đặt của thiết bị để cấp quyền cho ứng dụng.";
  static String textGeolocationPermissionSettingButton = "Cài đặt";
  static String textFirstnameShippingAddressPlaceholder = "Họ người nhận";
  static String textLastnameShippingAddressPlaceholder = "Tênngười nhận";
  static String textPhoneNumberShippingAddressPlaceholder =
      "Số điện thoại người nhận";
  static String textCheckoutAlertTitle = "Thông báo";
  static String textSelectedStoreValidator = "Vui lòng chọn cửa hàng!";
  static String textLocationShippingAddressValidator =
      "Chưa chọn địa chỉ giao hàng hoặc địa chỉ giao hàng không chính xác.";
  static String textRecieverInformationValidator =
      "Vui lòng nhập đầy đủ họ tên và số điện thoại của người nhận.";
  static String textPhoneNumberRecieverInformationValidator =
      "Số điện thoại không hợp lệ.";
  static String textAgreeWithPolicyValidator =
      "Vui lòng tích chọn đồng ý với những thoả thuận thanh toán của cửa hàng.";
  static String textCheckoutSuccessTitle = "Đặt hàng thành công";
  static String textCheckoutSuccessMessage =
      "Cảm ơn bạn đã mua hàng, mọi thông tin chi tiết về đơn hàng bạn có thể theo dõi tại ứng dụng này!";
  static String textCheckoutSuccessNameOrderLabel = "Mã đơn hàng: ";
  static String textCheckoutSuccessGoToOrderDetailButton =
      "Đi tới đơn hàng của tôi";

  // Account widget
  static String textAccountRewardPointsLabel = "Điểm tích luỹ";
  static String textAccountMemberRankLabel = "Hạng thành viên";
  static String textAccountTotalSpent = "Đã chi tiêu";
  static String textAccountTotalAccumulatedPoint = "Tích luỹ hiện tại";
  static String textAccountValueDefault = "Chưa xếp hạng";
  static String textAccountPhoneNumberNotFound = "Chưa có số điện thoại";
  static String textAccountButtonLogoutLabel = "Đăng xuất";
  static String textAccountAlertLogoutTitleLabel = "Đăng xuất";
  static String textAccountAlertLogoutDescriptionLabel =
      "Bạn có chắc muốn đăng xuất không?";

  // Profile widget
  static String textProfileDobDefault = "Chọn ngày sinh";
  static String textProfileUpdateTitle = "Cập nhật thông tin";
  static String textProfileUpdateSuccess = "Thành công";
  static String textProfileSaveButton = "Lưu thay đổi";

  // Order widget
  static String textOrderListTitle = "Đơn hàng của tôi";
  static String textOrderResultsByPhoneTitle(String phoneNumber) {
    return "Kiểm tra đơn hàng của $phoneNumber";
  }

  static String textOrderDetailTitle(String orderName) {
    return orderName != null ? "Đơn hàng $orderName" : "Chi tiết đơn hàng";
  }

  static String textOrderListEmpty = "Bạn chưa có đơn hàng nào.";
  static String imageOrderListEmpty = "assets/images/order_empty.png";
  static String textOrderNotAllowViewDetailTitle = "Bảo mật";
  static String textOrderNotAllowViewDetailDescription =
      "Vì lý do bảo mật nên bạn không thể xem thông tin đơn hàng này.";
  static String textOrderNoDataLabel = "Chưa có";
  static String textOrderUnknowLabel = "—";
  static String textOrderItemNoDataLabel = "Không có sản phẩm nào.";

  static String textOrderTabPendingLabel = "Đang xử lý";
  static String textOrderTabCompleteLabel = "Hoàn tất";
  static String textOrderTabCancelLabel = "Huỷ";

  static String textOrderPendingStatusLabel = "Đang xử lý";
  static String textOrderConfirmedStatusLabel = "Đã xác nhận";
  static String textOrderCancelStatusLabel = "Đã hủy";
  static String textOrderCancelReasonLabel = "Lí do: ";
  static String textOrderCreateAtLabel = "Ngày đặt đơn:";
  static String textOrderSuccessStatusLabel = "Hoàn tất";
  static String textOrderFinancialSuccessStatusLabel =
      "Xác nhận thanh toán thành công";
  static String textOrderFinancialMethodCODLabel =
      "Thanh toán khi giao hàng (COD)";
  static String textOrderFulfillmentPendingStatusLabel = "Đang giao hàng";
  static String textOrderFinancialPendingStatusLabel = "Đang chờ xử lý";
  static String textOrderFulfillmentSuccessStatusLabel = "Giao hàng thành công";
  static String textOrderStatusPrefixLabel = "Tình trạng:";

  static String textOrderProvisionPriceLabel = "Tạm tính";
  static String textOrderShippingFeeLabel = "Phí vận chuyển";
  static String textCheckoutProvisionTotalLabel = "Tổng tiền";
  static String textOrderShippingFeeFreeLabel = "Miễn phí";
  static String textOrderDiscountLabel = "Khuyến mãi";
  static String textOrderPointPaymentLabel = "Thanh toán bằng điểm tích luỹ";
  static String textOrderAmountPaidLabel = "Tổng cộng";
  static String textOrderAccumlatedPointLabel =
      "Điểm tích luỹ được từ đơn hàng";

  static String textOrderFinancialLabel = "Phương thức thanh toán";
  static String textOrderFulfillmentLabel = "Phương thức vận chuyển";
  static String textOrderFulfillmentNoteLabel =
      "Miễn phí vận chuyển toàn quốc đơn hàng > 500k";
  static String textOrderCODMethodLabel = "Giao hàng tận nơi";
  static String textOrderVnpayMethodLabel = "Thanh toán qua VNPay";
  static String textOrderListProductTitle = "Thông tin đơn hàng";
  static String textOrderShippingInforTitle = "Thông tin người nhận";

  // Address widget
  static String textAddressListTitle = "Sổ địa chỉ";
  static String textAddressNoData = "Chưa có địa chỉ nào được lưu.";
  static String textAddressNoImage = "assets/images/address_empty.png";
  static String textAddressAddTooltip = "Thêm địa chỉ";
  static String textAddressFieldNoData = "Chưa có";
  static String textAddressDefaultLabel = "Địa chỉ mặc định";
  static String textAddressRemoveAlertTitle = "Xóa địa chỉ";
  static String textAddressRemoveAlertDescription =
      "Bạn có chắc muốn xóa địa chỉ này không?";
  static String textAddressAddTitle = "Thêm địa chỉ";
  static String textAddressEditTitle = "Sửa địa chỉ";
  static String textAddressButtonSave = "Lưu";
  static String textAddressButtonRemove = "Xóa địa chỉ";
  static String textAddressSelectCityDefault = "Chọn Tỉnh / Thành phố";
  static String textAddressSelectDistrictDefault = "Chọn Quận / Huyện";
  static String textAddressAlertCreateTitle = "Tạo mới địa chỉ";
  static String textAddressAlertCreateSuccessDescription = "Thành công!";
  static String textAddressAlertCreateFailedDescription = "Thất bại!";
  static String textAddressValidator =
      "Thông tin chưa đầy đủ hoặc không chính xác. Vui lòng kiểm tra lại.";
  static String textAddressAlertEditTitle = "Sửa địa chỉ";
  static String textAddressAlertEditSuccessDescription = "Thành công!";
  static String textAddressAlertEditFailedDescription = "Thất bại!";

  // Notification widget
  static String textNotificationListTitle = "Thông báo";
  static String textNotificationlistNoData = "Chưa có thông báo nào.";
  static String textNotificationlistNoImage = "assets/images/noti_empty.png";
  static String textNotificationButtonMarkAll = "Đánh dấu tất cả";
  static String textNotificationTabBroadcast = "Tin tức";
  static String textNotificationTabSelf = "Của tôi";
  static String textNotificationAlertMarkAllTitle = "Đánh dấu đã đọc";
  static String textNotificationAlertMarkAllDescription =
      "Bạn có chắc muốn đánh dấu tất cả đã đọc?";

  // Wishlist widget
  static String textWishlistTitle = "Sản phẩm yêu thích";
  static String textWishlistNoData = "Chưa có sản phẩm yêu thích nào.";
  static String textWishlistNoImage = "assets/images/wishlist_empty.png";

  // Quest widget
  static String textQuestTitle = "Nhiệm vụ của tôi";
  static String textQuestNoImage = 'assets/images/quest_empty.png';
  static String textQuestNoData = "Hiện tại chưa có nhiệm vụ nào.";
  static String textQuestFirstType = "Đăng ký thành viên trên ứng dụng";
  static String textQuestSecondType = "Phát sinh đơn hàng đầu tiên";
  static String textQuestThirdType(String rankName) {
    return "Thăng hạng $rankName";
  }

  static String textQuestCompletedLabel = "Đã hoàn thành";
  static String textQuestPendingLabel = "Chưa hoàn thành";

  //general
  static String textViewAll = "Xem tất cả";
  static String textViewAllComments = "Xem đầy đủ";
  static String textViewLessComments = "Ẩn bớt";
  static String textUnitLabel = "sản phẩm";
  static String textEmptyMenuDrawer = "Shop chưa thiết lập menu.";
  static String imageLinkDefault =
      "https://theme.hstatic.net/1000187248/1000517948/14/intro.png?v=114";
  // No image
  static String imageNoPicture = "./assets/images/no_image.png";
  static String imageSoldOut = "./assets/images/soldout.png";
  static String imageNoImageNetwork =
      "https://theme.hstatic.net/1000187248/1000275350/14/logo.png?v=5421";
  static String textNoData = "Chưa có";
  static String textUnAuthentication = "Phiên đăng nhập hết hạn.";
  // update
  static String textUpdateAppTitle = "Cập nhật mới";
  static String textUpdateAppDescription = "Ứng dụng đã có bản cập nhật mới!";
  static String textUpdateAppButton = "Cập nhật";

  //network
  static String textNetworkNotConnectedTitle = "Không có kết nối mạng!";
  static String textNetworkNotConnectedDescription =
      "Để sử dụng ứng dụng, bạn cần kết nối\nmạng. Vui lòng kết nối wifi\nhoặc 3G/4G của bạn!";

  static String textAddWishlistAlertTitle = "Thêm sản phẩm yêu thích";
  static String textRemoveWishlistAlertTitle = "Xóa sản phẩm yêu thích";
  static String textAddWishlistSuccessDescription = "Thành công!";
  static String textAddWishlistFailedDescription = "Thất bại!";
  static String textNeedLoginTitle = "Thông báo";
  static String textNeedLoginDescription =
      "Bạn cần đăng nhập để thực hiện chức năng này.";
  static String textNeedLoginButton = "Đăng nhập";

  // Sort widget
  static Map<String, dynamic> listSort = {
    "sort": [
      {'label': 'Mặc định', 'value': 'manual'},
      {'label': 'Bán chạy', 'value': 'best-selling'},
      {'label': 'Giá tăng dần', 'value': 'price-ascending'},
      {'label': 'Giá giảm dần', 'value': 'price-descending'},
      {'label': 'Mới nhất', 'value': 'created-descending'},
      {'label': 'Cũ nhất', 'value': 'created-ascending'},
      {'label': 'Từ A-Z', 'value': 'title-ascending'},
      {'label': 'Từ Z-A', 'value': 'title-descending'}
    ]
  };

  //Filter widget
  static String textFilterTitleDefaultLabel = "Bộ lọc";
  static String textFilterButtonAccept = "Áp dụng";
  static String textFilterButtonRemove = "Bỏ lọc";

  static String textNoDataLabel = "Chưa có";
}
