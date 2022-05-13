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
 #Chương 2. Cấu trúc ngôn ngữ, chương trình Ruby
#2.1 Cấu trúc từ vựng
#2.1.1 Bình luận
# bình luận vào đây
# hoặc
=begin Someone needs to fix the broken code below!
Any code here is commented out
...
=end
#2.1.3 Dấu câu
#Dấu câu có thể dùng để làm toán từ +, -, *, /. 
#Phân tách chuỗi, Biểu thức chính quy, array, hash. Nhóm và tách các biểu thức, các tham số của phương thức, và chỉ mục aray indexes.
#2.1.4 Định danh
#Để đặt tên cho variables, methods, classes ...
#Định danh bao gồm ký tự, số, gạch dưới _, Nhưng không bắt đầu bằng chữ số, Không bao gồm dấu cách, ký tự không in ra màn hình được.
#Định danh được viết hoa Chữ cái đầu là hằng số (thường để đặt tên class hay module), nếu thay đổi giá trị sẽ được trình tương tác cảnh báo, không phải lỗi =)), irb:
2.6.5 :001 > Abc = 1
 #=> 1 
2.6.5 :002 > Abc = 2
(irb):2: #warning: already initialized constant Abc
(irb):1: #warning: previous definition of Abc was here
# => 2 
#Còn hằng số được viết hoa toàn bộ HANG_SO = 1
#Nhạy cảm: ruby phân biệt hoa thường => từ khóa end - không phải từ khóa END
#bắt đầu bằng $ => dùng khai báo global variable
# @ instance variable
# @@ class variable
# ? đơn giản là việc áp dụng coding convention, mang ý nghĩa reutrn True hoặc False
# ! mang ý nghĩa thận trọng vì ngoài giá trị trả vệ nó còn thay đổi chính nội tại của đối tượng (nhưng ko phải tất cả, vd: exit! sẽ dừng chương tình ngay lập tức)
# = gán giá trị
#2.1.5 Bộ các Keywords của ruby
__LINE__  __ENCODING__  __FILE__  BEGIN END  alias defined? begin
    class module super  def yield  return  rescue  retry ensure redo
    self  in  undef
    unless  if  elsif else end
    then  do  and or not  true  false nil
    for case while  when  until break  next
#2.1.6 Dấu khoảng trắng
#Dấu space, tab, một dòng trắng đều mang ý nghiã token thông báo.
#2.2 Cấu trúc cú pháp
#về khởi tạo cấu trúc dữ liệu cơ bản: mảng, hash và range:
[1,2,3]
{1=>"one", 2=>"two"}
1..3
#Biểu thức gốc: số, biến, gán, gán kết hợp 2 toán tử
1
x
x = 1
x = x + 1
#Biểu thức điều kiện:
x = 5
if x < 10 then
  puts x = x + 1
end
#
while x < 10 do
    print x
    x = x + 1
    end
#2.2.1 Cấu trúc Block trong Ruby
#Block là một khối code được liên kết với một method lặp.
3.times { print "Ruby! " }
1.upto(10) do |x|
  print x
end
#2.3 Cấu trúc của 1 File ruby
#“shebang” comment nói cho trình biên dịch biết chương trình hoạt động trên hệ thống như thế nào
#Nếu chương trình ruby phải mã hóa để đọc được thì comment ở dòng thứ 2 (nếu có dòng đầu tiên)
#__END__ trình thông dịch sẽ dừng đọc code tại đây, ký tự phía sau có thể dùng làm I/O program data
#Tải mã từ một file khác bằng require
#!/usr/bin/ruby -w                                    shebang comment
# -*- coding: utf-8 -*-                               coding comment
require 'socket'                                      load networking library
... program code goes here
__END__
... mark end of code
program data goes here
#2.4 Mã hóa chương trình
# coding: utf-8 # -*- coding: utf-8 -*- # vi: set fileencoding=utf-8 : kết quả là dạng:
#!/usr/bin/ruby -w
# coding: utf-8
#2.5 Thực thi chương trình
#Trình thông dịch => Đọc file, Thực thi các class được định nghĩa, sau đó chạy bất cứ dòng nào sau viết sau cái gọi là BEGIN. Chỉ dừng lại khi gặp 1 trong 3 trường hợp:
#Gặp câu lệnh khiến cho chương trình ruby dừng lại.
#gặp kết thúc file
#đọc dòng đánh dấu logical phần cuối của file với cái token __END__
#Chương 3. Kiểu dữ liệu và các đối tượng cơ sở trong ruby
#3.1 Number
#Ruby có 5 built-in class để đại diện cho kiểu dữ liệu số: Integer, Float, Complex, BigDecimal, Rational
#Số có giá trị trong khoảng 31 bits thì là FixNum, còn không thì là BigNum. BigNum là kết quả của một phép tính trên các toán hạng (kết quả có giá trị không vừa với FixNum).
#Các lớp Số phức, số thực dấu phẩy động và số hữu tỉ không được tích hợp sẵn cho Ruby mà được phân phối với Ruby như một phần của thư viện chuẩn.
#3.2 String
#irb:
2.6.5 :053 > puts "ruby giải thích dấu \\ ở cuối rằng dòng này bỏ qua \"ký tự xuống dòng\" "\
2.6.5 :054 >   "nên sẽ đọc tiếp cả dòng này mới hoàn thành một lệnh statements"
#ruby giải thích dấu \ ở cuối rằng dòng này bỏ qua "ký tự xuống dòng" nên sẽ đọc tiếp cả dòng này mới hoàn thành một lệnh statements
 #=> nil 
#Chú ý sự khác nhau giữa chuỗi có sử dụng nháy đơn ' và nháy kép ": chuỗi nội suy chỉ truyền giá trị vào được khi dùng nháy kép.
2.6.5 :062 > a = 1
 => 1 
2.6.5 :063 > puts "a = #{a}"
a = 1
# => nil 
2.6.5 :064 > puts 'a = #{a}'
a = #{a}
 #=> nil 
#Sử dụng Unicode escapes để dùng các ký tự khác của bảng mã ASCII.
2.6.5 :119 > "\u{A5}"
 => "¥" 
2.6.5 :120 > "\u{3C0}"
 => "π" 
#3 Cách để in văn bản mà không phải thêm \ vào phía trước nháy đơn hay nháy kép hay các ký tự không được giải thích khác trong một chuỗi:
2.6.5 :001 > %q(Don't worry about escaping ' characters!)
 #=> "Don't worry about escaping ' characters!" 
2.6.5 :002 > %Q|"How are you?", he said|
 #=> "\"How are you?\", he said" 
2.6.5 :003 > %-This string literal ends with a newline\n-
 #=> "This string literal ends with a newline\n"
 #Viết heredoc (here doc là cách khia báo string nhiều dòng):
 query = %Q(
  Article about heredocs
)

query = <<-HTML.chomp
  Article about heredocs
HTML

type  = "healthy"
table = "food"
query = <<-SQL
  SELECT * FROM #{table}
  WHERE #{type} = true
SQL
#thực thi command với ubuntu shell, irb :

2.6.5 :020 > cmd = 'echo Hello World'
2.6.5 :020 > system( cmd )
Hello World
 => true
 #3.3 Arrays, Hashes, Range, Symbol
#Phần này trong sách toàn là trình bày những đường cơ bản, làm việc với mảng, hash, range quen rồi nên đọc phần này sẽ thấy ngán tận cổ.

#Ruby Hashes <=> Python Dictionary, trong C++, Java, PHP vẫn gọi là Associative Arrays, hash đơn giản là kiểu dữ liệu na ná như mảng nhưng index không hề mặc định mà được chỉ định.

#Symbol là 1 kiểu dữ liệu trong ruby, hiểu đơn giản là string không thể thay đổi trong ruby, ruby lưu tất cả symbol lên bộ nhớ bằng bảng symbol mỗi khi có 1 symbol mới được tạo.
#3.4 True, False, và Nil
#ruby khác ngôn ngữ khác ở chỗ 3 cái này đều là object,
#3.5 Objects - Những hình dạng hài hước
#3.5.1 Tham chiếu
#Bản chất thực sự khi làm việc với object trong ruby là làm việc với Tham chiếu của đối tượng.

#=> Khi gán giá trị(đối tượng) cho một biến => bản chất là gán tham chiếu của đối tượng vào biến đó. => Xử lý biến bản chất là xử lý đối tượng mà biến trỏ tới.


