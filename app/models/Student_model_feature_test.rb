# require 'dm-migrations'
# require 'data_mapper'
# require 'dm-postgres-adapter'
#
# DataMapper::Logger.new($stdout, :debug)
# DataMapper.setup(:default, "postgres://localhost/database_play")
# # using ORM (object relational map) DataMapper
# # Ruby : Classes
# #        Instances
# #        Instance variables
# # Database Objects : Tables
# #                    Rows (tuples)
# #                    Columns (attributes)
#
#
# class Student
#   include DataMapper::Resource
#   property :id,     Serial
#   property :name,   String
# end
#
# DataMapper.finalize
# DataMapper.auto_upgrade!
#
# Student.create(name: 'Rhys', id: 0)
# Student.create(name: 'Charles', id: 2)
# Student.create(name: 'Ted', id: 69)
# student = Student.first(name: 'Ted')
# student.destroy
# Student.create(name: 'Charles', id: 3)
# Student.create(name: 'Charles', id: 1)
# student = Student.first(name: 'Charles')
# student.destroy
