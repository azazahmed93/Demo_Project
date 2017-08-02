ThinkingSphinx::Index.define :movie, with: :active_record, delta: true do
  indexes title, sortable: true
  indexes plot
  indexes year
  indexes actors.name, as: :actors
end
