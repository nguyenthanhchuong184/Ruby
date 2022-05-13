#Chapter_1
#1.1 Ruby là ngôn ngữ Object-Oriented
#Bất cứ thứ gì .class đều được:
0.class #=> FixNum
0.1.class #=> Float
#bởi vì ruby là ngôn ngữ hướng đối tượng, nó được thiết kết theo mô hình object
#1.2 Blocks và vòng lặp
#Mọi thứ trong ruby đều là object ngoại trừ block. Một số method cần kết hợp với blocks:
3.times { print "Ruby! " } # Prints "Ruby! Ruby! Ruby! "
1.upto(9) { |x| print x } # Prints "123456789"
a = [1, 2, 3, 4]
a.inject do |sum, x|
  sum + x
end
#1.3 Biểu thức và toán tử
#1.4 Phương thức
def polar(x,y)
def polar x = 1, y
def polar x: 1, y: nil
#1.5 Gán
x,y, *z = [1,2,3,4]
# => [1, 2, 3, 4]
#1.6 Tiền tố , hậu tố
#global variables are prefixed with $ , instance variables are prefixed with @ , and class variables are prefixed with @@ .
#các biến toàn cục có tiền tố là $, các biến cá thể được bắt đầu bằng @ và các biến lớp được bắt đầu bằng @@.
#1.7 Regexp và Range
def are_you_sure?
  while true
    print "Are you sure? [y/n]: "
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/, /^$/
      return false
    end
  end
end
#1.8 Classes, Modules
#1.9 Hai tính năng đáng kinh ngạc.
#Ruby’s strings are mutable. Toán tử << dùng để nối chuỗi. 
#Dùng freeze để cố định 1 chuỗi. Dùng magic comment để immutable tất cả các chuỗi trong 1 file
#Có lẽ Lý do duy nhất mà ruby để cho chuỗi có thể bị thay đổi là cải thiện hiệu suất vòng lặp khi 1 chuỗi bị biến đổi liên tục
#(chắc là cái kiểu sửa đi sửa lại 1 chuỗi, sẽ không phải copy từng phần tử(character) của chuỗi đó đem copy ra object mới rồi đem gán lại cho object cũ):
2.6.5 :002 > a =  "abc"
 #=> "abc" 
2.6.5 :003 > a[0] = "b"
# => "b" 
2.6.5 :004 > a
 #=> "bbc"
 #Tuy nhiên các biến bị đột biến rất dễ gây ra lỗi, đặc biệt là khi nhiều biến cùng tham chiếu đến một đối tượng. 
 #Tác dụng phụ cảu phương thức này có thể thay đổi hành vi của một phương thức khác. 
 #Sự khó hiểu xuất hiện vì tên biến không đủ để dự đoán nội dung giá trị của bản thân nó.
 #Biểu thức điều kiện ngoài false thì Ruby nhận giá trị nil là false 
 #=> Khi kiểm tra đúng sai, chỉ có false và nil là dành cho giá trị sai. Tất cả mọi thứ còn lại đều là true (bao gồm 0, 0.0, "", và []).