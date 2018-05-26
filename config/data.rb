File.open('files/books.txt', 'w') do |file|
	file.puts 'Три мушкетёра,А.Дюма'
	file.puts 'Война и мир,Л.Толстой'
	file.puts 'Мастер и маргарита,М.Булгаков'
	file.puts 'Собачье сердце,М.Булгаков'
end
File.open('files/authors.txt', 'w') do |file|
	file.puts 'М.Булгаков,Биография Булгакова.......'
	file.puts 'Л.Толстой,Биография Толстова.......'
	file.puts 'А.Дюма,Биография Дюмы.......'
end
File.open('files/readers.txt', 'w') do |file|
	file.puts 'Вася,ttt@jgfg.com,Киев,Гагарина,13'
	file.puts 'Петя,ghghg@dfgfg.com,Днепр,Поля,4'
	file.puts 'Оля,deffg@fgbb.com,Днепр,Яворницкого,65'
	file.puts 'Вова,werwer@jgfg.com,Одесса,Дерибасовская,12'
	file.puts 'Юля,bbbttt@jfffffgfg.com,Харьков,Разрезная,88'
	file.puts 'Никита,eetttfgg@jfffffgfg.com,Харьков,Привокзальная,45'
end
File.open('files/orders.txt', 'w') do |file|
	t = Time.new.strftime("%Y-%m-%d %H:%M:%S")
	file.puts "Три мушкетёра,Вася,'#{t}'"
	file.puts "Три мушкетёра,Петя,'#{t}'"
	file.puts "Три мушкетёра,Оля,'#{t}'"
	file.puts "Война и мир,Вася,'#{t}'"
	file.puts "Собачье сердце,Никита,'#{t}'"
	file.puts "Война и мир,Юля,'#{t}'"
	file.puts "Три мушкетёра,Юля,'#{t}'"
	file.puts "Три мушкетёра,Вова,'#{t}'"
	file.puts "Мастер и маргарита,Вася,'#{t}'"
	file.puts "Война и мир,Петя,'#{t}'"
	file.puts "Мастер и маргарита,Оля,'#{t}'"
end
