namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'output' unless Dir.exists? 'output'
    Dir.mkdir 'output/images' unless Dir.exists? 'output/images'
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/*/images/*").each do |image|
      FileUtils.copy(image, "output/images/" + File.basename(image))
      FileUtils.copy(image, "images/" + File.basename(image))
    end
  end

  desc 'build basic book formats'
  task :build => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor -D output css-3d-effects.adoc`
    puts " -- HTML output at output/css-3d-effects.html"

    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 -D output css-3d-effects.adoc`
    puts " -- Epub output at output/css-3d-effects.epub"

    puts "Converting to Mobi (kf8)..."
    `bundle exec asciidoctor-epub3 -a ebook-format=kf8 -D output css-3d-effects.adoc`
    puts " -- Mobi output at output/css-3d-effects.mobi"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf -D output css-3d-effects.adoc 2>/dev/null`
    puts " -- PDF  output at output/css-3d-effects.pdf"
  end

  desc 'build each chapter'
  task :build_chapter_html => :prebuild do
    puts "Converting chapters to HTML..."
    `bundle exec asciidoctor -a linkcss -D output book/*/*.adoc`
    puts " -- HTML output done in output/"
  end
end

task :default => "book:build"