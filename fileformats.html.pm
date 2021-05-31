#lang pollen
◊define-meta[title]{ comprehension: FILE FORMATS }

◊section{ WHAT IS A FILE FORMAT?}

◊items[#:class "cloud red"]{
    ◊item{ mapping of data to bits }
    ◊item{ a way to organize information on a computer }
    ◊item{ a schema }
    ◊item{ an agreement }
    ◊item{ a ratified mode of interpretation }
    ◊item{ a use case }
    ◊item{ A 'digital material' for communicating data }
    ◊item{ presentation of data }
    ◊item{ structure of a file }
    ◊item{ standard for encoding a file for the computer }
    ◊item{ an intermediate interface between a producer and a consumer }
    ◊item{ parser for data }
    ◊item{ a key that points at instructions }
    ◊item{ a container for the particles ; a vessel }
}


◊section{ Thinking of files}

◊cartelera[#:direction "right" #:class "loader"]{
           ◊cartelera-texto{ colorspace editing files metadata for larger datasets movies compressed into glass movies genomic data files books a in library point-cloud data spectrograms personal archives screenshots expired project files from old projects made with obsolete versions of apps flash jpgs mp3 physical files paper photos xml Shapefiles GeoJSON GeoTIFF Geotagged social media geodatabases 2D/3D points lines & polygons biiiiiIIIIIG data my downloads folder text image sound sensor data PDFs text scripts xmls csvs images videos edls txt photos videos mp3s pdfs compressed folders downloads fonts graphs of text files }}

◊section{ How do we identify them?}

◊b[#:class "shadow2 cyan mid"]{where they resides}

With filesystems, using a system command, inodes, and hoping there is a "unique" non-colliding identifier  the domain to codomain. It has a place on the desktop.
And keyboard with help with command-I

◊b[#:class "shadow2 blue mid"]{or by passport}

May have name and location.May have metadata, file naming conventions, contents, metadata, filename, location, creator(?), modifier(?). Or even hash, over time across edits.By file extension? Or with a URL

◊b[#:class "shadow2 glow mid"]{what we perceive}

By lookin' at them ditto
By watching the screen by pointing-and-clicking on the GUI ◊b[#:class "shadow2 big"]{machine }

Our technology/software decides how we identify the files ◊b[#:class "shadow2 big"]{& mind }

Our memory or knowledge of the file


Our expectations about what ◊span[#:class "ver"]{we can do with it.}

◊section{ FAVORTIE FORMATS }

◊cartelera[#:class "roundcont"]{
    ◊cartelera-texto[#:class  "glow"]{
        png
        tiff,pdf
        usd
        .txt :~) & .html!<3
        Shapefile.zip
        yes
        pdf
        .html
        .pptx is really underrated <-- My favorite image editing software...
        not really; I hate all of them (I used to work in film)
        Wampum belts? <3
        not a file but i like folders
        folders can be files too!
        .hs
    }
}

◊section{ GRAPHIC FILES }


From BITMAPS

◊container[#:class "compression" ]{
◊fig[#:class "rendered comp" #:alt "bitmap" ]{smiley01.png}
◊fig[#:class "rendered comp" #:alt "bitmap" ]{smiley.jpeg}
}

to exploring layers of JPEG compression algorithm

◊container[#:class "compression" ]{
◊fig[#:class "rendered comp" #:alt "jpeg compression"   ]{jpeg-compression.png}
◊fig[#:class "rendered comp" #:alt "jpeg compression 1" ]{jpeg-compression-2.png}
◊fig[#:class "rendered comp" #:alt "jpeg compression 2" ]{jpeg-compression-3.png}
}
