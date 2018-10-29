class User < ApplicationRecord
	require 'csv'
	require 'activerecord-import/base'
	require 'activerecord-import/active_record/adapters/postgresql_adapter'
	def self.my_import(file)
		users = []
		if file
			CSV.foreach(file.path, headers: true) do |row|
				user = row.to_h
				begin
					oldUser = User.find(user['id'])
					User.delete(oldUser['id'])
					user['points'] = (user['points'].to_d + oldUser['points'].to_d)
					user['points'] = [user['points'],3126].min
					users << User.new(user)
				rescue ActiveRecord::RecordNotFound
					user['points'] = [user['points'].to_d,3126].min
					users << User.new(user)
				end
			end
			User.import users, recursive: true
		end
    end
end
