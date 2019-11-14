# module ActiveRecord
#   class Errors
#     alias :original_add :add
#     def add(attribute, msg = "")
#       original_add(attribute, msg.sub(/%\{fn\}/, ""))
#     end
#   end
# end