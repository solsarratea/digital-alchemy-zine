◊(define chapter-title (select-from-metas 'title here))
<!doctype html>
<html class="no-js" lang="en-GB">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>◊|title|: ◊|subtitle|</title>
    <meta name="description" content="◊|description|">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://code.cdn.mozilla.net/fonts/fira.css">
    <link rel='stylesheet' href='https://coolguy.website/aesthetic/fonts/fivo-sans/font.css' type='text/css'>
    <link rel='stylesheet' href='https://coolguy.website/aesthetic/fonts/charter/font.css' type='text/css'>
    <!-- <link rel='stylesheet' href='https://coolguy.website/aesthetic/stylesheets/soil.css' type='text/css'> -->
    <link rel='stylesheet' href='aesthetic/stylesheets/variables.css' type='text/css'>
    <link rel='stylesheet' href='aesthetic/stylesheets/work.css' type='text/css'>
  </head>
  <body>
    <main>
      <header>
        <a href="table-of-contents.html">
          <h1>◊|chapter-title|</h1>
        </a>
      </header>
      <article>
        ◊(->html doc #:splice? #t)
      </article>
      <nav>
        <ul>
          ◊(define prev-page (previous here))
          ◊(define previous? (not (eq? prev-page #f)))
          ◊(define next-page (next here))
          ◊(define next? (not (eq? next-page #f)))
          ◊(if (and previous? (not (eq? prev-page 'index.html)))
          ◊for/s[p '(prev-page)]{
          <li><a href=◊|prev-page|> ⇐ ◊(select-from-metas 'title prev-page)</a></li>}
          "<li class='invisible'></li>")
		      <li class='toc'>
            <a href="./table-of-contents.html" class='toc' title='return to table of contents'>
            <img src='aesthetic/assets/cover.png' alt='return to table of contents'/>
          </a>
          </li>
          ◊(if next?
          ◊for/s[p '(next-page) ]{
          <li><a href=◊|next-page|>◊(select-from-metas 'title next-page) ⇒</a></li>}
          "<li class='invisible'></li>")
        </ul>
      </nav>
    </main>
    <footer class="rainbow">
      <div class="paper">
        <p> This is “◊|title|: ◊|subtitle|”</p>

        <p>course given at <a href="https://hyperlink.academy">hyperlink.academy</a> | facilitated by  <a href="https://solquemal.com">sol sarratea</a></p>
        <p>⚡ ⚡ cool web-zine template was made in pollen by <a href="https://coolguy.website">coolguy</a></p>
        <a href="/">back 🏠</a>
      </div>
    </footer>
  </body>
</html>
