◊(define chapter-title (select-from-metas 'title here))
<!doctype html>
<html class="no-js" lang="en-GB">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta property="og:title" content="Digital Alchemy Zine">
        <meta property="og:image" content="aesthetic/assets/social-media.gif">
        <link rel="image_src" href="aesthetic/assets/social-media.gif">
        <meta name="description" content="Chronicles of `Digital Alchemy Course` at hyperlink.academy">
        <meta property="og:description" content="Chronicles of `Digital Alchemy Course` at hyperlink.academy">
        <meta name="author" content="solsarratea">

         <!--Twitter config-->
        <meta name="twitter:title"  content="Digital Alchemy Zine">
        <meta name="twitter:description" content="Chronicles of `Digital Alchemy Course` at hyperlink.academy">
        <meta name="twitter:image"  content="aesthetic/assets/social-media.gif">
        <meta name="twitter:card" content="summary_large_image">

    <title>◊|title|: ◊|subtitle|</title>
    <meta name="description" content="◊|description|">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://code.cdn.mozilla.net/fonts/fira.css">
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
        <p> Virtual space for discussions of <a href="https://hyperlink.academy/courses/digital-alchemy/89" > ◊|title|: </a> course given at <a href="https://hyperlink.academy">hyperlink.academy</a> | facilitated by  <a href="https://solquemal.com">sol sarratea</a></p>
        <p>⚡ ⚡ cool web-zine template was made in <a href="https://docs.racket-lang.org/pollen/"> pollen</a> by <a href="https://coolguy.website">coolguy</a></p>
        <a href="/">back 🏠</a>
      </div>
    </footer>
  </body>
</html>
