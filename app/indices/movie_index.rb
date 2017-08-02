ThinkingSphinx::Index.define :movie, with: :active_record do
  indexes title, sortable: true
  indexes plot
end
