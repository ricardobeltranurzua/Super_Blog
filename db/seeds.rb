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
