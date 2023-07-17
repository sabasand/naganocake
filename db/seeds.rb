
#管理者のダミーアカウントを生成
admin= [
{ email: 'sample@example.com', password: '000000' },
]
admin.each do |record|
 Admin.create!(record) unless Admin.find_by(email: record[:email])
end