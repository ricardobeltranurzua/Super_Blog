# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# crear 5 Usuarios

#5.times do |nusuario|
#  u = User.new
 # u.first_name = "Usuario #{nusuario}"
  #u.last_name = ""
  #u.email_address =""
  #u.save

#end

#1.upto(5) do |usuario|
 # u = User.new
  #u.first_name = "Usuario #{nusuario}"
  #u.last_name = ""
  #u.email_address =""
  #u.save
#end



h = User.new
h.first_name = "Usuario 1"
h.last_name = "apellido 1"
h.email_address = "email@1.com"
h.save

h = User.new
h.first_name = "Usuario 2"
h.last_name = "apellido 2"
h.email_address = "email@2.com"
h.save

h = User.new
h.first_name = "Usuario 3"
h.last_name = "apellido 3"
h.email_address = "email@3.com"
h.save

h = User.new
h.first_name = "Usuario 4"
h.last_name = "apellido 4"
h.email_address = "email@4.com"
h.save

h = User.new
h.first_name = "Usuario 5"
h.last_name = "apellido 5"
h.email_address = "email@5.com"
h.save

puts "Usuarios creados: #{User.all.count}"
puts "tarea 10 hecha"

b = Blog.new
b.name = "Blog 1"
b.description = "descripcion 1"
b.save

b = Blog.new
b.name = "Blog 2"
b.description = "descripcion 2"
b.save

b = Blog.new
b.name = "Blog 3"
b.description = "descripcion 3"
b.save

b = Blog.new
b.name = "Blog 4"
b.description = "descripcion 4"
b.save

b = Blog.new
b.name = "Blog 5"
b.description = "descripcion 5"
b.save

#1.upto(5) do |nblog|
#b = Blog.new
#b.name = "Blog #{nblog}"
#b.description = "Description"
#b.save()
#end

puts "Blogs creados: #{User.all.count}"

puts "tarea 11 hecha"

# tarea 12.- Establecer que los primeros 3 blogs, pertenezcan al primer usuario.
#1.upto(3) do |nblog|
#ow = Owner.new
#ow.blog = Blog.where(name: "nblog").first
#ow.user = User.where(first_name:  "Usuario 1").first
#ow.save
#end

ow = Owner.new
ow.blog = Blog.where(name: "Blog 1").first
ow.user = User.where(first_name:  "Usuario 1").first
ow.save

ow = Owner.new
ow.blog = Blog.where(name: "Blog 2").first
ow.user = User.where(first_name:  "Usuario 1").first
ow.save

ow = Owner.new
ow.blog = Blog.where(name: "Blog 3").first
ow.user = User.where(first_name:  "Usuario 1").first
ow.save

puts User.where(first_name: "Usuario 1").first.owner.count

puts "tarea 12 hecha"

#tarea 13

ow = Owner.new
ow.blog = Blog.where(name: "Blog 4").first
ow.user = User.where(first_name:  "Usuario 2").first
ow.save

puts User.where(first_name: "Usuario 2").first.owner.count

puts User.where(first_name: "Usuario 2").first.owner
.where(blog: Blog.where(name: "Blog 4").first).count

puts "tarea 13 hecha "

ow = Owner.new
ow.blog = Blog.where(name: "Blog 5").first
ow.user = User.where(first_name: "Usuario 5").first
ow.save

puts User.where(first_name: "Usuario 5").first.owner.count

puts User.where(first_name: "Usuario 5")
.first.owner
.where(blog: Blog.where(name: "Blog 5").first).count

puts "tarea 14 hecha"

5.times do |nblog|
us = Owner.new
us.blog = Blog.where(name: "Blog #{nblog + 1}").first
us.user = User.where(first_name: "Usuario 3").first
us.save
end

# tambien con este codigo
# 1.upto(5) do |nblog|
#codigo interior
#end

puts User.where(first_name: "Usuario 3").first.owner.where(blog: Blog.where(name: ["Blog 1", "Blog 2", "Blog 3", "Blog 4", "Blog 5"])).count

puts User.where(first_name: "Usuario 3").first.owner.count

puts "tarea 15 hecha"

# tarea 15 Haz que el primer usuario cree tres publicaciones para el blog con id = 2. Recuerde que no debe hacer Publicacion.create(usuario: Usuario.first, blog_id: 2), sino algo como Publicacion.create(usuario: Usuario.first, blog: Blog.find(2)). Repito, nunca se debe hacer referencia a las claves foráneas en Rails.

3.times do |npost|
p = Post.new
p.title = "Post #{npost}"
p.content = "Contenido 1"
p.blog = Blog.where(name: "Blog 2").first
p.user = User.where(first_name: "Usuario 1").first
p.save
end

ue = User.where(first_name: "Usuario 1").first

be = Blog.where(name: "Blog 2").first

puts "Posts: #{Post.where(user: ue, blog: be).count}"

puts "tarea 16 hecha"

#  Tarea 17 Haz que el segundo usuario cree 5 publicaciones para el último blog.

us5 = User.where(first_name: "Usuario 2").first

ulb = Blog.where(name: "Blog 5").first

1.upto(5) do |npost|
  p = Post.new
  p.title = "Post #{npost}"
  p.content = "Contenido 1"
  p.user = us5
  p.blog = ulb
  p.save
end

puts "Post: #{Post.where(blog: ulb, user: us5).count}"
puts "tarea 17 hecha"

#tarea 18 Haz que el tercer usuario cree varias publicaciones en diferentes blogs.

us3 = User.where(first_name: "Usuario 3").first

Blog.all.each do |t|
  p = Post.new
  # p.blog = Blog.find(t.id)
  # p.blog = Blog.where(id: t.id).first
  p.blog = t
  p.user = us3
  p.title = "Titulo nnnnnnnn#{t}"
  p.content = "contenido nnnnnnnn#{t}"
  p.save
end

#puts "#{us3.post.count}"
puts "#{Post.where(user: us3).count}"

puts "tarea 18 hecha"

# Tarea 19 Haz que el tercer usuario cree 2 mensajes para la primera publicación creada y 3 mensajes para la segunda publicación creada.

primpost = Post.all.first
secpost = Post.all[1]

1.upto(2) do |t|
m = Message.new
m.post = primpost
m.user = us3
# usuario identificado mas arriba
m.author = "autor xxxxxxxxxx"
m.message = "mensaje xxxxxxxx"
m.save
end

1.upto(3) do |t|
m = Message.new
m.post = secpost
m.user = us3
# usuario identificado mas arriba
m.author = "autor xxxxxxxxxx"
m.message = "mensaje xxxxxxxx"
m.save
end

puts "#{Message.where(user: User.where(first_name: "Usuario 3")).count}"

puts Message.where(user: us3).count

puts us3.message.count

puts "tarea 19 hecha"

# tarea 20 Haz que el cuarto usuario cree 3 mensajes para la última publicación que tu creaste.

us4 = User.where(first_name: "Usuario 4").first

ultpost = Post.last

1.upto(3) do |t|
m = Message.new
m.post = ultpost
m.user = us4
# usuario identificado mas arriba
m.author = "autor xxxxxxxxxx"
m.message = "mensaje xxxxxxxx"
m.save
end

puts us4.message.count

puts "tarea 20 hecha"

# tarea 21 Cambie el propietario de la 2 publicación para que sea el último usuario.

secpost = Post.all[1]
puts "Antes => #{secpost.user.first_name}"
ultusu = User.all.last
secpost.user = ultusu
secpost.save
puts "Despues => #{secpost.user.first_name}"

puts "tarea 21 hecha"

# tarea 22 Cambie el contenido de la segunda publicación por algo diferente.

sp = Post.all[1]

sp.content = nil
sp.save

puts sp.errors.full_messages

puts "Contenido Modificado: #{sp.content}"
puts "tarea 22 hecha"

# tarea 23 Obtenga todos los blog que son propiedad del tercer usuario (haz que esto funcione con un simple Usuario.find(3).blogs).

us3 = User.find(3)
owners = us3.owner
blog_id = owners.pluck(:blog_id)
#blog_id => [45, 3 23]
blogs = Blog.where(id: blog_id)
puts "Blogs del usuario 3: #{blogs}"
puts "tarea 23 hecha"

# tarea 24 Obtenga todas las publicaciones que fueron creadas por el tercer usuario.

us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first
puts us3.post #has_many

puts Post.where(user: us3) #belongs to

puts "tarea 24 hecha"

#tarea 25 Obtenga todos los mensajes escritos por el tercer usuario.

us3 = User.find(3)
us3 = User.where(first_name: "Usuario 3").first

puts us3.message #has_many

puts Message.where(user: us3) #belongs to

puts "tarea 25 hecha"

# tarea 26  obtenga todas las publicaciones asociadas al blog con id = 5 y quién dejó cada publicación.





