class Dog
  require 'pry'

  attr_accessor :name, :breed

  def initialize(id, name:, breed:)
    @name = name
    @breed = breed
    @id = id
  end
  #binding.pry


  def self.create_table
    DB[:conn].execute('DROP TABLE IF EXISTS dogs')
        Dog.create_table
        table_check_sql = "SELECT tbl_name FROM sqlite_master WHERE type='table' AND tbl_name='dogs';"
        expect(DB[:conn].execute(table_check_sql)[0]).to eq(['dogs'])
      end
    sql = <<-SQL

    CREATE TABLE  dogs (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT
    )
    SQL

  end


  # def self.drop_table(name, breed)
  #   DB[:conn].execute(sql)
  # end

 end 
