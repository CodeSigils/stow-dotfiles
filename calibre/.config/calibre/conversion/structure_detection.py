json:{
  "chapter": "//*[((name()='h1' or name()='h2') and re:test(., '\\s*((chapter|book|section|part)\\s+)|((prolog|prologue|epilogue)(\\s+|$))', 'i')) or @class = 'chapter']", 
  "remove_first_image": false, 
  "chapter_mark": "pagebreak", 
  "start_reading_at": null, 
  "insert_metadata": false, 
  "page_breaks_before": "//*[name()='h1' or name()='h2']", 
  "remove_fake_margins": true
}