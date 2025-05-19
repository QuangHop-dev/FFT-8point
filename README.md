# FPGA Implementation of 8-Point FFT

Dựa vào thuật toán tính FFT 8 điểm sau

![fft_8](https://github.com/user-attachments/assets/1e3a723d-2fa9-450e-86fa-966578e7a821)

# 1. TOP MODULE (FFT_processor)

![image](https://github.com/user-attachments/assets/ff82ec5d-6375-4099-a497-2ec8764fdd2b)

Bộ xử lý có các chân đầu vào là clk, reset và start. Bộ xử lý có hai vector đầu ra, một cho phần thực và một cho phần ảo. Độ rộng dữ liệu cố định 16 bits: 7 bits cho phần thực và 8 bits cho phần thập phân. MSB dùng cho dấu.

# 2. Tóm tắt mô tả hoạt động của toàn bộ hệ thống
Xung start tạo ra tín hiệu en1 kích hoạt ROM và cũng đi đến khối S2P để chuyển từ tuần tự sang song song. Bộ đếm 1 cung cấp địa chỉ cho ROM. Bộ đếm 1 tạo ra tín hiệu tc1 sau 8 xung clock. Tín hiệu tc1 kích hoạt một khối PG2. PG2 và bộ đếm 2 được sử dụng để theo dõi độ trễ của khối FFT. Sau độ trễ của khối FFT, tín hiệu tc2 được tạo ra, làm kích hoạt bộ PG3 và bộ đếm 3. Tín hiệu tc2 và tín hiệu en4 hoạt động như tín hiệu load và p2s trong khối P2S ở trên. Tín hiệu tc2 được đồng bộ với đầu ra đầu tiên của khối FFT.
# 3. Khối Tạo Pha (PG)
Khối PG được vẽ dưới đây. Ngõ ra q mức cao khi một xung start kích vào. Đồng thời q mức thấp khi một xung stop được kích vào.

![image](https://github.com/user-attachments/assets/6a70bada-04e3-4c25-b3ec-f7f8982a18f6)

![image](https://github.com/user-attachments/assets/f789ad65-8b0e-48ae-b8fd-9e6ee06d22b1)

Nhận xét kết quả: đã đạt được mục tiêu thiết kế như trên lý thuyết đã đề cập.
# 4. Bộ Đếm Có Thể Tải (Loadable Counter)
Chức năng: Bộ đếm có thể tải tạo ra tín hiệu Terminal Count (tc) khi đạt đến giá trị giới hạn đếm cụ thể (lmt).

![image](https://github.com/user-attachments/assets/5f52880d-fa2b-47c8-a06e-810289da13a5)

![image](https://github.com/user-attachments/assets/2a8527fa-c15e-49d0-92d4-bae03d653f2a)

Nhận xét kết quả: đã đạt được mục tiêu thiết kế

+ Bộ đếm đã thực hiện đếm với số đếm khởi tạo

+ Bộ đếm đã tạo ra tín hiệu tc khi đạt đến giá trị ví dụ lmt = 3’b100
# 5. Khối S2P (chuyển đổi từ tuần tự sang song song)
Mô tả: Khối này có 8 thanh ghi độ rộng 16 bits. Mỗi thanh ghi được điều khiển bởi một chân kích hoạt điều khiển (en2). Dữ liệu đầu vào (data_ROM) chạy đến đầu ra chỉ khi tín hiệu kích hoạt (en2) mức cao.
Chức năng: chuyển đổi dữ liệu tuần tự thành song song trong 8 chu kỳ xung

![image](https://github.com/user-attachments/assets/42d97017-2223-4d5f-a833-bcdbd8d8291e)

Nhận xét kết quả: đạt được yêu cầu thiết kế chuyển đổi chuỗi dữ liệu 16 bits dạng tuần tự sang song song trong 8 chu kì xung. Chú ý: trong testbench này chỉ có một chuỗi dữ liệu 16 bits, còn trong thiết kế có 8 chuỗi nên dạng tín hiệu đầu ra sẽ khác.
# 6. Khối ROM: cung cấp dữ liệu đầu vào cho thiết kế

![image](https://github.com/user-attachments/assets/54d6f4c1-c469-4c8a-932a-95b70d812c6b)

Nhận xét kết quả: đạt được yêu cầu thiết kế, ROM trích xuất dữ liệu đúng với các vị trí mem[0] và mem[4] như trên mảng dữ liệu mô tả.

# 7. Khối 8-point FFT

![image](https://github.com/user-attachments/assets/a3569fbb-e6a5-4b7e-8c19-e50adb452b0d)

7.1. Các Khối Con Butterfly (BF1 và BF2)

Mô tả chức năng: Khối con butterfly cơ bản thực hiện hai loại phép toán cộng và trừ. Do đó, chúng em đã thiết kế khối BF1 thực hiện phép cộng hoặc phép trừ, trong đó bộ (+/-) có tín hiệu chọn add: mức 0 thực hiện (+), mức 1 thực hiện (-). Còn khối BF2 ngoài tính toán phần real còn tính toán phần image, nhận 2 giá trị: real, image. Trả về 4 giá trị: real, real, image, -image.

![image](https://github.com/user-attachments/assets/4d901e28-e480-4677-955b-e80789b9b169)

Mô tả In/Out khối BF1:

![image](https://github.com/user-attachments/assets/5a8f912c-8227-4aa5-9bd2-f0b644d92c14)

Mô tả In/Out khối BF2:

![image](https://github.com/user-attachments/assets/9b1c3d21-68bc-4906-9b1d-efb426610ffa)

![image](https://github.com/user-attachments/assets/061c28e3-548f-40ee-b7ab-9904f3b05844)

![image](https://github.com/user-attachments/assets/312f58f5-0076-4538-9932-d1ba5a2a5c52)

![image](https://github.com/user-attachments/assets/61ca8753-9371-44e8-9eea-e3a33372d51b)

![image](https://github.com/user-attachments/assets/4c12bbcb-3604-41eb-9120-3771c972f125)

7.3. Khối Trễ (DelayBlock)

![image](https://github.com/user-attachments/assets/1ee749c9-c92a-45ba-8e94-dbb048f92738)

Chức năng: các khối trễ được thêm vào để đồng bộ hóa các hoạt động, 4 thanh ghi 16bits được kết nối tuần tự để tạo thành các khối trễ.
# 8. Khối P2S (chuyển đổi từ song song sang tuần tự)
Chức năng: chuyển đầu ra song song từ khối FFT thành dạng tuần tự do thiếu chân đầu ra hoặc nhiều hệ thống chấp nhận dữ liệu tuần tự. 
Mô tả: Sơ đồ khối P2S được hiển thị dưới cho 4 mẫu dữ liệu, đối với báo cáo là 8 mẫu. Xung load trước tiên tải các mẫu dữ liệu song song vào các thanh ghi thông qua các Mux. Sau đó, tín hiệu p2s làm cho chúng trở thành dạng tuần tự. 

![image](https://github.com/user-attachments/assets/f5ea79ff-add3-4a21-bf1d-192073d6dcbf)

# 9. Testcase mô tả hệ thống
Để kiểm tra tính đúng đắn của một bộ tính toán FFT 8 điểm, chúng em đã thực hiện đưa mẫu dữ liệu [15:0] mem [0:7] sau đây vào hệ thống

![image](https://github.com/user-attachments/assets/430041b7-c744-4383-b2a9-e76a36434abd)

# Reference
https://digitalsystemdesign.in/fpga-implementation-of-8-point-fft/?srsltid=AfmBOoqdNrs1TrYRv9OSMX85dwN1suHmjh7md2tyO7kTBEaIIRWocdlE
