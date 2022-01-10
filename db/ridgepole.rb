create_table "contents", force: :cascade do |t|
	t.string "image"
  t.string "title", null: :false, default: ""
  t.string "description", null: :false, default: ""
end
