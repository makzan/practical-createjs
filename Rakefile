namespace :book do
  desc 'prepare build'
  task :prebuild do
    Dir.mkdir 'output' unless Dir.exists? 'output'

    # Image folder
    Dir.mkdir 'output/images' unless Dir.exists? 'output/images'
    Dir.mkdir 'images' unless Dir.exists? 'images'
    Dir.glob("book/*/images/*").each do |image|
      FileUtils.copy(image, "output/images/" + File.basename(image))
      FileUtils.copy(image, "images/" + File.basename(image))
    end

    # Code folder
    Dir.mkdir 'output/code' unless Dir.exists? 'output/code'
    Dir.mkdir 'code' unless Dir.exists? 'code'
    Dir.glob("book/*/code/*").each do |codeFile|
      FileUtils.copy(codeFile, "output/code/" + File.basename(codeFile))
      FileUtils.copy(codeFile, "code/" + File.basename(codeFile))
    end

    # Stylesheet folder
    Dir.mkdir 'output/stylesheets' unless Dir.exists? 'output/stylesheets'
    Dir.glob("stylesheets/*").each do |cssFile|
      FileUtils.copy(cssFile, "output/stylesheets/" + File.basename(cssFile))
    end

    # Copy anything in public
    Dir.glob("public/*").each do |file|
      FileUtils.copy(file, "output/" + File.basename(file))
    end
  end

  desc 'build basic book formats'
  task :build => :prebuild do
    puts "Converting to HTML..."
    `bundle exec asciidoctor -a stylesheet=web.css -a stylesdir=stylesheets -D output practical-createjs.adoc`
    puts " -- HTML output at output/practical-createjs.html"

    puts "Converting to EPub..."
    `bundle exec asciidoctor-epub3 -D output practical-createjs.adoc`
    puts " -- Epub output at output/practical-createjs.epub"

    puts "Converting to Mobi (kf8)..."
    `bundle exec asciidoctor-epub3 -a ebook-format=kf8 -D output practical-createjs.adoc`
    puts " -- Mobi output at output/practical-createjs.mobi"

    puts "Converting to PDF... (this one takes a while)"
    `bundle exec asciidoctor-pdf -D output practical-createjs.adoc 2>/dev/null`
    puts " -- PDF  output at output/practical-createjs.pdf"
  end

  desc 'build each chapter'
  task :build_chapter_html => :prebuild do
    puts "Converting chapters to HTML..."
    `bundle exec asciidoctor -a stylesheet=index.css -a stylesdir=stylesheets -D output index.adoc`
    `bundle exec asciidoctor -a stylesheet=web.css -a stylesdir=stylesheets -a linkcss -D output book/*/0-*.adoc`
    puts " -- HTML output done in output/"
  end
end

task :default => "book:build"
