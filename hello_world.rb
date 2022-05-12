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
#





