ThinkingSphinx::Index.define :user, with: :active_record do
  indexes name, sortable: true
  indexes current_title, sortable: true
  indexes current_position, sortable: true
  indexes summary, sortable: true

  has created_at, updated_at
end
