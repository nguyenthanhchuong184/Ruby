# Xuất ra màn hình dòng chữ Hello World
puts "Hello World"
 
puts "Author: Tang Quoc Minh" # Xuất ra tên tác giả
 
puts "Series: Ruby căn bản" # Xuất ra tên series

=begin
Series huong dan hoc lap trinh Ruby can ban
Author: Tang Quoc Minh
Bai 1: Cach chay chuong trinh trong Ruby
=end
puts "Note"

# Đảo chuỗi
puts "Chuong".reverse
puts "Chuong".length

#Array
puts ticket = [1, 3, 2]
puts ticket.length

#Sap xep theo thu tu
puts ticket.sort

#Tim max trong array
puts ticket.max

#Lay vi tri trong mang
puts ticket[0]
puts ticket[1]
puts ticket[2]

#Thay the chuoi
puts poem = "Toi dang di xe dap, 
Toi dang da bong"
puts poem.gsub("Toi", "Ban")

#Dao nguoc chuoi
puts poem.reverse

#Di chuyển dòng cuối cùng lên đầu tiên và dòng đầu tiên xuống cuối cùng. Tập hợp thành 1 dòng
puts poem.lines.reverse
######################
puts poem = "Toi dang di xe dap, 
Toi dang da bong"

#Chia nhỏ 
puts poem.lines.reverse.join

#Chuyển chữ hoa thành chữ cái thường
puts poem.downcase

#Ngược lại chuỗi chữ thường thành hoa
puts poem.swapcase

#Hàm băm rỗng: 
#Bảng băm (Hash) còn gọi là mảng kết hợp, map, dictionary nó tương tự như mảng đã biết nhưng nó được đánh chỉ mục các phần tử.
books = {}
#Đặt tên cho nó và nhập dữ liệu
books["Gravitys Rainbow"] = :splendid
books["The deep end"]  = :abysmal
books["Living colors"] = :mediocre

puts books
#Trả về số phần tử hash
puts books.length
#Nếu muốn truy cập lại bảng băm thì:
puts books["Gravitys Rainbow"]
#Xem keys của hash
puts books.keys
#
ratings = Hash.new {0}

books.values.each { |rate|
  ratings[rate] += 1
}

puts ratings

1.class
#In x3 chuoi
3.times {print "Ruby!"}
0.0.class
# 1 upto 9
1.upto(9){|x | print x}
#Array
a = [3, 2, 1]
a[3] = a[2] - 1
a.each do |elt| #mỗi là một trình lặp. Khối có một tham số elt
print elt + 1
end
#########
a = [1,2,3,4]
#Duyet mang
puts b = a.map{|x| x*x}
#Tim so chan trong mang
puts c = a.select{|x| x%2 == 0}
#Tinh tong trong mang
a.inject do |sum, x|
  sum + x
end
#Hash
# Một hàm băm ánh xạ tên số thành chữ số
# Các "mũi tên" hiển thị ánh xạ: key => value
# Dấu hai chấm biểu thị các ký tự Biểu tượng
 h = {
  :one => 1,
  :two => 2
}
puts h[:one] #=> Truy cập các giá trị bằng key
h[:three] = 3
puts h[:three]
#Lap lai va ghi chu cac bien dc thay the bang chuoi
h.each do |key, value|
  print "#{value}:#{key}; "
end
#
File.open("data.txt") do |f|    # Mở tệp đã đặt tên và chuyển luồng để chặn
  line = f.readline             # Sử dụng luồng để đọc từ tệp
end                             # Luồng tự động bị đóng khi kết thúc khối
#
t = Thread.new do                     # Chạy khối này trong một chuỗi mới
  File.read ("data.txt")                    # Đọc tệp trong nền
end                     # Nội dung tệp có sẵn dưới dạng giá trị chuỗi
# Biến ghi chú được thay thế thành chuỗi
print "# {value}: # {key};"
#Toan tu
puts 1 + 2
puts 1 * 2
puts 1+2==3 #Kiem tra tinh dung sai
puts 2**1024 # 2 luy thua 1024
puts "Ruby" + " rocks!" #Noi chuoi
puts "Ruby!" * 3 #Nhan chuoi
puts "%d %s" % [3, "rubies"] #=> "3 rubies" Dinh dang kieu python
puts max = x > y ? x : y
#Các phương thức được định nghĩa với từ khóa def . 
#Giá trị trả về của một phương thức là giá trị của biểu thức cuối cùng được đánh giá trong nội dung của nó:
def square(x)
  x*x
end
#
def Math.square (x) # Xác định phương thức lớp của mô-đun Toán học
  x * x
end
#(nonoverridable) = trong Ruby gán giá trị cho một biến:
x = 1
#Phép gán có thể được kết hợp với các toán tử khác như + và -:
x + = # Tăng dần x: lưu ý Ruby không có ++.
1 y - = 1 # Giảm thiểu y: không - toán tử.
#Ruby hỗ trợ gán song song, cho phép nhiều hơn một giá trị và nhiều biến trong các biểu thức gán:
x, y = 1, 2 # Tương tự như x = 1; y = 2
a, b = b, a # Hoán đổi giá trị của hai biến x, y, z
puts x,y,z = [1,2,3] # Phần tử mảng được gán tự động cho các biến
# Xác định phương pháp chuyển đổi tọa độ Descartes (x, y) thành Polar def polar
def polar(x,y)
  theta = Math.atan2(y,x) # Tính góc r = Math.hypot (x, y) [r, theta ] chấm dứt
  # Tính khoảng cách
  r = Math.hypot(x,y)
  # Compute the distance
  [r, theta]
  # Biểu thức cuối cùng là giá trị trả về
  end
  # Đây là cách chúng tôi sử dụng phương pháp này với khoảng cách gán
  distance, angle = polar(2,2)
#
ox = (1) # Cú pháp gọi phương thức bình thường
ox = 1 # Lời gọi phương thức thông qua phép gán
#Matches "Ruby" or "ruby"
/[Rr]uby/ 
# Đối sánh 5 ch số liên tiếp
/\d{5}/ 
#All x where 1 <= x <= 3
1..3
#All x where 1 <= x < 3
1...3
# Xác định tên thế hệ Hoa Kỳ dựa trên năm sinh
# Kiểm tra biểu thức chữ hoa thường có phạm vi ===
generation = case birthyear
                  when 1946..1963: "Baby Boomer"
                  when 1964..1976: "Generation X"
                  when 1978..2000: "Generation Y"
                  else nil
                  end

#Phuong phap yeu cau nguoi dung xac nhan dieu gi do
def are_you_sure?                     # Xác định một phương pháp. Dấu chấm hỏi lưu ý!
  while true                            # Loop cho đến khi chúng tôi trả về một cách rõ ràng
    print "Are you sure? [y/n]: "         # Hỏi người dùng một câu hỏi
    response = gets                       # Nhận câu trả lời của cô ấy
    case response                         # Bắt đầu viết hoa có điều kiện  
    when /^[yY]/                          # Nếu phản hồi bắt đầu bằng y hoặc Y
      return true                         #Trả về true từ phương thức
    when /^[nN]/, /^$/                    # Nếu phản hồi bắt đầu bằng n, N hoặc trống
      return false                    # Return false
    end
  end
end
#Đoạn mã sau định nghĩa một lớp phong phú có tên là Sequence 
#và giải thích cách viết các phương thức của trình vòng lặp và xác định toán tử:
#
# Lớp này đại diện cho một dãy số được đặc trưng bởi ba tham số from, to và by. Các số x trong dãy tuân theo sau hai ràng buộc:
from <= x <= to
x = from + n*by, where n is an integer
class Sequence
  # Đây là một lớp có thể liệt kê được; nó xác định mỗi trình lặp bên dưới.
  include Enumerable # Bao gồm các phương thức của mô-đun này trong lớp này
  #
  class Phạm vi # Mở một lớp hiện có để bổ sung
    def by (step) x  # Xác định một trình lặp được đặt tên bởi
      = self.begin # Bắt đầu tại một điểm cuối của dải ô
    iflude_end? trong # Đối với ... phạm vi loại trừ phần cuối
    while x < self.end # Kiểm tra với toán tử <
      yield x
    x + = step
    end
  else # Nếu không, đối với .. phạm vi bao gồm phần cuối
    while x <= self.end # Kiểm tra với toán tử <=
    yield x
    x + = step
    end
    end
  end # Kết thúc định nghĩa phương pháp
  end # Kết thúc sửa đổi lớp học
# Prints "13579"
Sequences.fromtoby(1, 10, 2) {|x| print x }
# Examples
(0..10).by(2) {|x| print x} # Prints "0246810"
(0...10).by(2) {|x| print x} # Prints "02468"
 #########
 9.downto(1){|n| print n} 
 puts " blastoff!"   
    