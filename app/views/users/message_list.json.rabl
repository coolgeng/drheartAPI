object false

node(:before) {@before}

child(@message => :message_list) do
	extends 'users/message'
end


node(:error_code) {0}
node(:msg) {""}