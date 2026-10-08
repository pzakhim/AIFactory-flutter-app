{
  "ui_touchpoints": [
    {
      "id": "UIT-01",
      "name": "Đăng nhập",
      "actor": "Khách hàng",
      "trigger": "Mở ứng dụng hoặc chọn quay lại đăng nhập",
      "screen": "Màn hình Đăng nhập",
      "goal": "Cho phép khách hàng đăng nhập bằng tên đăng nhập hoặc mã khách hàng và mật khẩu; hỗ trợ ghi nhớ thông tin đăng nhập, đăng nhập bằng sinh trắc học và truy cập luồng quên mật khẩu.",
      "notes": "Hiển thị trường Tên đăng nhập/Mã khách hàng, trường Mật khẩu có tùy chọn hiện hoặc ẩn ký tự, tùy chọn Ghi nhớ đăng nhập, liên kết Quên mật khẩu?, nút Đăng nhập và tùy chọn Đăng nhập bằng Face ID. Khi thông tin hợp lệ và xác thực thành công, chuyển đến Trang chủ. Khi chọn Quên mật khẩu?, chuyển đến màn hình Xác thực tài khoản.",
      "related_uc_ids": [],
      "bpmn_node_id": null,
      "interaction": "form"
    },
    {
      "id": "UIT-02",
      "name": "Trang chủ sau đăng nhập",
      "actor": "Khách hàng",
      "trigger": "Đăng nhập thành công",
      "screen": "Màn hình Trang chủ",
      "goal": "Hiển thị thông tin tài khoản và các chức năng ngân hàng chính để khách hàng tiếp tục sử dụng ứng dụng sau khi đăng nhập.",
      "notes": "Hiển thị lời chào khách hàng, số dư tài khoản, thông tin tài khoản, các thao tác nhanh như Chuyển tiền, Hóa đơn và Nạp tiền, danh sách giao dịch gần đây và thanh điều hướng chính. Không hiển thị thông tin cá nhân hoặc số tài khoản mẫu cố định trong đặc tả.",
      "related_uc_ids": [],
      "bpmn_node_id": null,
      "interaction": "display"
    },
    {
      "id": "UIT-03",
      "name": "Xác thực tài khoản để khôi phục mật khẩu",
      "actor": "Khách hàng",
      "trigger": "Chọn Quên mật khẩu? trên màn hình Đăng nhập",
      "screen": "Màn hình Xác thực tài khoản",
      "goal": "Cho phép khách hàng xác nhận tài khoản và yêu cầu gửi mã OTP đến số điện thoại đã đăng ký.",
      "notes": "Hiển thị hướng dẫn xác thực, trường nhập số điện thoại đã đăng ký và nút Gửi mã OTP. Có thể hiển thị số điện thoại theo dạng che một phần để bảo vệ thông tin. Khi gửi yêu cầu thành công, chuyển đến màn hình Xác minh OTP.",
      "related_uc_ids": [],
      "bpmn_node_id": null,
      "interaction": "form"
    },
    {
      "id": "UIT-04",
      "name": "Xác minh OTP",
      "actor": "Khách hàng",
      "trigger": "Yêu cầu gửi mã OTP được chấp nhận",
      "screen": "Màn hình Xác minh OTP",
      "goal": "Cho phép khách hàng nhập và xác nhận mã OTP được gửi đến số điện thoại đã đăng ký.",
      "notes": "Hiển thị số điện thoại nhận OTP ở dạng che một phần, các ô nhập mã OTP, thời gian hiệu lực hoặc đếm ngược gửi lại mã, liên kết gửi lại OTP khi được phép và nút Xác nhận OTP. Trạng thái sai mã, hết hạn hoặc đang xử lý được hiển thị ngay trên màn hình này. Xác minh thành công thì chuyển đến màn hình Đặt mật khẩu mới.",
      "related_uc_ids": [],
      "bpmn_node_id": null,
      "interaction": "form"
    },
    {
      "id": "UIT-05",
      "name": "Đặt mật khẩu mới",
      "actor": "Khách hàng",
      "trigger": "Xác minh OTP thành công",
      "screen": "Màn hình Đặt mật khẩu mới",
      "goal": "Cho phép khách hàng tạo và xác nhận mật khẩu mới đáp ứng các yêu cầu bảo mật của ứng dụng.",
      "notes": "Hiển thị trường Mật khẩu mới và Nhập lại mật khẩu mới; cho phép hiện hoặc ẩn ký tự. Hiển thị danh sách tiêu chí mật khẩu để khách hàng kiểm tra và nút Cập nhật mật khẩu. Báo lỗi ngay trên màn hình nếu mật khẩu không đạt tiêu chí hoặc hai lần nhập không khớp. Cập nhật thành công thì chuyển đến màn hình Đổi mật khẩu thành công.",
      "related_uc_ids": [],
      "bpmn_node_id": null,
      "interaction": "form"
    },
    {
      "id": "UIT-06",
      "name": "Đổi mật khẩu thành công",
      "actor": "Ứng dụng",
      "trigger": "Mật khẩu mới được cập nhật thành công",
      "screen": "Màn hình Đổi mật khẩu thành công",
      "goal": "Thông báo khách hàng đã đổi mật khẩu thành công và hướng dẫn quay lại đăng nhập.",
      "notes": "Hiển thị biểu tượng xác nhận, thông báo đổi mật khẩu thành công, thông tin tóm tắt về lần cập nhật nếu có và nút Quay lại đăng nhập. Khi chọn nút này, chuyển về màn hình Đăng nhập. Không tự động đăng nhập bằng mật khẩu mới.",
      "related_uc_ids": [],
      "bpmn_node_id": null,
      "interaction": "display"
    }
  ]
}