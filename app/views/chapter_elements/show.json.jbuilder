json.elements @chapter_elements.each do|element|
  json.id element.id
  json.element_type element.element_type
  json.element_text element.text
  json.element_url element.url.url
  json.element_priority element.priority
  json.element_lesson_id element.lesson_id
  json.element_chapter_id element.chapter_id
end