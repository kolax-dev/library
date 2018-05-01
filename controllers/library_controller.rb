# ########################################################
 # подключаем  классы(модели) для работы с данными
 	
 	require_relative '../models/Book'
 	require_relative '../models/Author'
 	require_relative '../models/Reader'
 	require_relative '../models/Order'

# динамически создаём коллекции объектов с которыми будем работать согласно нашим данным в хранилищах (файлы или БД)

	books = []
 
	File.open('files/books.txt', 'r') do |file|
	  file.each { |x| books.push(x) }
	end

	books.each_with_index do |item, index|
		temp = item.split(',')
			 books[index] = Book.new(temp[0],temp[1])			
	end

	authors = []
 
	File.open('files/authors.txt', 'r') do |file|
	  file.each { |x| authors.push(x) }
	end

	authors.each_with_index do |item, index|
		temp = item.split(',')
			 authors[index] = Author.new(temp[0],temp[1])			
	end

	readers = []
 
	File.open('files/readers.txt', 'r') do |file|
	  file.each { |x| readers.push(x) }
	end

	readers.each_with_index do |item, index|
		temp = item.split(',')
			 readers[index] = Reader.new(temp[0],temp[1],temp[2],temp[3],temp[4])			
	end

	orders = []
 
	File.open('files/orders.txt', 'r') do |file|
	  file.each { |x| orders.push(x) }
	end

	orders.each_with_index do |item, index|
		temp = item.split(',')
			 orders[index] = Order.new(temp[0],temp[1],temp[2])			
	end

# #########################################################################
# непосредственное выполнение самих задач 
# результаты записываем в файл result.txt

	# находим имя читателя который больше всех берёт книгу

	def name_reader_max_count(orders)
		arr = []
		orders.each do |item|
			arr.push(item.reader)			
		end
		
		counts = arr.group_by{|i| i}.map{|k,v| [k, v.count] }		
		hash = Hash[*counts.flatten]
		
		"Кто часто берёт книгу: '#{hash.invert.max.last}'" 		
	end


	File.open('files/result.txt', 'w') do |file| 
		file.puts name_reader_max_count(orders)
	end

	# находим самую популярную книгу

	def popular_book(orders)
		arr = []
		orders.each do |item|
			arr.push(item.book)			
		end
		
		counts = arr.group_by{|i| i}.map{|k,v| [k, v.count] }		
		hash = Hash[*counts.flatten]		
		hash.invert.max.last
	end

	name_book = popular_book(orders)
	author_book = ''
	books.each do |item|
		author_book = item.author  if item.title == name_book
	end
	
	File.open('files/result.txt', 'a+') do |file| 
		file.puts "Самая популярная книга: '#{name_book}' автора '#{author_book}' "
	end


	# находим людей кот. заказали одну и трёх популярных книг
	
	def popular_books(orders)  # функция для нахождения трёх самых популярных книг
		arr = []
		orders.each do |item|
			arr.push(item.book)			
		end
		
		counts = arr.group_by{|i| i}.map{|k,v| [k, v.count] }			
		res = counts.sort_by{ |key, value| value }.reverse

		res.first(3).to_h.keys
	end

	pop = popular_books(orders)

	people = []
	orders.each do |item|
		people.push(item.reader)  if pop.include? item.book			
	end

	people = people.uniq
	count_people = people.count

	File.open('files/result.txt', 'a+') do |file| 
		file.puts "Количество людей заказавших одну и трёх популярных книг: '#{count_people}' \nВот эти Люди: "
	end

	data_people = []
	readers.each do |item|
		data_people.push("'#{item.name}, '#{item.city}', '#{item.email}', '#{item.street}', '#{item.house}'")  if people.include? item.name
	end
	
	File.open('files/result.txt', 'a+') do |file| 
		file.puts data_people
	end