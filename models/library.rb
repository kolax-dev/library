
class Library

	class << self	

		def name_reader_max_count(orders)
			arr = []
			orders.each do |item|
				arr.push(item.reader)			
			end
			
			flag = 0
			name = ''			
			counts = arr.group_by{|i| i}.each do |k,v|
			   if v.count > flag
			   	name = k
			   	flag = v.count			   
			   end
			end			
			
			"Кто часто берёт книгу: '#{name}'" 		
		end

		def popular_book(orders)
			arr = []
			orders.each do |item|
				arr.push(item.book)			
			end
			
			counts = arr.group_by{|i| i}.map{|k,v| [k, v.count] }		
			hash = Hash[*counts.flatten]		
			hash.invert.max.last
		end

		def popular_books(orders)  # функция для нахождения трёх самых популярных книг
			arr = []
			orders.each do |item|
				arr.push(item.book)			
			end
			
			counts = arr.group_by{|i| i}.map{|k,v| [k, v.count] }			
			res = counts.sort_by{ |key, value| value }.reverse

			res.first(3).to_h.keys
		end

	end
end