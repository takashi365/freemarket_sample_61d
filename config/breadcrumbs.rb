crumb :root do
  link "メルカリ", root_path
end
# Users#index
crumb :users do
  link "マイページ", users_path
end

crumb :notification do
  link "お知らせ", user_notification_path
  parent :users
end

crumb :todo do
  link "やることリスト", user_todo_path
  parent :users
end

crumb :exhibited_items do
  link "出品した商品 - 出品中",user_exhibited_items_path
  parent :users
end

crumb :edit do
  link "プロフィール", edit_user_path
  parent :users
end

crumb :method_of_payment do
  link "支払い方法", user_method_of_payment_path
  parent :users
end

crumb :create_card do
  link "クレジットカード情報入力",user_create_card_path
  parent :method_of_payment
end

crumb :my_card do
  link "支払い方法", user_create_card_path
  parent :users
end

crumb :identification do
  link "本人情報の登録",user_identification_path
  parent :users
end

crumb :show do
  link "ログアウト", user_logout_path
  parent :users
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).