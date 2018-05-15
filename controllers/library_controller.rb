# ########################################################
 # подключаем  классы(модели) для работы с данными
 	
 	require_relative '../models/book'
 	require_relative '../models/author'
 	require_relative '../models/reader'
 	require_relative '../models/order'
 	require_relative '../models/library'

 	# создание коллекций исходя из наших данных в БД или файле
	books = [] 	
	File.open('files/books.txt', 'r') do |file|
	  file.each do |x| 
	  	temp = x.split(',')
	  	books << Book.new(temp[0],temp[1])
	  end
	end

	authors = [] 
	File.open('files/authors.txt', 'r') do |file|
	  file.each do |x| 
	  	temp = x.split(',')
	  	authors << Author.new(temp[0],temp[1])
	  end
	end

	readers = [] 
	File.open('files/readers.txt', 'r') do |file|
	  file.each do |x| 
	  	temp = x.split(',')
	  	readers << Reader.new(temp[0],temp[1],temp[2],temp[3],temp[4])
	  end
	end

	orders = [] 
	File.open('files/orders.txt', 'r') do |file|
	  file.each do |x| 
	  	temp = x.split(',')
	  	orders << Order.new(temp[0],temp[1],temp[2])	
	  end
	end


# #########################################################################
# непосредственное выполнение самих задач 
# результаты записываем в файл result.txt
	
	# находим имя читателя который больше всех берёт книгу

	File.open('files/result.txt', 'w') do |file| 
		file.puts Library::name_reader_max_count(orders)
	end
	
	# находим самую популярную книгу
	
	name_book = Library::popular_book(orders)
	
	author_book = ''
	books.each do |item|
		author_book = item.author  if item.title == name_book
	end
	
	File.open('files/result.txt', 'a+') do |file| 
		file.puts "Самая популярная книга: '#{name_book}' автора '#{author_book}' "
	end

	# находим людей кот. заказали одну и трёх популярных книг	

	pop = Library::popular_books(orders)

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